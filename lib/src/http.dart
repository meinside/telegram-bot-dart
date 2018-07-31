/// HTTP helper functions and constants

import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'dart:mirrors';

import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

import './types.dart';

/// http response wrapper struct
class HttpResponse {
  int statusCode;
  String body;
  String reason;

  HttpResponse(this.statusCode, this.body, this.reason);

  /// Get body as a json object.
  Map<String, dynamic> toJson() {
    return jsonDecode(body);
  }
}

/// http client class
abstract class HttpClient {
  static const String _apiBaseUrl = "https://api.telegram.org/bot";
  static const String _fileBaseUrl = "https://api.telegram.org/file/bot";

  // functions to implement
  String botToken(); // return the bot's token
  void logVerbose(String message); // log verbose message
  void logError(String message); // log error message

  /// Send request to API server and return the response.
  Future<HttpResponse> _request(
      String method, Map<String, dynamic> params) async {
    String apiUrl = "${_apiBaseUrl}${botToken()}/${method}";

    params ??= Map<String, dynamic>();

    String body, reason;
    int statusCode;

    if (_checkIfFileParamExists(params)) {
      // multipart form data
      logVerbose(
          "sending multipart form data request to api url: ${apiUrl}, params: ${params}");

      try {
        var response = await _newMultipartRequest(apiUrl, params).send();
        statusCode = response.statusCode;
        body = await response.stream.bytesToString();
        reason = response.reasonPhrase;

        logVerbose(
            "multipart form data response: ${statusCode} ${reason} | ${body}");
      } catch (e) {
        body = "failed to send multipart form data request";
        reason = e.toString();

        logError("failed to send multipart form data request: ${e}");
      }
    } else {
      // www-form urlencoded
      Map<String, String> convertedParams = _convertParams(params);

      logVerbose(
          "sending www-form urlencoded data request to api url: ${apiUrl}, params: ${convertedParams}");

      await http.post(apiUrl, body: convertedParams).then((response) {
        statusCode = response.statusCode;
        body = response.body;
        reason = response.reasonPhrase;

        logVerbose("www-form response: ${statusCode} ${reason} | ${body}");
      }).catchError((e) {
        body = "failed to send www-form request";
        reason = e.toString();

        logError("failed to send www-form request: ${e}");
      });
    }

    statusCode ??= 500;
    body ??= "HTTP ${statusCode}";
    reason ??= "unknown/internal error";

    return HttpResponse(statusCode, body, reason);
  }

  /// Check if given http params contain file or not.
  bool _checkIfFileParamExists(Map<String, dynamic> params) {
    for (String key in params.keys) {
      // if it is a file, or a bytes array,
      if (params[key] is File || params[key] is List<int>) {
        return true;
      } else if (params[key] is InputFile) {
        // if it is an InputFile of filepath or bytes array,
        if (params[key].filepath != null ||
            (params[key].bytes != null && params[key].bytes.length > 0)) {
          return true;
        }
      }
    }

    return false;
  }

  /// Generate a http request for sending multipart form data.
  http.MultipartRequest _newMultipartRequest(
      String url, Map<String, dynamic> params) {
    http.MultipartRequest req = http.MultipartRequest("POST", Uri.parse(url));

    params.forEach((key, value) {
      if (value is File) {
        // file
        req.files.add(http.MultipartFile.fromBytes(key, value.readAsBytesSync(),
            filename: value.uri.pathSegments.last));
      } else if (value is List<int>) {
        // bytes array
        req.files.add(
            http.MultipartFile.fromBytes(key, value, filename: "${key}.file"));
      } else if (value is InputFile) {
        // InputFile
        if (value.filepath != null) {
          // read from filepath
          File file = File(value.filepath);
          req.files.add(http.MultipartFile.fromBytes(
              key, file.readAsBytesSync(),
              filename: file.uri.pathSegments.last));
        } else if (value.bytes != null && value.bytes.length > 0) {
          // read from bytes
          req.files.add(http.MultipartFile.fromBytes(key, value.bytes,
              filename: "${key}.file"));
        } else {
          req.fields[key] = value.toString();
        }
      } else {
        req.fields[key] = value.toString();
      }
    });

    return req;
  }

  /// Convert given Map<String, dynamic> [params] to Map<String, String> type for www-form data.
  Map<String, String> _convertParams(Map<String, dynamic> params) {
    Map<String, String> converted = Map<String, String>();
    params?.forEach((key, value) {
      String paramVal = null;

      // check given parameter's value:
      if (value is InputFile) {
        converted[key] = value.toString();
      } else {
        try {
          InstanceMirror mirror = reflect(value);

          // if it has `toJson()`, apply it
          if (mirror.type.declarations.values
              .map((DeclarationMirror declaration) =>
                  MirrorSystem.getName(declaration.simpleName))
              .contains("toJson")) {
            paramVal = jsonEncode(value.toJson());
          } else {
            // if it is an enum which has @JsonValue, use it
            ClassMirror classMirror = reflectClass(value.runtimeType);
            if (classMirror.isEnum) {
              DeclarationMirror declaration = classMirror.declarations.values
                  .firstWhere((DeclarationMirror declaration) =>
                      MirrorSystem.getName(declaration.simpleName) ==
                      value.toString().split(".").last);
              if (declaration != null) {
                for (InstanceMirror meta in declaration.metadata) {
                  if (meta.hasReflectee &&
                      meta.reflectee.runtimeType == JsonValue) {
                    paramVal = (meta.reflectee as JsonValue).value.toString();
                    break;
                  }
                }
              }
            }
          }
        } catch (e) {
          print("_convertParams exception: ${e}");
        }
      }

      // otherwise, fallback to the string value of it
      converted[key] = paramVal ?? value.toString();
    });

    return converted;
  }

  /// Extract error description from given [HttpResponse].
  String _errorDescriptionFrom(String method, HttpResponse response) {
    try {
      APIResponseBase res = APIResponseBase.fromJson(response.toJson());
      return "${method} failed with error: ${res.description}";
    } catch (e) {
      logVerbose(
          "failed to extract error description from http response: ${e} | ${response.body}");

      return "${method} failed with error: ${response.reason}";
    }
  }

  /// Send request for [APIResponseWebhookInfo] and fetch its result.
  Future<APIResponseWebhookInfo> _fetchWebhookInfo() async {
    const String method = "getWebhookInfo";
    String errStr;

    HttpResponse response = await _request(method, null);
    if (response.statusCode == 200) {
      try {
        return APIResponseWebhookInfo.fromJson(response.toJson());
      } catch (e) {
        errStr =
            "${method} failed with json parse error: ${e} (${response.body})";
      }
    } else {
      errStr = _errorDescriptionFrom(method, response);
    }

    logError(errStr);

    return APIResponseWebhookInfo(false, description: errStr);
  }

  /// Send request for [APIResponseUser] and fetch its result.
  Future<APIResponseUser> _fetchUser(
      String method, Map<String, dynamic> params) async {
    String errStr;

    HttpResponse response = await _request(method, params);
    if (response.statusCode == 200) {
      try {
        return APIResponseUser.fromJson(response.toJson());
      } catch (e) {
        errStr =
            "${method} failed with json parse error: ${e} (${response.body})";
      }
    } else {
      errStr =
          "${method} failed with HTTP ${response.statusCode}: ${response.reason}";
    }

    logError(errStr);

    return APIResponseUser(false, description: errStr);
  }

  /// Send request for [APIResponseMessage] and fetch its result.
  Future<APIResponseMessage> _fetchMessage(
      String method, Map<String, dynamic> params) async {
    String errStr;

    HttpResponse response = await _request(method, params);
    if (response.statusCode == 200) {
      try {
        return APIResponseMessage.fromJson(response.toJson());
      } catch (e) {
        errStr =
            "${method} failed with json parse error: ${e} (${response.body})";
      }
    } else {
      errStr = _errorDescriptionFrom(method, response);
    }

    logError(errStr);

    return APIResponseMessage(false, description: errStr);
  }

  /// Send request for [APIResponseMessage] or [APIResponseBool] and fetch its result.
  Future<APIResponseBase> _fetchMessageOrBool(
      String method, Map<String, dynamic> params) async {
    String errStr;

    HttpResponse response = await _request(method, params);
    if (response.statusCode == 200) {
      try {
        // try APIResponseMessage
        return APIResponseMessage.fromJson(response.toJson());
      } catch (e) {
        try {
          // try APIResponseBool
          return APIResponseBool.fromJson(response.toJson());
        } catch (e) {
          errStr =
              "${method} failed with json parse error: ${e} (${response.body})";
        }
      }
    } else {
      errStr = _errorDescriptionFrom(method, response);
    }

    logError(errStr);

    return APIResponseMessage(false, description: errStr);
  }

  /// Send request for [APIResponseMessages] and fetch its result.
  Future<APIResponseMessages> _fetchMessages(
      String method, Map<String, dynamic> params) async {
    String errStr;

    HttpResponse response = await _request(method, params);
    if (response.statusCode == 200) {
      try {
        return APIResponseMessages.fromJson(response.toJson());
      } catch (e) {
        errStr =
            "${method} failed with json parse error: ${e} (${response.body})";
      }
    } else {
      errStr = _errorDescriptionFrom(method, response);
    }

    logError(errStr);

    return APIResponseMessages(false, description: errStr);
  }

  /// Send request for [APIResponseUserProfilePhotos] and fetch its result.
  Future<APIResponseUserProfilePhotos> _fetchUserProfilePhotos(
      String method, Map<String, dynamic> params) async {
    String errStr;

    HttpResponse response = await _request(method, params);
    if (response.statusCode == 200) {
      try {
        return APIResponseUserProfilePhotos.fromJson(response.toJson());
      } catch (e) {
        errStr =
            "${method} failed with json parse error: ${e} (${response.body})";
      }
    } else {
      errStr = _errorDescriptionFrom(method, response);
    }

    logError(errStr);

    return APIResponseUserProfilePhotos(false, description: errStr);
  }

  /// Send request for [APIResponseUpdates] and fetch its result.
  Future<APIResponseUpdates> _fetchUpdates(
      String method, Map<String, dynamic> params) async {
    String errStr;

    HttpResponse response = await _request(method, params);
    if (response.statusCode == 200) {
      try {
        return APIResponseUpdates.fromJson(response.toJson());
      } catch (e) {
        errStr =
            "${method} failed with json parse error: ${e} (${response.body})";
      }
    } else {
      errStr = _errorDescriptionFrom(method, response);
    }

    logError(errStr);

    return APIResponseUpdates(false, description: errStr);
  }

  /// Send request for [APIResponseFile] and fetch its result.
  Future<APIResponseFile> _fetchFile(
      String method, Map<String, dynamic> params) async {
    String errStr;

    HttpResponse response = await _request(method, params);
    if (response.statusCode == 200) {
      try {
        return APIResponseFile.fromJson(response.toJson());
      } catch (e) {
        errStr =
            "${method} failed with json parse error: ${e} (${response.body})";
      }
    } else {
      errStr = _errorDescriptionFrom(method, response);
    }

    logError(errStr);

    return APIResponseFile(false, description: errStr);
  }

  /// Send request for [APIResponseChat] and fetch its result.
  Future<APIResponseChat> _fetchChat(
      String method, Map<String, dynamic> params) async {
    String errStr;

    HttpResponse response = await _request(method, params);
    if (response.statusCode == 200) {
      try {
        return APIResponseChat.fromJson(response.toJson());
      } catch (e) {
        errStr =
            "${method} failed with json parse error: ${e} (${response.body})";
      }
    } else {
      errStr = _errorDescriptionFrom(method, response);
    }

    logError(errStr);

    return APIResponseChat(false, description: errStr);
  }

  /// Send request for [APIResponseChatAdministrators] and fetch its result.
  Future<APIResponseChatAdministrators> _fetchChatAdministrators(
      String method, Map<String, dynamic> params) async {
    String errStr;

    HttpResponse response = await _request(method, params);
    if (response.statusCode == 200) {
      try {
        return APIResponseChatAdministrators.fromJson(response.toJson());
      } catch (e) {
        errStr =
            "${method} failed with json parse error: ${e} (${response.body})";
      }
    } else {
      errStr = _errorDescriptionFrom(method, response);
    }

    logError(errStr);

    return APIResponseChatAdministrators(false, description: errStr);
  }

  /// Send request for [APIResponseChatMember] and fetch its result.
  Future<APIResponseChatMember> _fetchChatMember(
      String method, Map<String, dynamic> params) async {
    String errStr;

    HttpResponse response = await _request(method, params);
    if (response.statusCode == 200) {
      try {
        return APIResponseChatMember.fromJson(response.toJson());
      } catch (e) {
        errStr =
            "${method} failed with json parse error: ${e} (${response.body})";
      }
    } else {
      errStr = _errorDescriptionFrom(method, response);
    }

    logError(errStr);

    return APIResponseChatMember(false, description: errStr);
  }

  /// Send request for [APIResponseInt] and fetch its result.
  Future<APIResponseInt> _fetchInt(
      String method, Map<String, dynamic> params) async {
    String errStr;

    HttpResponse response = await _request(method, params);
    if (response.statusCode == 200) {
      try {
        return APIResponseInt.fromJson(response.toJson());
      } catch (e) {
        errStr =
            "${method} failed with json parse error: ${e} (${response.body})";
      }
    } else {
      errStr = _errorDescriptionFrom(method, response);
    }

    logError(errStr);

    return APIResponseInt(false, description: errStr);
  }

  /// Send request for [APIResponseBool] and fetch its result.
  Future<APIResponseBool> _fetchBool(
      String method, Map<String, dynamic> params) async {
    String errStr;

    HttpResponse response = await _request(method, params);
    if (response.statusCode == 200) {
      try {
        return APIResponseBool.fromJson(response.toJson());
      } catch (e) {
        errStr =
            "${method} failed with json parse error: ${e} (${response.body})";
      }
    } else {
      errStr = _errorDescriptionFrom(method, response);
    }

    logError(errStr);

    return APIResponseBool(false, description: errStr);
  }

  /// Send request for [APIResponseString] and fetch its result.
  Future<APIResponseString> _fetchString(
      String method, Map<String, dynamic> params) async {
    String errStr;

    HttpResponse response = await _request(method, params);
    if (response.statusCode == 200) {
      try {
        return APIResponseString.fromJson(response.toJson());
      } catch (e) {
        errStr =
            "${method} failed with json parse error: ${e} (${response.body})";
      }
    } else {
      errStr = _errorDescriptionFrom(method, response);
    }

    logError(errStr);

    return APIResponseString(false, description: errStr);
  }

  /// Send request for [APIResponseGameHighScores] and fetch its result.
  Future<APIResponseGameHighScores> _fetchGameHighScores(
      String method, Map<String, dynamic> params) async {
    String errStr;

    HttpResponse response = await _request(method, params);
    if (response.statusCode == 200) {
      try {
        return APIResponseGameHighScores.fromJson(response.toJson());
      } catch (e) {
        errStr =
            "${method} failed with json parse error: ${e} (${response.body})";
      }
    } else {
      errStr = _errorDescriptionFrom(method, response);
    }

    logError(errStr);

    return APIResponseGameHighScores(false, description: errStr);
  }

  /// Send request for [APIResponseStickerSet] and fetch its result.
  Future<APIResponseStickerSet> _fetchStickerSet(
      String method, Map<String, dynamic> params) async {
    String errStr;

    HttpResponse response = await _request(method, params);
    if (response.statusCode == 200) {
      try {
        return APIResponseStickerSet.fromJson(response.toJson());
      } catch (e) {
        errStr =
            "${method} failed with json parse error: ${e} (${response.body})";
      }
    } else {
      errStr = _errorDescriptionFrom(method, response);
    }

    logError(errStr);

    return APIResponseStickerSet(false, description: errStr);
  }

  //////////////////////////////////////////////////
  //
  // Telegram API methods
  //
  // https://core.telegram.org/bots/api#available-methods

  /// Retrieve updates.
  ///
  /// https://core.telegram.org/bots/api#getupdates
  Future<APIResponseUpdates> getUpdates(
      {int offset, int limit, int timeout, List<String> allowedUpdates}) async {
    // optional params
    var params = Map<String, dynamic>();
    if (offset != null) {
      params["offset"] = offset;
    }
    if (limit != null) {
      params["limit"] = limit;
    }
    if (timeout != null) {
      params["timeout"] = timeout;
    }
    if (allowedUpdates != null) {
      params["allowedUpdates"] = allowedUpdates;
    }

    return _fetchUpdates("getUpdates", params);
  }

  /// Deletes webhook.
  ///
  /// ([getUpdates] will not work if webhook is set, so in that case you'll need to delete it)
  ///
  /// https://core.telegram.org/bots/api#deletewebhook
  Future<APIResponseBool> deleteWebhook() {
    logVerbose("deleting webhook...");

    return _fetchBool("deleteWebhook", null);
  }

  /// Get [WebhookInfo] of this bot.
  ///
  /// https://core.telegram.org/bots/api#getwebhookinfo
  Future<APIResponseWebhookInfo> getWebhookInfo() {
    return _fetchWebhookInfo();
  }

  /// Get the info of this bot.
  ///
  /// https://core.telegram.org/bots/api#getme
  Future<APIResponseUser> getMe() {
    return _fetchUser("getMe", null);
  }

  /// Send a message.
  ///
  /// - [chatId] can be one of [int](chat id) or [String](channel name).
  /// - [replyMarkup] can be one of [InlineKeyboardMarkup], [ReplyKeyboardMarkup], [ReplyKeyboardRemove], or [ForceReply].
  ///
  /// https://core.telegram.org/bots/api#sendmessage
  Future<APIResponseMessage> sendMessage(
    Object chatId,
    String text, {
    ParseMode parseMode,
    bool disableWebPagePreview,
    bool disableNotification,
    int replyToMessageId,
    ReplyMarkup replyMarkup,
  }) {
    Map<String, dynamic> params = Map<String, dynamic>();

    // essential params
    params["chat_id"] = chatId;
    params["text"] = text;

    // optional params
    if (parseMode != null) {
      params["parse_mode"] = parseMode;
    }
    if (disableWebPagePreview != null) {
      params["disable_web_page_preview"] = disableWebPagePreview;
    }
    if (disableNotification != null) {
      params["disable_notification"] = disableNotification;
    }
    if (replyToMessageId != null) {
      params["reply_to_message_id"] = replyToMessageId;
    }
    if (replyMarkup != null) {
      params["reply_markup"] = replyMarkup;
    }

    return _fetchMessage("sendMessage", params);
  }

  /// Forward a message.
  ///
  /// - [chatId] can be one of [int](chat id) or [String](channel name).
  /// - [fromChatId] can be one of [int](chat id) or [String](channel name).
  ///
  /// https://core.telegram.org/bots/api#forwardmessage
  Future<APIResponseMessage> forwardMessage(
    Object chatId,
    fromChatId,
    int messageId, {
    bool disableNotification,
  }) {
    // essential params
    Map<String, dynamic> params = Map<String, dynamic>();
    params["chat_id"] = chatId;
    params["from_chat_id"] = fromChatId;
    params["message_id"] = messageId;

    // optional params
    if (disableNotification != null) {
      params["disable_notification"] = disableNotification;
    }

    return _fetchMessage("forwardMessage", params);
  }

  /// Send a photo.
  ///
  /// - [chatId] can be one of [int](chat id) or [String](channel name).
  /// - [replyMarkup] can be one of [InlineKeyboardMarkup], [ReplyKeyboardMarkup], [ReplyKeyboardRemove], or [ForceReply].
  ///
  /// https://core.telegram.org/bots/api#sendphoto
  Future<APIResponseMessage> sendPhoto(
    Object chatId,
    InputFile photo, {
    String caption,
    ParseMode parseMode,
    bool disableNotification,
    int replyToMessageId,
    ReplyMarkup replyMarkup,
  }) {
    // essential params
    Map<String, dynamic> params = Map<String, dynamic>();
    params["chat_id"] = chatId;
    params["photo"] = photo;

    // optionl params
    if (caption != null) {
      params["caption"] = caption;
    }
    if (parseMode != null) {
      params["parse_mode"] = parseMode;
    }
    if (disableNotification != null) {
      params["disable_notification"] = disableNotification;
    }
    if (replyToMessageId != null) {
      params["reply_to_message_id"] = replyToMessageId;
    }
    if (replyMarkup != null) {
      params["reply_markup"] = replyMarkup;
    }

    return _fetchMessage("sendPhoto", params);
  }

  /// Send an audio file. (.mp3 format only, will be played with external players)
  ///
  /// - [chatId] can be one of [int](chat id) or [String](channel name).
  /// - [replyMarkup] can be one of [InlineKeyboardMarkup], [ReplyKeyboardMarkup], [ReplyKeyboardRemove], or [ForceReply].
  ///
  /// https://core.telegram.org/bots/api#sendaudio
  Future<APIResponseMessage> sendAudio(
    Object chatId,
    InputFile audio, {
    String caption,
    ParseMode parseMode,
    int duration,
    String performer,
    String title,
    InputFile thumb,
    bool disableNotification,
    int replyToMessageId,
    ReplyMarkup replyMarkup,
  }) {
    // essential params
    Map<String, dynamic> params = Map<String, dynamic>();
    params["chat_id"] = chatId;
    params["audio"] = audio;

    // optionl params
    if (caption != null) {
      params["caption"] = caption;
    }
    if (parseMode != null) {
      params["parse_mode"] = parseMode;
    }
    if (duration != null) {
      params["duration"] = duration;
    }
    if (performer != null) {
      params["performer"] = performer;
    }
    if (title != null) {
      params["title"] = title;
    }
    if (thumb != null) {
      // attach://xxxx
      const String _key = "thumb_attachment";
      params["thumb"] = "attach://${_key}";
      params[_key] = thumb;
    }
    if (disableNotification != null) {
      params["disable_notification"] = disableNotification;
    }
    if (replyToMessageId != null) {
      params["reply_to_message_id"] = replyToMessageId;
    }
    if (replyMarkup != null) {
      params["reply_markup"] = replyMarkup;
    }

    return _fetchMessage("sendAudio", params);
  }

  /// Send a general file.
  ///
  /// - [chatId] can be one of [int](chat id) or [String](channel name).
  /// - [replyMarkup] can be one of [InlineKeyboardMarkup], [ReplyKeyboardMarkup], [ReplyKeyboardRemove], or [ForceReply].
  ///
  /// https://core.telegram.org/bots/api#senddocument
  Future<APIResponseMessage> sendDocument(
    Object chatId,
    InputFile document,
    Map<String, dynamic> params, {
    InputFile thumb,
    String caption,
    ParseMode parseMode,
    bool disableNotification,
    int replyToMessageId,
    ReplyMarkup replyMarkup,
  }) {
    // essential params
    params ??= Map<String, dynamic>();
    params["chat_id"] = chatId;
    params["document"] = document;

    // optionl params
    if (thumb != null) {
      // attach://xxxx
      const String _key = "thumb_attachment";
      params["thumb"] = "attach://${_key}";
      params[_key] = thumb;
    }
    if (caption != null) {
      params["caption"] = caption;
    }
    if (parseMode != null) {
      params["parse_mode"] = parseMode;
    }
    if (disableNotification != null) {
      params["disable_notification"] = disableNotification;
    }
    if (replyToMessageId != null) {
      params["reply_to_message_id"] = replyToMessageId;
    }
    if (replyMarkup != null) {
      params["reply_markup"] = replyMarkup;
    }

    return _fetchMessage("sendDocument", params);
  }

  /// Send a sticker.
  ///
  /// - [chatId] can be one of [int](chat id) or [String](channel name).
  /// - [replyMarkup] can be one of [InlineKeyboardMarkup], [ReplyKeyboardMarkup], [ReplyKeyboardRemove], or [ForceReply].
  ///
  /// https://core.telegram.org/bots/api#sendsticker
  Future<APIResponseMessage> sendSticker(
    Object chatId,
    InputFile sticker, {
    bool disableNotification,
    int replyToMessageId,
    ReplyMarkup replyMarkup,
  }) {
    // essential params
    Map<String, dynamic> params = Map<String, dynamic>();
    params["chat_id"] = chatId;
    params["sticker"] = sticker;

    // optionl params
    if (disableNotification != null) {
      params["disable_notification"] = disableNotification;
    }
    if (replyToMessageId != null) {
      params["reply_to_message_id"] = replyToMessageId;
    }
    if (replyMarkup != null) {
      params["reply_markup"] = replyMarkup;
    }

    return _fetchMessage("sendSticker", params);
  }

  /// Get a sticker set.
  ///
  /// https://core.telegram.org/bots/api#getstickerset
  Future<APIResponseStickerSet> getStickerSet(String name) {
    // essential params
    Map<String, dynamic> params = Map<String, dynamic>();
    params["name"] = name;

    return _fetchStickerSet("getStickerSet", params);
  }

  /// Upload a sticker file.
  ///
  /// https://core.telegram.org/bots/api#uploadstickerfile
  Future<APIResponseFile> uploadStickerFile(int userId, InputFile sticker) {
    // essential params
    Map<String, dynamic> params = Map<String, dynamic>();
    params["user_id"] = userId;
    params["png_sticker"] = sticker;

    return _fetchFile("uploadStickerFile", params);
  }

  /// Create a new sticker set.
  ///
  /// https://core.telegram.org/bots/api#createnewstickerset
  Future<APIResponseBool> createNewStickerSet(
    int userId,
    String name,
    title,
    InputFile sticker,
    String emojis, {
    bool containsMasks,
    MaskPosition maskPosition,
  }) {
    // essential params
    Map<String, dynamic> params = Map<String, dynamic>();
    params["user_id"] = userId;
    params["name"] = name;
    params["title"] = title;
    params["png_sticker"] = sticker;
    params["emojis"] = emojis;

    // optional params
    if (containsMasks != null) {
      params["contains_masks"] = containsMasks;
    }
    if (maskPosition != null) {
      params["mask_position"] = maskPosition;
    }

    return _fetchBool("createNewStickerSet", params);
  }

  /// Add a sticker to set.
  ///
  /// https://core.telegram.org/bots/api#addstickertoset
  Future<APIResponseBool> addStickerToSet(
    int userId,
    String name,
    InputFile sticker,
    String emojis, {
    MaskPosition maskPosition,
  }) {
    // essential params
    Map<String, dynamic> params = Map<String, dynamic>();
    params["png_sticker"] = sticker;

    // optional params
    if (maskPosition != null) {
      params["mask_position"] = maskPosition;
    }

    return _fetchBool("addStickerToSet", params);
  }

  /// Set sticker position in set.
  ///
  /// https://core.telegram.org/bots/api#setstickerpositioninset
  Future<APIResponseBool> setStickerPositionInSet(
      String sticker, int position) {
    // essential params
    Map<String, dynamic> params = Map<String, dynamic>();
    params["sticker"] = sticker;
    params["position"] = position;

    return _fetchBool("setStickerPositionInSet", params);
  }

  /// Delete a sticker from set.
  ///
  /// https://core.telegram.org/bots/api#deletestickerfromset
  Future<APIResponseBool> deleteStickerFromSet(String sticker) {
    // essential params
    Map<String, dynamic> params = Map<String, dynamic>();
    params["sticker"] = sticker;

    return _fetchBool("deleteStickerFromSet", params);
  }

  /// Send a video file.
  ///
  /// - [chatId] can be one of [int](chat id) or [String](channel name).
  /// - [replyMarkup] can be one of [InlineKeyboardMarkup], [ReplyKeyboardMarkup], [ReplyKeyboardRemove], or [ForceReply].
  ///
  /// https://core.telegram.org/bots/api#sendvideo
  Future<APIResponseMessage> sendVideo(
    Object chatId,
    InputFile video, {
    int duration,
    int width,
    int height,
    InputFile thumb,
    String caption,
    ParseMode parseMode,
    bool supportsStreaming,
    bool disableNotification,
    int replyToMessageId,
    ReplyMarkup replyMarkup,
  }) {
    // essential params
    Map<String, dynamic> params = Map<String, dynamic>();
    params["chat_id"] = chatId;
    params["video"] = video;

    // optional params
    if (duration != null) {
      params["duration"] = duration;
    }
    if (width != null) {
      params["width"] = width;
    }
    if (height != null) {
      params["height"] = height;
    }
    if (thumb != null) {
      // attach://xxxx
      const String _key = "thumb_attachment";
      params["thumb"] = "attach://${_key}";
      params[_key] = thumb;
    }
    if (caption != null) {
      params["caption"] = caption;
    }
    if (parseMode != null) {
      params["parse_mode"] = parseMode;
    }
    if (supportsStreaming != null) {
      params["supports_streaming"] = supportsStreaming;
    }
    if (disableNotification != null) {
      params["disable_notification"] = disableNotification;
    }
    if (replyToMessageId != null) {
      params["reply_to_message_id"] = replyToMessageId;
    }
    if (replyMarkup != null) {
      params["reply_markup"] = replyMarkup;
    }

    return _fetchMessage("sendVideo", params);
  }

  /// Send an animation file.
  ///
  /// - [chatId] can be one of [int](chat id) or [String](channel name).
  /// - [replyMarkup] can be one of [InlineKeyboardMarkup], [ReplyKeyboardMarkup], [ReplyKeyboardRemove], or [ForceReply].
  ///
  /// https://core.telegram.org/bots/api#sendanimation
  Future<APIResponseMessage> sendAnimation(
    Object chatId,
    InputFile animation, {
    int duration,
    int width,
    int height,
    InputFile thumb,
    String caption,
    ParseMode parseMode,
    bool disableNotification,
    int replyToMessageId,
    ReplyMarkup replyMarkup,
  }) {
    // essential params
    Map<String, dynamic> params = Map<String, dynamic>();
    params["chat_id"] = chatId;
    params["animation"] = animation;

    // optional params
    if (duration != null) {
      params["duration"] = duration;
    }
    if (width != null) {
      params["width"] = width;
    }
    if (height != null) {
      params["height"] = height;
    }
    if (thumb != null) {
      // attach://xxxx
      const String _key = "thumb_attachment";
      params["thumb"] = "attach://${_key}";
      params[_key] = thumb;
    }
    if (caption != null) {
      params["caption"] = caption;
    }
    if (parseMode != null) {
      params["parse_mode"] = parseMode;
    }
    if (disableNotification != null) {
      params["disable_notification"] = disableNotification;
    }
    if (replyToMessageId != null) {
      params["reply_to_message_id"] = replyToMessageId;
    }
    if (replyMarkup != null) {
      params["reply_markup"] = replyMarkup;
    }

    return _fetchMessage("sendVideo", params);
  }

  /// Send a voice file. (.ogg format only, will be played with Telegram itself))
  ///
  /// - [chatId] can be one of [int](chat id) or [String](channel name).
  /// - [replyMarkup] can be one of [InlineKeyboardMarkup], [ReplyKeyboardMarkup], [ReplyKeyboardRemove], or [ForceReply].
  ///
  /// https://core.telegram.org/bots/api#sendvoice
  Future<APIResponseMessage> sendVoice(
    Object chatId,
    InputFile voice,
    Map<String, dynamic> params, {
    String caption,
    ParseMode parseMode,
    int duration,
    bool disableNotification,
    int replyToMessageId,
    ReplyMarkup replyMarkup,
  }) {
    // essential params
    params ??= Map<String, dynamic>();
    params["chat_id"] = chatId;
    params["voice"] = voice;

    // optional params
    if (caption != null) {
      params["caption"] = caption;
    }
    if (parseMode != null) {
      params["parse_mode"] = parseMode;
    }
    if (duration != null) {
      params["duration"] = duration;
    }
    if (disableNotification != null) {
      params["disable_notification"] = disableNotification;
    }
    if (replyToMessageId != null) {
      params["reply_to_message_id"] = replyToMessageId;
    }
    if (replyMarkup != null) {
      params["reply_markup"] = replyMarkup;
    }

    return _fetchMessage("sendVoice", params);
  }

  /// Send a video note.
  ///
  /// [videoNote] cannot be a remote http url (not supported yet)
  ///
  /// - [chatId] can be one of [int](chat id) or [String](channel name).
  /// - [replyMarkup] can be one of [InlineKeyboardMarkup], [ReplyKeyboardMarkup], [ReplyKeyboardRemove], or [ForceReply].
  ///
  /// NOTE: API returns 'Bad Request: wrong video note length' when length is not given / 2017.05.19.
  ///
  /// https://core.telegram.org/bots/api#sendvideonote
  Future<APIResponseMessage> sendVideoNote(
    Object chatId,
    InputFile videoNote, {
    int duration,
    int length,
    InputFile thumb,
    bool disableNotification,
    int replyToMessageId,
    ReplyMarkup replyMarkup,
  }) {
    // essential params
    Map<String, dynamic> params = Map<String, dynamic>();
    params["chat_id"] = chatId;
    params["video_note"] = videoNote;

    // optional params
    if (duration != null) {
      params["duration"] = duration;
    }
    if (length != null) {
      params["length"] = length;
    }
    if (thumb != null) {
      // attach://xxxx
      const String _key = "thumb_attachment";
      params["thumb"] = "attach://${_key}";
      params[_key] = thumb;
    }
    if (disableNotification != null) {
      params["disable_notification"] = disableNotification;
    }
    if (replyToMessageId != null) {
      params["reply_to_message_id"] = replyToMessageId;
    }
    if (replyMarkup != null) {
      params["reply_markup"] = replyMarkup;
    }

    return _fetchMessage("sendVideoNote", params);
  }

  /// Send a group of photos or videos as an album.
  ///
  /// - [chatId] can be one of [int](chat id) or [String](channel name).
  ///
  /// https://core.telegram.org/bots/api#sendmediagroup
  Future<APIResponseMessages> sendMediaGroup(
    Object chatId,
    List<InputMedia> media, {
    bool disableNotification,
    int replyToMessageId,
  }) {
    // essential params
    Map<String, dynamic> params = Map<String, dynamic>();
    params["chat_id"] = chatId;
    params["media"] = media;

    // optional params
    if (disableNotification != null) {
      params["disable_notification"] = disableNotification;
    }
    if (replyToMessageId != null) {
      params["reply_to_message_id"] = replyToMessageId;
    }

    return _fetchMessages("sendMediaGroup", params);
  }

  /// Send locations.
  ///
  /// - [chatId] can be one of [int](chat id) or [String](channel name).
  /// - [replyMarkup] can be one of [InlineKeyboardMarkup], [ReplyKeyboardMarkup], [ReplyKeyboardRemove], or [ForceReply].
  ///
  /// https://core.telegram.org/bots/api#sendlocation
  Future<APIResponseMessage> sendLocation(
    Object chatId,
    double latitude,
    longitude, {
    bool disableNotification,
    int replyToMessageId,
    ReplyMarkup replyMarkup,
  }) {
    // essential params
    Map<String, dynamic> params = Map<String, dynamic>();
    params["chat_id"] = chatId;
    params["latitude"] = latitude;
    params["longitude"] = longitude;

    // optional params
    if (disableNotification != null) {
      params["disable_notification"] = disableNotification;
    }
    if (replyToMessageId != null) {
      params["reply_to_message_id"] = replyToMessageId;
    }
    if (replyMarkup != null) {
      params["reply_markup"] = replyMarkup;
    }

    return _fetchMessage("sendLocation", params);
  }

  /// Send venues.
  ///
  /// - [chatId] can be one of [int](chat id) or [String](channel name).
  /// - [replyMarkup] can be one of [InlineKeyboardMarkup], [ReplyKeyboardMarkup], [ReplyKeyboardRemove], or [ForceReply].
  ///
  /// https://core.telegram.org/bots/api#sendvenue
  Future<APIResponseMessage> sendVenue(
    Object chatId,
    double latitude,
    longitude,
    String title,
    address, {
    String foursquareId,
    String foursquareType,
    bool disableNotification,
    int replyToMessageId,
    ReplyMarkup replyMarkup,
  }) {
    // essential params
    Map<String, dynamic> params = Map<String, dynamic>();
    params["chat_id"] = chatId;
    params["latitude"] = latitude;
    params["longitude"] = longitude;
    params["title"] = title;
    params["address"] = address;

    // optional params
    if (foursquareId != null) {
      params["foursquare_id"] = foursquareId;
    }
    if (foursquareType != null) {
      params["foursquare_type"] = foursquareType;
    }
    if (disableNotification != null) {
      params["disable_notification"] = disableNotification;
    }
    if (replyToMessageId != null) {
      params["reply_to_message_id"] = replyToMessageId;
    }
    if (replyMarkup != null) {
      params["reply_markup"] = replyMarkup;
    }

    return _fetchMessage("sendVenue", params);
  }

  /// Send contacts.
  ///
  /// - [chatId] can be one of [int](chat id) or [String](channel name).
  /// - [replyMarkup] can be one of [InlineKeyboardMarkup], [ReplyKeyboardMarkup], [ReplyKeyboardRemove], or [ForceReply].
  ///
  /// https://core.telegram.org/bots/api#sendcontact
  Future<APIResponseMessage> sendContact(
    Object chatId,
    String phoneNumber,
    firstName, {
    String lastName,
    String vCard,
    bool disableNotification,
    int replyToMessageId,
    ReplyMarkup replyMarkup,
  }) {
    // essential params
    Map<String, dynamic> params = Map<String, dynamic>();
    params["chat_id"] = chatId;
    params["phone_number"] = phoneNumber;
    params["first_name"] = firstName;

    // optional params
    if (lastName != null) {
      params["last_name"] = lastName;
    }
    if (vCard != null) {
      params["vcard"] = vCard;
    }
    if (disableNotification != null) {
      params["disable_notification"] = disableNotification;
    }
    if (replyToMessageId != null) {
      params["reply_to_message_id"] = replyToMessageId;
    }
    if (replyMarkup != null) {
      params["reply_markup"] = replyMarkup;
    }

    return _fetchMessage("sendContact", params);
  }

  /// Send chat actions.
  ///
  /// - [chatId] can be one of [int](chat id) or [String](channel name).
  ///
  /// https://core.telegram.org/bots/api#sendchataction
  Future<APIResponseBool> sendChatAction(Object chatId, ChatAction action) {
    // essential params
    Map<String, dynamic> params = Map<String, dynamic>();
    params["chat_id"] = chatId;
    params["action"] = action;

    return _fetchBool("sendChatAction", params);
  }

  /// Get user profile photos.
  ///
  /// https://core.telegram.org/bots/api#getuserprofilephotos
  Future<APIResponseUserProfilePhotos> getUserProfilePhotos(
    int userId, {
    int offset,
    int limit,
  }) {
    // essential params
    Map<String, dynamic> params = Map<String, dynamic>();
    params["user_id"] = userId;

    // optional params
    if (offset != null) {
      params["offset"] = offset;
    }
    if (limit != null) {
      params["limit"] = limit;
    }

    return _fetchUserProfilePhotos("getUserProfilePhotos", params);
  }

  /// Get file info and prepare for download.
  ///
  /// https://core.telegram.org/bots/api#getfile
  Future<APIResponseFile> getFile(String fileId) {
    // essential params
    Map<String, dynamic> params = Map<String, dynamic>();
    params["file_id"] = fileId;

    return _fetchFile("getFile", params);
  }

  /// Get download link from a given File.
  String getFileUrl(FileObject file) {
    return "${_fileBaseUrl}${botToken()}/${file.filePath}";
  }

  /// Kick a chat member.
  ///
  /// - [chatId] can be one of [int](chat id) or [String](channel name).
  ///
  /// https://core.telegram.org/bots/api#kickchatmember
  Future<APIResponseBool> kickChatMember(
    Object chatId,
    int userId, {
    int untilDate,
  }) {
    // essential params
    Map<String, dynamic> params = Map<String, dynamic>();
    params["chat_id"] = chatId;
    params["user_id"] = userId;

    // optional params
    if (untilDate != null) {
      params["until_date"] = untilDate;
    }

    return _fetchBool("kickChatMember", params);
  }

  /// Leave a chat.
  ///
  /// - [chatId] can be one of [int](chat id) or [String](channel name).
  ///
  /// https://core.telegram.org/bots/api#leavechat
  Future<APIResponseBool> leaveChat(Object chatId) {
    // essential params
    Map<String, dynamic> params = Map<String, dynamic>();
    params["chat_id"] = chatId;

    return _fetchBool("leaveChat", params);
  }

  /// Unban a chat member.
  ///
  /// - [chatId] can be one of [int](chat id) or [String](channel name).
  ///
  /// https://core.telegram.org/bots/api#unbanchatmember
  Future<APIResponseBool> unbanChatMember(Object chatId, int userId) {
    // essential params
    Map<String, dynamic> params = Map<String, dynamic>();
    params["chat_id"] = chatId;
    params["user_id"] = userId;

    return _fetchBool("unbanChatMember", params);
  }

  /// Restrict a chat member.
  ///
  /// - [chatId] can be one of [int](chat id) or [String](channel name).
  ///
  /// https://core.telegram.org/bots/api#restrictchatmember
  Future<APIResponseBool> restrictChatMember(
    Object chatId,
    int userId, {
    int untilDate,
    bool canSendMessages,
    bool canSendMediaMessages,
    bool canSendOtherMessages,
    bool canSendWebPagePreviews,
  }) {
    // essential params
    Map<String, dynamic> params = Map<String, dynamic>();
    params["chat_id"] = chatId;
    params["user_id"] = userId;

    // optional params
    if (untilDate != null) {
      params["until_date"] = untilDate;
    }
    if (canSendMessages != null) {
      params["can_send_messages"] = canSendMessages;
    }
    if (canSendMediaMessages != null) {
      params["can_send_media_messages"] = canSendMediaMessages;
    }
    if (canSendOtherMessages != null) {
      params["can_send_other_messages"] = canSendOtherMessages;
    }
    if (canSendWebPagePreviews != null) {
      params["can_send_web_page_previews"] = canSendWebPagePreviews;
    }

    return _fetchBool("restrictChatMember", params);
  }

  /// Promote a chat member.
  ///
  /// - [chatId] can be one of [int](chat id) or [String](channel name).
  ///
  /// options include: can_change_info, can_post_messages, can_edit_messages, can_delete_messages, can_invite_users, can_restrict_members, can_pin_messages, and can_promote_members
  ///
  /// https://core.telegram.org/bots/api#promotechatmember
  Future<APIResponseBool> promoteChatMember(
    Object chatId,
    int userId, {
    bool canChangeInfo,
    bool canPostMessages,
    bool canEditMessages,
    bool canDeleteMessages,
    bool canInviteUsers,
    bool canRestrictMembers,
    bool canPinMessages,
    bool canPromoteMembers,
  }) {
    // essential params
    Map<String, dynamic> params = Map<String, dynamic>();
    params["chat_id"] = chatId;
    params["user_id"] = userId;

    // optional params
    if (canChangeInfo != null) {
      params["can_change_info"] = canChangeInfo;
    }
    if (canPostMessages != null) {
      params["can_post_messages"] = canPostMessages;
    }
    if (canEditMessages != null) {
      params["can_edit_messages"] = canEditMessages;
    }
    if (canDeleteMessages != null) {
      params["can_delete_messages"] = canDeleteMessages;
    }
    if (canInviteUsers != null) {
      params["can_invite_users"] = canInviteUsers;
    }
    if (canRestrictMembers != null) {
      params["can_restrict_members"] = canRestrictMembers;
    }
    if (canPinMessages != null) {
      params["can_pin_messages"] = canPinMessages;
    }
    if (canPromoteMembers != null) {
      params["can_promote_members"] = canPromoteMembers;
    }

    return _fetchBool("promoteChatMember", params);
  }

  /// Export a chat invite link.
  ///
  /// - [chatId] can be one of [int](chat id) or [String](channel name).
  ///
  /// https://core.telegram.org/bots/api#exportchatinvitelink
  Future<APIResponseString> exportChatInviteLink(Object chatId) {
    // essential params
    Map<String, dynamic> params = Map<String, dynamic>();
    params["chat_id"] = chatId;

    return _fetchString("exportChatInviteLink", params);
  }

  /// Set a chat photo.
  ///
  /// - [chatId] can be one of [int](chat id) or [String](channel name).
  ///
  /// https://core.telegram.org/bots/api#setchatphoto
  Future<APIResponseBool> setChatPhoto(Object chatId, InputFile photo) {
    // essential params
    Map<String, dynamic> params = Map<String, dynamic>();
    params["chat_id"] = chatId;
    params["photo"] = photo;

    return _fetchBool("setChatPhoto", params);
  }

  /// Delete a chat photo.
  ///
  /// - [chatId] can be one of [int](chat id) or [String](channel name).
  ///
  /// https://core.telegram.org/bots/api#deletechatphoto
  Future<APIResponseBool> deleteChatPhoto(Object chatId) {
    // essential params
    Map<String, dynamic> params = Map<String, dynamic>();
    params["chat_id"] = chatId;

    return _fetchBool("deleteChatPhoto", params);
  }

  /// Set a chat title.
  ///
  /// - [chatId] can be one of [int](chat id) or [String](channel name).
  ///
  /// https://core.telegram.org/bots/api#setchattitle
  Future<APIResponseBool> setChatTitle(Object chatId, String title) {
    // essential params
    Map<String, dynamic> params = Map<String, dynamic>();
    params["chat_id"] = chatId;
    params["title"] = title;

    return _fetchBool("setChatTitle", params);
  }

  /// Set a chat description.
  ///
  /// - [chatId] can be one of [int](chat id) or [String](channel name).
  ///
  /// https://core.telegram.org/bots/api#setchatdescription
  Future<APIResponseBool> setChatDescription(
      Object chatId, String description) {
    // essential params
    Map<String, dynamic> params = Map<String, dynamic>();
    params["chat_id"] = chatId;
    params["description"] = description;

    return _fetchBool("setChatDescription", params);
  }

  /// PinChatMessage pins a chat message
  ///
  /// - [chatId] can be one of [int](chat id) or [String](channel name).
  ///
  /// https://core.telegram.org/bots/api#pinchatmessage
  Future<APIResponseBool> pinChatMessage(
    Object chatId,
    int messageId, {
    bool disableNotification,
  }) {
    // essential params
    Map<String, dynamic> params = Map<String, dynamic>();
    params["chat_id"] = chatId;
    params["message_id"] = messageId;

    // optional params
    if (disableNotification != null) {
      params["disable_notification"] = disableNotification;
    }

    return _fetchBool("pinChatMessage", params);
  }

  /// Unpin a chat message.
  ///
  /// - [chatId] can be one of [int](chat id) or [String](channel name).
  ///
  /// https://core.telegram.org/bots/api#unpinchatmessage
  Future<APIResponseBool> unpinChatMessage(Object chatId) {
    // essential params
    Map<String, dynamic> params = Map<String, dynamic>();
    params["chat_id"] = chatId;

    return _fetchBool("unpinChatMessage", params);
  }

  /// Get a chat.
  ///
  /// - [chatId] can be one of [int](chat id) or [String](channel name).
  ///
  /// https://core.telegram.org/bots/api#getchat
  Future<APIResponseChat> getChat(Object chatId) {
    // essential params
    Map<String, dynamic> params = Map<String, dynamic>();
    params["chat_id"] = chatId;

    return _fetchChat("getChat", params);
  }

  /// Get chat administrators.
  ///
  /// - [chatId] can be one of [int](chat id) or [String](channel name).
  ///
  /// https://core.telegram.org/bots/api#getchatadministrators
  Future<APIResponseChatAdministrators> getChatAdministrators(Object chatId) {
    // essential params
    Map<String, dynamic> params = Map<String, dynamic>();
    params["chat_id"] = chatId;

    return _fetchChatAdministrators("getChatAdministrators", params);
  }

  /// Get chat members' count.
  ///
  /// - [chatId] can be one of [int](chat id) or [String](channel name).
  ///
  /// https://core.telegram.org/bots/api#getchatmemberscount
  Future<APIResponseInt> getChatMembersCount(Object chatId) {
    // essential params
    Map<String, dynamic> params = Map<String, dynamic>();
    params["chat_id"] = chatId;

    return _fetchInt("getChatMembersCount", params);
  }

  /// Get a chat member.
  ///
  /// - [chatId] can be one of [int](chat id) or [String](channel name).
  ///
  /// https://core.telegram.org/bots/api#getchatmember
  Future<APIResponseChatMember> getChatMember(Object chatId, int userId) {
    // essential params
    Map<String, dynamic> params = Map<String, dynamic>();
    params["chat_id"] = chatId;
    params["user_id"] = userId;

    return _fetchChatMember("getChatMember", params);
  }

  /// Set a chat sticker set.
  ///
  /// - [chatId] can be one of [int](chat id) or [String](channel name).
  ///
  /// https://core.telegram.org/bots/api#setchatstickerset
  Future<APIResponseBool> setChatStickerSet(
      Object chatId, String stickerSetName) {
    // essential params
    Map<String, dynamic> params = Map<String, dynamic>();
    params["chat_id"] = chatId;
    params["sticker_set_name"] = stickerSetName;

    return _fetchBool("setChatStickerSet", params);
  }

  /// Delete a chat sticker set.
  ///
  /// - [chatId] can be one of [int](chat id) or [String](channel name).
  ///
  /// https://core.telegram.org/bots/api#deletechatstickerset
  Future<APIResponseBool> deleteChatStickerSet(Object chatId) {
    // essential params
    Map<String, dynamic> params = Map<String, dynamic>();
    params["chat_id"] = chatId;

    return _fetchBool("deleteChatStickerSet", params);
  }

  /// Answer a callback query.
  ///
  /// https://core.telegram.org/bots/api#answercallbackquery
  Future<APIResponseBool> answerCallbackQuery(
    String callbackQueryId, {
    String text,
    bool showAlert,
    String url,
    int cacheTime,
  }) {
    // essential params
    Map<String, dynamic> params = Map<String, dynamic>();
    params["callback_query_id"] = callbackQueryId;

    // optional params
    if (text != null) {
      params["text"] = text;
    }
    if (showAlert != null) {
      params["show_alert"] = showAlert;
    }
    if (url != null) {
      params["url"] = url;
    }
    if (cacheTime != null) {
      params["cache_time"] = cacheTime;
    }

    return _fetchBool("answerCallbackQuery", params);
  }

  ///////////////////////////////
  // Methods for updating messages
  //
  // https://core.telegram.org/bots/api#updating-messages

  /// Edit text of a message.
  ///
  /// Returned type is [APIResponseMessage] or [APIResponseBool].
  ///
  /// - [chatId] can be one of [int](chat id) or [String](channel name).
  /// - [replyMarkup] can be one of [InlineKeyboardMarkup], [ReplyKeyboardMarkup], [ReplyKeyboardRemove], or [ForceReply].
  ///
  /// NOTE:
  ///   required params: [chatId] + [messageId] (when [inlineMessageId] is not given)
  ///                 or [inlineMessageId] (when [chatId] & [messageId] is not given)
  ///
  /// https://core.telegram.org/bots/api#editmessagetext
  Future<APIResponseBase> editMessageText(
    String text, {
    Object chatId,
    int messageId,
    int inlineMessageId,
    ParseMode parseMode,
    bool disableWebPagePreview,
    ReplyMarkup replyMarkup,
  }) {
    // essential params
    Map<String, dynamic> params = Map<String, dynamic>();
    params["text"] = text;

    // optional params
    if (chatId != null) {
      params["chat_id"] = chatId;
    }
    if (messageId != null) {
      params["message_id"] = messageId;
    }
    if (inlineMessageId != null) {
      params["inline_message_id"] = inlineMessageId;
    }
    if (parseMode != null) {
      params["parse_mode"] = parseMode;
    }
    if (disableWebPagePreview != null) {
      params["disable_web_page_preview"] = disableWebPagePreview;
    }
    if (replyMarkup != null) {
      params["reply_markup"] = replyMarkup;
    }

    return _fetchMessageOrBool("editMessageText", params);
  }

  /// Edit caption of a message.
  ///
  /// Returned type is [APIResponseMessage] or [APIResponseBool].
  ///
  /// - [chatId] can be one of [int](chat id) or [String](channel name).
  /// - [replyMarkup] can be one of [InlineKeyboardMarkup], [ReplyKeyboardMarkup], [ReplyKeyboardRemove], or [ForceReply].
  ///
  /// NOTE:
  ///   required params: [chatId] + [messageId] (when [inlineMessageId] is not given)
  ///                 or [inlineMessageId] (when [chatId] & [messageId] is not given)
  ///
  /// https://core.telegram.org/bots/api#editmessagecaption
  Future<APIResponseBase> editMessageCaption(
    String caption, {
    Object chatId,
    int messageId,
    int inlineMessageId,
    ParseMode parseMode,
    ReplyMarkup replyMarkup,
  }) {
    // essential params
    Map<String, dynamic> params = Map<String, dynamic>();
    params["caption"] = caption;

    // optional params
    if (chatId != null) {
      params["chat_id"] = chatId;
    }
    if (messageId != null) {
      params["message_id"] = messageId;
    }
    if (inlineMessageId != null) {
      params["inline_message_id"] = inlineMessageId;
    }
    if (parseMode != null) {
      params["parse_mode"] = parseMode;
    }
    if (replyMarkup != null) {
      params["reply_markup"] = replyMarkup;
    }

    return _fetchMessageOrBool("editMessageCaption", params);
  }

  /// Edit media of a message.
  ///
  /// Returned type is [APIResponseMessage] or [APIResponseBool].
  ///
  /// - [chatId] can be one of [int](chat id) or [String](channel name).
  /// - [replyMarkup] can be one of [InlineKeyboardMarkup], [ReplyKeyboardMarkup], [ReplyKeyboardRemove], or [ForceReply].
  ///
  /// NOTE:
  ///   required params: [chatId] + [messageId] (when [inlineMessageId] is not given)
  ///                 or [inlineMessageId] (when [chatId] & [messageId] is not given)
  ///
  /// https://core.telegram.org/bots/api#editmessagemedia
  Future<APIResponseBase> editMessageMedia(
    InputMedia media, {
    Object chatId,
    int messageId,
    int inlineMessageId,
    ReplyMarkup replyMarkup,
  }) {
    // essential params
    Map<String, dynamic> params = Map<String, dynamic>();
    params["media"] = media;
    if (media.mediaAttachment != null) {
      // attach://xxxx
      params[media.mediaAttachmentKey] = media.mediaAttachment;
    }

    // optional params
    if (chatId != null) {
      params["chat_id"] = chatId;
    }
    if (messageId != null) {
      params["message_id"] = messageId;
    }
    if (inlineMessageId != null) {
      params["inline_message_id"] = inlineMessageId;
    }
    if (replyMarkup != null) {
      params["reply_markup"] = replyMarkup;
    }

    return _fetchMessageOrBool("editMessageMedia", params);
  }

  /// Edit reply markup of a message.
  ///
  /// Returned type is [APIResponseMessage] or [APIResponseBool].
  ///
  /// - [chatId] can be one of [int](chat id) or [String](channel name).
  /// - [replyMarkup] can be one of [InlineKeyboardMarkup], [ReplyKeyboardMarkup], [ReplyKeyboardRemove], or [ForceReply].
  ///
  /// NOTE:
  ///   required params: [chatId] + [messageId] (when [inlineMessageId] is not given)
  ///                 or [inlineMessageId] (when [chatId] & [messageId] is not given)
  ///
  /// https://core.telegram.org/bots/api#editmessagereplymarkup
  Future<APIResponseBase> editMessageReplyMarkup({
    Object chatId,
    int messageId,
    int inlineMessageId,
    ReplyMarkup replyMarkup,
  }) {
    // optional params
    Map<String, dynamic> params = Map<String, dynamic>();
    if (chatId != null) {
      params["chat_id"] = chatId;
    }
    if (messageId != null) {
      params["message_id"] = messageId;
    }
    if (inlineMessageId != null) {
      params["inline_message_id"] = inlineMessageId;
    }
    if (replyMarkup != null) {
      params["reply_markup"] = replyMarkup;
    }

    return _fetchMessageOrBool("editMessageReplyMarkup", params);
  }

  /// Edit live location of a message.
  ///
  /// Returned type is [APIResponseMessage] or [APIResponseBool].
  ///
  /// - [chatId] can be one of [int](chat id) or [String](channel name).
  /// - [replyMarkup] can be one of [InlineKeyboardMarkup], [ReplyKeyboardMarkup], [ReplyKeyboardRemove], or [ForceReply].
  ///
  /// NOTE:
  ///   required params: [chatId] + [messageId] (when [inlineMessageId] is not given)
  ///                 or [inlineMessageId] (when [chatId] & [messageId] is not given)
  ///
  /// https://core.telegram.org/bots/api#editmessagelivelocation
  Future<APIResponseBase> editMessageLiveLocation(
    double latitude,
    longitude, {
    Object chatId,
    int messageId,
    int inlineMessageId,
    ReplyMarkup replyMarkup,
  }) {
    // essential params
    Map<String, dynamic> params = Map<String, dynamic>();
    params["latitude"] = latitude;
    params["longitude"] = longitude;

    // optional params
    if (chatId != null) {
      params["chat_id"] = chatId;
    }
    if (messageId != null) {
      params["message_id"] = messageId;
    }
    if (inlineMessageId != null) {
      params["inline_message_id"] = inlineMessageId;
    }
    if (replyMarkup != null) {
      params["reply_markup"] = replyMarkup;
    }

    return _fetchMessageOrBool("editMessageLiveLocation", params);
  }

  /// Stop live location of a message.
  ///
  /// Returned type is [APIResponseMessage] or [APIResponseBool].
  ///
  /// - [chatId] can be one of [int](chat id) or [String](channel name).
  /// - [replyMarkup] can be one of [InlineKeyboardMarkup], [ReplyKeyboardMarkup], [ReplyKeyboardRemove], or [ForceReply].
  ///
  /// NOTE:
  ///   required params: [chatId] + [messageId] (when [inlineMessageId] is not given)
  ///                 or [inlineMessageId] (when [chatId] & [messageId] is not given)
  ///
  /// https://core.telegram.org/bots/api#stopmessagelivelocation
  Future<APIResponseBase> stopMessageLiveLocation({
    Object chatId,
    int messageId,
    int inlineMessageId,
    ReplyMarkup replyMarkup,
  }) {
    // optional params
    Map<String, dynamic> params = Map<String, dynamic>();
    if (chatId != null) {
      params["chat_id"] = chatId;
    }
    if (messageId != null) {
      params["message_id"] = messageId;
    }
    if (inlineMessageId != null) {
      params["inline_message_id"] = inlineMessageId;
    }
    if (replyMarkup != null) {
      params["reply_markup"] = replyMarkup;
    }

    return _fetchMessageOrBool("stopMessageLiveLocation", params);
  }

  /// Delete a message.
  ///
  /// - [chatId] can be one of [int](chat id) or [String](channel name).
  ///
  /// https://core.telegram.org/bots/api#deletemessage
  Future<APIResponseBool> deleteMessage(Object chatId, int messageId) {
    // essential params
    Map<String, dynamic> params = Map<String, dynamic>();
    params["chat_id"] = chatId;
    params["message_id"] = messageId;

    return _fetchBool("deleteMessage", params);
  }

  /// Send answers to an inline query.
  ///
  /// - [results] = [List] of [InlineQueryResultArticle], [InlineQueryResultPhoto], [InlineQueryResultGif], [InlineQueryResultMpeg4Gif], or [InlineQueryResultVideo].
  ///
  /// https://core.telegram.org/bots/api#answerinlinequery
  Future<APIResponseBool> answerInlineQuery(
    String inlineQueryId,
    List<InlineQueryResult> results, {
    int cacheTime,
    bool isPersonal,
    String nextOffset,
    String switchPmText,
    String switchPmParameter,
  }) {
    // essential params
    Map<String, dynamic> params = Map<String, dynamic>();
    params["inline_query_id"] = inlineQueryId;
    params["results"] = results;

    // optional params
    if (cacheTime != null) {
      params["cache_time"] = cacheTime;
    }
    if (isPersonal != null) {
      params["is_personal"] = isPersonal;
    }
    if (nextOffset != null) {
      params["next_offset"] = nextOffset;
    }
    if (switchPmText != null) {
      params["switch_pm_text"] = switchPmText;
    }
    if (switchPmParameter != null) {
      params["switch_pm_parameter"] = switchPmParameter;
    }

    return _fetchBool("answerInlineQuery", params);
  }

  /// Send an invoice.
  ///
  /// - [replyMarkup] can be one of [InlineKeyboardMarkup], [ReplyKeyboardMarkup], [ReplyKeyboardRemove], or [ForceReply].
  ///
  /// https://core.telegram.org/bots/api#sendinvoice
  Future<APIResponseMessage> sendInvoice(
    int chatId,
    String title,
    description,
    payload,
    providerToken,
    startParameter,
    currency,
    List<LabeledPrice> prices, {
    String providerData,
    String photoUrl,
    int photoSize,
    int photoWidth,
    int photoHeight,
    bool needName,
    bool needPhoneNumber,
    bool needEmail,
    bool needShippingAddress,
    bool isFlexible,
    bool disableNotification,
    int replyToMessageId,
    ReplyMarkup replyMarkup,
  }) {
    // essential params
    Map<String, dynamic> params = Map<String, dynamic>();
    params["chat_id"] = chatId;
    params["title"] = title;
    params["description"] = description;
    params["payload"] = payload;
    params["provider_token"] = providerToken;
    params["start_parameter"] = startParameter;
    params["currency"] = currency;
    params["prices"] = prices;

    // optional params
    if (providerData != null) {
      params["provider_data"] = providerData;
    }
    if (photoUrl != null) {
      params["photo_url"] = photoUrl;
    }
    if (photoSize != null) {
      params["photo_size"] = photoSize;
    }
    if (photoWidth != null) {
      params["photo_width"] = photoWidth;
    }
    if (photoHeight != null) {
      params["photo_height"] = photoHeight;
    }
    if (needName != null) {
      params["need_name"] = needName;
    }
    if (needPhoneNumber != null) {
      params["need_phone_number"] = needPhoneNumber;
    }
    if (needEmail != null) {
      params["need_email"] = needEmail;
    }
    if (needShippingAddress != null) {
      params["need_shipping_address"] = needShippingAddress;
    }
    if (isFlexible != null) {
      params["is_flexible"] = isFlexible;
    }
    if (disableNotification != null) {
      params["disable_notification"] = disableNotification;
    }
    if (replyToMessageId != null) {
      params["reply_to_message_id"] = replyToMessageId;
    }
    if (replyMarkup != null) {
      params["reply_markup"] = replyMarkup;
    }

    return _fetchMessage("sendInvoice", params);
  }

  /// Answer a shipping query.
  ///
  /// NOTE: If [ok] is true, [shippingOptions] should be provided. Otherwise, [errorMessage] should be provided.
  ///
  /// https://core.telegram.org/bots/api#answershippingquery
  Future<APIResponseBool> answerShippingQuery(
    String shippingQueryId,
    bool ok, {
    List<ShippingOption> shippingOptions,
    String errorMessage,
  }) {
    // essential params
    Map<String, dynamic> params = Map<String, dynamic>();
    params["shipping_query_id"] = shippingQueryId;
    params["ok"] = ok;

    // optional params
    if (shippingOptions != null) {
      params["shipping_options"] = shippingOptions;
    }
    if (errorMessage != null) {
      params["error_message"] = errorMessage;
    }

    return _fetchBool("answerShippingQuery", params);
  }

  /// Answer a pre-checkout query.
  ///
  /// NOTE: If [ok] is false, [errorMessage] should be provided.
  ///
  /// https://core.telegram.org/bots/api#answerprecheckoutquery
  Future<APIResponseBool> answerPreCheckoutQuery(
    String preCheckoutQueryId,
    bool ok, {
    String errorMessage,
  }) {
    // essential params
    Map<String, dynamic> params = Map<String, dynamic>();
    params["pre_checkout_query_id"] = preCheckoutQueryId;
    params["ok"] = ok;

    // optional params
    if (errorMessage != null) {
      params["error_message"] = errorMessage;
    }

    return _fetchBool("answerPreCheckoutQuery", params);
  }

  /// Send a game.
  ///
  /// - [chatId] can be one of [int](chat id) or [String](channel name).
  /// - [replyMarkup] can be one of [InlineKeyboardMarkup], [ReplyKeyboardMarkup], [ReplyKeyboardRemove], or [ForceReply].
  ///
  /// https://core.telegram.org/bots/api#sendgame
  Future<APIResponseMessage> sendGame(
    Object chatId,
    String gameShortName, {
    bool disableNotification,
    int replyToMessageId,
    ReplyMarkup replyMarkup,
  }) {
    // essential params
    Map<String, dynamic> params = Map<String, dynamic>();
    params["chat_id"] = chatId;
    params["game_short_name"] = gameShortName;

    // optional params
    if (disableNotification != null) {
      params["disable_notification"] = disableNotification;
    }
    if (replyToMessageId != null) {
      params["reply_to_message_id"] = replyToMessageId;
    }
    if (replyMarkup != null) {
      params["reply_markup"] = replyMarkup;
    }

    return _fetchMessage("sendGame", params);
  }

  /// Set score of a game.
  ///
  /// Returned type is [APIResponseMessage] or [APIResponseBool].
  ///
  /// NOTE:
  ///   required params: [chatId] + [messageId] (when [inlineMessageId] is not given)
  ///                 or [inlineMessageId] (when [chatId] & [messageId] is not given)
  ///
  /// other options: force, and disable_edit_message
  ///
  /// https://core.telegram.org/bots/api#setgamescore
  Future<APIResponseBase> setGameScore(
    int userId,
    int score, {
    Object chatId,
    int messageId,
    int inlineMessageId,
    bool force,
    bool disableEditMessage,
  }) {
    // essential params
    Map<String, dynamic> params = Map<String, dynamic>();
    params["user_id"] = userId;
    params["score"] = score;

    // optional params
    if (chatId != null) {
      params["chat_id"] = chatId;
    }
    if (messageId != null) {
      params["message_id"] = messageId;
    }
    if (inlineMessageId != null) {
      params["inlineMessageId"] = inlineMessageId;
    }
    if (force != null) {
      params["force"] = force;
    }
    if (disableEditMessage != null) {
      params["disable_edit_message"] = disableEditMessage;
    }

    return _fetchMessageOrBool("setGameScore", params);
  }

  /// Get high scores of a game.
  ///
  /// NOTE:
  ///   required params: [chatId] + [messageId] (when [inlineMessageId] is not given)
  ///                 or [inlineMessageId] (when [chatId] & [messageId] is not given)
  ///
  /// https://core.telegram.org/bots/api#getgamehighscores
  Future<APIResponseGameHighScores> getGameHighScores(
    int userId, {
    Object chatId,
    int messageId,
    int inlineMessageId,
  }) {
    // essential params
    Map<String, dynamic> params = Map<String, dynamic>();
    params["user_id"] = userId;

    // optional params
    if (chatId != null) {
      params["chat_id"] = chatId;
    }
    if (messageId != null) {
      params["message_id"] = messageId;
    }
    if (inlineMessageId != null) {
      params["inline_message_id"] = inlineMessageId;
    }

    return _fetchGameHighScores("getGameHighScores", params);
  }
}
