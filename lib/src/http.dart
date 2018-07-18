/// HTTP helper functions and constants

import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'package:http/http.dart' as http;

import './types.dart';

/// http response wrapper struct
class HttpResponse {
  int statusCode;
  String body;
  String reason;

  HttpResponse(this.statusCode, this.body, this.reason);

  /// Get body as a json object.
  Map<String, dynamic> toJson() {
    return JSON.decode(body);
  }
}

/// http client class
abstract class HttpClient {
  static const String _apiBaseUrl = "https://api.telegram.org/bot";
  static const String _fileBaseUrl = "https://api.telegram.org/file/bot";

  // functions to implement
  String botToken();  // return the bot's token
  void logVerbose(String message);  // log verbose message
  void logError(String message);  // log error message

  /// Send request to API server and return the response.
  Future<HttpResponse> _request(String method, Map<String, dynamic> params) async {
    String apiUrl = "${_apiBaseUrl}${botToken()}/${method}";

    params ??= new Map<String, dynamic>();

    logVerbose("sending request to api url: ${apiUrl}, params: ${params}");

    String body, reason;
    int statusCode;

    if (_checkIfFileParamExists(params)) {  // multipart form data
      try {
	var response = await _newMultipartRequest(apiUrl, params).send();
	statusCode = response.statusCode;
	body = await response.stream.bytesToString();
	reason = response.reasonPhrase;

	logVerbose("multipart form data response: ${statusCode} ${reason} | ${body}");
      } catch (e) {
	body = "failed to send multipart form data request";
	reason = e.toString();

	logError("failed to send multipart form data request: ${e}");
      }
    } else {  // www-form urlencoded
      await http
	.post(apiUrl, body: _convertParams(params))
	.then((response) {
	  statusCode = response.statusCode;
	  body = response.body;
	  reason = response.reasonPhrase;

	  logVerbose("www-form response: ${statusCode} ${reason} | ${body}");
	})
	.catchError((e) {
	  body = "failed to send www-form request";
	  reason = e.toString();

	  logError("failed to send www-form request: ${e}");
	});
    }

    statusCode ??= 500;
    body ??= "HTTP ${statusCode}";
    reason ??= "unknown/internal error";

    return new HttpResponse(statusCode, body, reason);
  }

  /// Check if given http params contain file or not.
  bool _checkIfFileParamExists(Map<String, dynamic> params) {
    for (String key in params.keys) {
      // if it is a file, or a bytes array,
      if (params[key] is File || params[key] is List<int>) {
	return true;
      }
    }

    return false;
  }

  /// Generate a http request for sending multipart form data.
  http.MultipartRequest _newMultipartRequest(String url, Map<String, dynamic> params) {
    http.MultipartRequest req = new http.MultipartRequest("POST", Uri.parse(url));

    params.forEach((key, value) {
      if (value is File) {	// file
	req.files.add(
	    new http.MultipartFile.fromBytes(key, value.readAsBytesSync(), filename: value.uri.pathSegments.last));
      } else if (value is List<int>) {	// bytes array
	req.files.add(
	    new http.MultipartFile.fromBytes(key, value, filename: "${key}.file"));
      } else {
	req.fields[key] = value.toString();
      }
    });

    return req;
  }

  /// Convert given Map<String, dynamic> [params] to Map<String, String> type.
  Map<String, String> _convertParams(Map<String, dynamic> params) {
    Map<String, String> converted = new Map<String, String>();
    params?.forEach((key, value) {
      converted[key] = value.toString();
    });

    return converted;
  }

  /// Check if given [path] is http/s url
  bool _isHttpUrl(String path) {
    if (path.startsWith("http://") || path.startsWith("https://")) {
      return true;
    }
    return false;
  }

  /// Send request for [APIResponse] and fetch its result.
  Future<APIResponse> _fetchResponse(String method, Map<String, dynamic> params) async {
    String errStr;

    HttpResponse response = await _request(method, params);
    if (response.statusCode == 200) {
      try {
	return APIResponse.fromJson(response.toJson());
      } catch(e) {
	errStr = "${method} failed with json parse error: ${e} (${response.body})";
      }
    } else {
      errStr = "${method} failed with error: ${response.reason}";
    }

    logError(errStr);

    return new APIResponse(false, description: errStr);
  }

  /// Send request for [APIResponseWebhookInfo] and fetch its result.
  Future<APIResponseWebhookInfo> _fetchWebhookInfo() async {
    const String method = "getWebhookInfo";
    String errStr;

    HttpResponse response = await _request(method, null);
    if (response.statusCode == 200) {
      try {
	return APIResponseWebhookInfo.fromJson(response.toJson());
      } catch(e) {
	errStr = "${method} failed with json parse error: ${e} (${response.body})";
      }
    } else {
      errStr = "${method} failed with error: ${response.reason}";
    }

    logError(errStr);

    return new APIResponseWebhookInfo(false, description: errStr);
  }

  /// Send request for [APIResponseUser] and fetch its result.
  Future<APIResponseUser> _fetchUser(String method, Map<String, dynamic> params) async {
    String errStr;

    HttpResponse response = await _request(method, params);
    if (response.statusCode == 200) {
      try {
	return APIResponseUser.fromJson(response.toJson());
      } catch(e) {
	errStr = "${method} failed with json parse error: ${e} (${response.body})";
      }
    } else {
      errStr = "${method} failed with HTTP ${response.statusCode}: ${response.reason}";
    }

    logError(errStr);

    return new APIResponseUser(false, description: errStr);
  }

  /// Send request for [APIResponseMessage] and fetch its result.
  Future<APIResponseMessage> _fetchMessage(String method, Map<String, dynamic> params) async {
    String errStr;

    HttpResponse response = await _request(method, params);
    if (response.statusCode == 200) {
      try {
	return APIResponseMessage.fromJson(response.toJson());
      } catch(e) {
	errStr = "${method} failed with json parse error: ${e} (${response.body})";
      }
    } else {
      errStr = "${method} failed with error: ${response.reason}";
    }

    logError(errStr);

    return new APIResponseMessage(false, description: errStr);
  }

  /// Send request for [APIResponseMessages] and fetch its result.
  Future<APIResponseMessages> _fetchMessages(String method, Map<String, dynamic> params) async {
    String errStr;

    HttpResponse response = await _request(method, params);
    if (response.statusCode == 200) {
      try {
	return APIResponseMessages.fromJson(response.toJson());
      } catch(e) {
	errStr = "${method} failed with json parse error: ${e} (${response.body})";
      }
    } else {
      errStr = "${method} failed with error: ${response.reason}";
    }

    logError(errStr);

    return new APIResponseMessages(false, description: errStr);
  }

  /// Send request for [APIResponseUserProfilePhotos] and fetch its result.
  Future<APIResponseUserProfilePhotos> _fetchUserProfilePhotos(String method, Map<String, dynamic> params) async {
    String errStr;

    HttpResponse response = await _request(method, params);
    if (response.statusCode == 200) {
      try {
	return APIResponseUserProfilePhotos.fromJson(response.toJson());
      } catch(e) {
	errStr = "${method} failed with json parse error: ${e} (${response.body})";
      }
    } else {
      errStr = "${method} failed with error: ${response.reason}";
    }

    logError(errStr);

    return new APIResponseUserProfilePhotos(false, description: errStr);
  }

  /// Send request for [APIResponseUpdates] and fetch its result.
  Future<APIResponseUpdates> _fetchUpdates(String method, Map<String, dynamic> params) async {
    String errStr;

    HttpResponse response = await _request(method, params);
    if (response.statusCode == 200) {
      try {
	return APIResponseUpdates.fromJson(response.toJson());
      } catch(e) {
	errStr = "${method} failed with json parse error: ${e} (${response.body})";
      }
    } else {
      errStr = "${method} failed with error: ${response.reason}";
    }

    logError(errStr);

    return new APIResponseUpdates(false, description: errStr);
  }

  /// Send request for [APIResponseFile] and fetch its result.
  Future<APIResponseFile> _fetchFile(String method, Map<String, dynamic> params) async {
    String errStr;

    HttpResponse response = await _request(method, params);
    if (response.statusCode == 200) {
      try {
	return APIResponseFile.fromJson(response.toJson());
      } catch(e) {
	errStr = "${method} failed with json parse error: ${e} (${response.body})";
      }
    } else {
      errStr = "${method} failed with error: ${response.reason}";
    }

    logError(errStr);

    return new APIResponseFile(false, description: errStr);
  }

  /// Send request for [APIResponseChat] and fetch its result.
  Future<APIResponseChat> _fetchChat(String method, Map<String, dynamic> params) async {
    String errStr;

    HttpResponse response = await _request(method, params);
    if (response.statusCode == 200) {
      try {
	return APIResponseChat.fromJson(response.toJson());
      } catch(e) {
	errStr = "${method} failed with json parse error: ${e} (${response.body})";
      }
    } else {
      errStr = "${method} failed with error: ${response.reason}";
    }

    logError(errStr);

    return new APIResponseChat(false, description: errStr);
  }

  /// Send request for [APIResponseChatAdministrators] and fetch its result.
  Future<APIResponseChatAdministrators> _fetchChatAdministrators(String method, Map<String, dynamic> params) async {
    String errStr;

    HttpResponse response = await _request(method, params);
    if (response.statusCode == 200) {
      try {
	return APIResponseChatAdministrators.fromJson(response.toJson());
      } catch(e) {
	errStr = "${method} failed with json parse error: ${e} (${response.body})";
      }
    } else {
      errStr = "${method} failed with error: ${response.reason}";
    }

    logError(errStr);

    return new APIResponseChatAdministrators(false, description: errStr);
  }

  /// Send request for [APIResponseChatMember] and fetch its result.
  Future<APIResponseChatMember> _fetchChatMember(String method, Map<String, dynamic> params) async {
    String errStr;

    HttpResponse response = await _request(method, params);
    if (response.statusCode == 200) {
      try {
	return APIResponseChatMember.fromJson(response.toJson());
      } catch(e) {
	errStr = "${method} failed with json parse error: ${e} (${response.body})";
      }
    } else {
      errStr = "${method} failed with error: ${response.reason}";
    }

    logError(errStr);

    return new APIResponseChatMember(false, description: errStr);
  }

  /// Send request for [APIResponseInt] and fetch its result.
  Future<APIResponseInt> _fetchInt(String method, Map<String, dynamic> params) async {
    String errStr;

    HttpResponse response = await _request(method, params);
    if (response.statusCode == 200) {
      try {
	return APIResponseInt.fromJson(response.toJson());
      } catch(e) {
	errStr = "${method} failed with json parse error: ${e} (${response.body})";
      }
    } else {
      errStr = "${method} failed with error: ${response.reason}";
    }

    logError(errStr);

    return new APIResponseInt(false, description: errStr);
  }

  /// Send request for [APIResponseString] and fetch its result.
  Future<APIResponseString> _fetchString(String method, Map<String, dynamic> params) async {
    String errStr;

    HttpResponse response = await _request(method, params);
    if (response.statusCode == 200) {
      try {
	return APIResponseString.fromJson(response.toJson());
      } catch(e) {
	errStr = "${method} failed with json parse error: ${e} (${response.body})";
      }
    } else {
      errStr = "${method} failed with error: ${response.reason}";
    }

    logError(errStr);

    return new APIResponseString(false, description: errStr);
  }

  /// Send request for [APIResponseGameHighScores] and fetch its result.
  Future<APIResponseGameHighScores> _fetchGameHighScores(String method, Map<String, dynamic> params) async {
    String errStr;

    HttpResponse response = await _request(method, params);
    if (response.statusCode == 200) {
      try {
	return APIResponseGameHighScores.fromJson(response.toJson());
      } catch(e) {
	errStr = "${method} failed with json parse error: ${e} (${response.body})";
      }
    } else {
      errStr = "${method} failed with error: ${response.reason}";
    }

    logError(errStr);

    return new APIResponseGameHighScores(false, description: errStr);
  }

  /// Send request for [APIResponseStickerSet] and fetch its result.
  Future<APIResponseStickerSet> _fetchStickerSet(String method, Map<String, dynamic> params) async {
    String errStr;

    HttpResponse response = await _request(method, params);
    if (response.statusCode == 200) {
      try {
	return APIResponseStickerSet.fromJson(response.toJson());
      } catch(e) {
	errStr = "${method} failed with json parse error: ${e} (${response.body})";
      }
    } else {
      errStr = "${method} failed with error: ${response.reason}";
    }

    logError(errStr);

    return new APIResponseStickerSet(false, description: errStr);
  }

  /// Send file
  Future<APIResponseMessage> _sendFile(Object chatId, String apiName, paramKey, filepath, Map<String, dynamic> options) async {
    Map<String, dynamic> params = new Map<String, dynamic>();

    // essential param
    params["chat_id"] = chatId;

    // optional params
    options.forEach((key, value) {
      params[key] = value;
    });

    // file param
    if (_isHttpUrl(filepath)) {
      params[paramKey] = filepath;
    } else {
      params[paramKey] = new File(filepath);
    }

    return _fetchMessage(apiName, params);
  }

  /// Send bytes
  Future<APIResponseMessage> _sendBytes(Object chatId, String apiName, paramKey, List<int> bytes, Map<String, dynamic> options) async {
    Map<String, dynamic> params = new Map<String, dynamic>();

    // essential param
    params["chat_id"] = chatId;
    params[paramKey] = bytes;

    // optional params
    options.forEach((key, value) {
      params[key] = value;
    });

    return _fetchMessage(apiName, params);
  }

  /// Send file with file id (which is already uploaded to Telegram server)
  Future<APIResponseMessage> _sendFileId(Object chatId, String apiName, paramKey, fileId, Map<String, dynamic> options) async {
    Map<String, dynamic> params = new Map<String, dynamic>();

    // essential param
    params["chat_id"] = chatId;
    params[paramKey] = fileId;

    // optional params
    options.forEach((key, value) {
      params[key] = value;
    });

    return _fetchMessage(apiName, params);
  }

  /// Send object (in bytes, filepath, http url, or file id) and return as [APIResponse]
  Future<APIResponse> _sendObject(String apiName, paramKey, InputFile obj, Map<String, dynamic> options) async {
    Map<String, dynamic> params = options;

    if (obj.filepath != null) {
      params[paramKey] = new File(obj.filepath);
    } else if (obj.url != null) {
      params[paramKey] = obj.url;
    } else if (obj.fileId != null) {
      params[paramKey] = obj.fileId;
    } else if (obj.bytes.length > 0) {
      params[paramKey] = obj.bytes;
    } else {
      return new APIResponse(false, description: "_sendObject - failed to process param '${paramKey}': ${obj}");
    }

    return _fetchResponse(apiName, params);
  }

  /// Send object (in bytes, filepath, http url, or file id) and return as [APIResponseMessage]
  Future<APIResponseMessage> _sendObjectMessage(Object chatId, String apiName, paramKey, InputFile obj, Map<String, dynamic> options) async {
    if (obj.bytes != null) {
      return _sendBytes(chatId, apiName, paramKey, obj.bytes, options);
    } else if (obj.filepath != null) {
      return _sendFile(chatId, apiName, paramKey, obj.filepath, options);
    } else if (obj.url != null) {
      return _sendFile(chatId, apiName, paramKey, obj.url, options);
    } else if (obj.fileId != null) {
      return _sendFileId(chatId, apiName, paramKey, obj.fileId, options);
    }

    String errStr = "_sendObjectMessage - failed to process param '${paramKey}': ${obj}";

    return APIResponseMessage(false, description: errStr);
  }

  /// Send object (in bytes, filepath, http url, or file id) and return as [APIResponseFile]
  Future<APIResponseFile> _sendObjectFile(String apiName, paramKey, InputFile obj, Map<String, dynamic> options) async {
    Map<String, dynamic> params = options;

    if (obj.bytes.length > 0) {
      params[paramKey] = obj.bytes;
    } else if (obj.filepath != null) {
      params[paramKey] = new File(obj.filepath);
    } else if (obj.url != null) {
      params[paramKey] = obj.url;
    } else if (obj.fileId != null) {
      params[paramKey] = obj.fileId;
    } else {
      return new APIResponseFile(false, description: "_sendObjectFile - failed to process param '${paramKey}': ${obj}");
    }

    return _fetchFile(apiName, params);
  }

  //////////////////////////////////////////////////
  //
  // Telegram API methods
  //
  // https://core.telegram.org/bots/api#available-methods

  // Retrieve updates.
  //
  // https://core.telegram.org/bots/api#getupdates
  Future<APIResponseUpdates> getUpdates({int offset, int limit, int timeout, List<String> allowedUpdates}) async {
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
  Future<APIResponse> deleteWebhook() {
    logVerbose("deleting webhook...");

    return _fetchResponse("deleteWebhook", null);
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
  Future<APIResponseMessage> sendMessage(Object chatId, String text, {
    ParseMode parseMode,
    bool disableWebPagePreview,
    bool disableNotification,
    int replyToMessageId,
    ReplyMarkup replyMarkup,
  }) {
    Map<String, dynamic> params = new Map<String, dynamic>();

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
  Future<APIResponseMessage> forwardMessage(Object chatId, fromChatId, int messageId, {
    bool disableNotification,
  }) {
    // essential params
    Map<String, dynamic> params = new Map<String, dynamic>();
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
  Future<APIResponseMessage> sendPhoto(Object chatId, InputFile photo, {
    String caption,
    ParseMode parseMode,
    bool disableNotification,
    int replyToMessageId,
    ReplyMarkup replyMarkup,
  }) {
    // optionl params
    Map<String, dynamic> params = new Map<String, dynamic>();
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

    return _sendObjectMessage(chatId, "sendPhoto", "photo", photo, params);
  }

  /// Send an audio file. (.mp3 format only, will be played with external players)
  ///
  /// - [chatId] can be one of [int](chat id) or [String](channel name).
  /// - [replyMarkup] can be one of [InlineKeyboardMarkup], [ReplyKeyboardMarkup], [ReplyKeyboardRemove], or [ForceReply].
  ///
  /// https://core.telegram.org/bots/api#sendaudio
  Future<APIResponseMessage> sendAudio(Object chatId, InputFile audio, {
    String caption,
    ParseMode parseMode,
    int duration,
    String performer,
    String title,
    bool disableNotification,
    int replyToMessageId,
    ReplyMarkup replyMarkup,
  }) {
    // optionl params
    Map<String, dynamic> params = new Map<String, dynamic>();
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
    if (disableNotification != null) {
      params["disable_notification"] = disableNotification;
    }
    if (replyToMessageId != null) {
      params["reply_to_message_id"] = replyToMessageId;
    }
    if (replyMarkup != null) {
      params["reply_markup"] = replyMarkup;
    }

    return _sendObjectMessage(chatId, "sendAudio", "audio", audio, params);
  }

  /// Send a general file.
  ///
  /// - [chatId] can be one of [int](chat id) or [String](channel name).
  /// - [replyMarkup] can be one of [InlineKeyboardMarkup], [ReplyKeyboardMarkup], [ReplyKeyboardRemove], or [ForceReply].
  ///
  /// https://core.telegram.org/bots/api#senddocument
  Future<APIResponseMessage> sendDocument(Object chatId, InputFile document, Map<String, dynamic> params, {
    String caption,
    ParseMode parseMode,
    bool disableNotification,
    int replyToMessageId,
    ReplyMarkup replyMarkup,
  }) {
    // optionl params
    Map<String, dynamic> params = new Map<String, dynamic>();
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

    return _sendObjectMessage(chatId, "sendDocument", "document", document, params);
  }

  /// Send a sticker.
  ///
  /// - [chatId] can be one of [int](chat id) or [String](channel name).
  /// - [replyMarkup] can be one of [InlineKeyboardMarkup], [ReplyKeyboardMarkup], [ReplyKeyboardRemove], or [ForceReply].
  ///
  /// https://core.telegram.org/bots/api#sendsticker
  Future<APIResponseMessage> sendSticker(Object chatId, InputFile sticker, {
    bool disableNotification,
    int replyToMessageId,
    ReplyMarkup replyMarkup,
  }) {
    // optionl params
    Map<String, dynamic> params = new Map<String, dynamic>();
    if (disableNotification != null) {
      params["disable_notification"] = disableNotification;
    }
    if (replyToMessageId != null) {
      params["reply_to_message_id"] = replyToMessageId;
    }
    if (replyMarkup != null) {
      params["reply_markup"] = replyMarkup;
    }

    return _sendObjectMessage(chatId, "sendSticker", "sticker", sticker, params);
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

    return _sendObjectFile("uploadStickerFile", "png_sticker", sticker, params);
  }

  /// Create a new sticker set.
  ///
  /// https://core.telegram.org/bots/api#createnewstickerset
  Future<APIResponse> createNewStickerSet(int userId, String name, title, InputFile sticker, String emojis, {
    bool containsMasks,
    MaskPosition maskPosition,
  }) {
    // essential params
    Map<String, dynamic> params = Map<String, dynamic>();
    params["user_id"] = userId;
    params["name"] = name;
    params["title"] = title;
    params["emojis"] = emojis;

    // optional params
    if (containsMasks != null) {
      params["contains_masks"] = containsMasks;
    }
    if (maskPosition != null) {
      params["mask_position"] = maskPosition;
    }

    return _sendObject("createNewStickerSet", "png_sticker", sticker, params);
  }

  /// Add a sticker to set.
  ///
  /// https://core.telegram.org/bots/api#addstickertoset
  Future<APIResponse> addStickerToSet(int userId, String name, InputFile sticker, String emojis, {
    MaskPosition maskPosition,
  }) {
    // optional params
    Map<String, dynamic> params = Map<String, dynamic>();
    if (maskPosition != null) {
      params["mask_position"] = maskPosition;
    }

    return _sendObject("addStickerToSet", "png_sticker", sticker, params);
  }

  /// Set sticker position in set.
  ///
  /// https://core.telegram.org/bots/api#setstickerpositioninset
  Future<APIResponse> setStickerPositionInSet(String sticker, int position) {
    // essential params
    Map<String, dynamic> params = Map<String, dynamic>();
    params["sticker"] = sticker;
    params["position"] = position;

    return _fetchResponse("setStickerPositionInSet", params);
  }

  /// Delete a sticker from set.
  ///
  /// https://core.telegram.org/bots/api#deletestickerfromset
  Future<APIResponse> deleteStickerFromSet(String sticker) {
    // essential params
    Map<String, dynamic> params = Map<String, dynamic>();
    params["sticker"] = sticker;

    return _fetchResponse("deleteStickerFromSet", params);
  }

  /// Send a video file.
  ///
  /// - [chatId] can be one of [int](chat id) or [String](channel name).
  /// - [replyMarkup] can be one of [InlineKeyboardMarkup], [ReplyKeyboardMarkup], [ReplyKeyboardRemove], or [ForceReply].
  ///
  /// https://core.telegram.org/bots/api#sendvideo
  Future<APIResponseMessage> sendVideo(Object chatId, InputFile video, {
    int duration,
    String caption,
    ParseMode parseMode,
    bool supportsStreaming,
    bool disableNotification,
    int replyToMessageId,
    ReplyMarkup replyMarkup,
  }) {
    // optional params
    Map<String, dynamic> params = Map<String, dynamic>();
    if (duration != null) {
      params["duration"] = duration;
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

    return _sendObjectMessage(chatId, "sendVideo", "video", video, params);
  }

  /// Send a voice file. (.ogg format only, will be played with Telegram itself))
  ///
  /// - [chatId] can be one of [int](chat id) or [String](channel name).
  /// - [replyMarkup] can be one of [InlineKeyboardMarkup], [ReplyKeyboardMarkup], [ReplyKeyboardRemove], or [ForceReply].
  ///
  /// https://core.telegram.org/bots/api#sendvoice
  Future<APIResponseMessage> sendVoice(Object chatId, InputFile voice, Map<String, dynamic> params, {
    String caption,
    ParseMode parseMode,
    int duration,
    bool disableNotification,
    int replyToMessageId,
    ReplyMarkup replyMarkup,
  }) {
    // optional params
    Map<String, dynamic> params = Map<String, dynamic>();
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

    return _sendObjectMessage(chatId, "sendVoice", "voice", voice, params);
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
  Future<APIResponseMessage> sendVideoNote(Object chatId, InputFile videoNote, {
    int duration,
    int length,
    bool disableNotification,
    int replyToMessageId,
    ReplyMarkup replyMarkup,
  }) {
    // optional params
    Map<String, dynamic> params = Map<String, dynamic>();
    if (duration != null) {
      params["duration"] = duration;
    }
    if (length != null) {
      params["length"] = length;
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

    return _sendObjectMessage(chatId, "sendVideoNote", "video_note", videoNote, params);
  }

  /// Send a group of photos or videos as an album.
  ///
  /// - [chatId] can be one of [int](chat id) or [String](channel name).
  ///
  /// https://core.telegram.org/bots/api#sendmediagroup
  Future<APIResponseMessages> sendMediaGroup(Object chatId, List<InputMedia> media, {
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
  Future<APIResponseMessage> sendLocation(Object chatId, double latitude, longitude, {
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
  Future<APIResponseMessage> sendVenue(Object chatId, double latitude, longitude, String title, address, {
    String foursquareId,
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
  Future<APIResponseMessage> sendContact(Object chatId, String phoneNumber, firstName, {
    String lastName,
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
  Future<APIResponse> sendChatAction(Object chatId, ChatAction action) {
    // essential params
    Map<String, dynamic> params = Map<String, dynamic>();
    params["chat_id"] = chatId;
    params["action"] = action;

    return _fetchResponse("sendChatAction", params);
  }

  /// Get user profile photos.
  ///
  /// https://core.telegram.org/bots/api#getuserprofilephotos
  Future<APIResponseUserProfilePhotos> getUserProfilePhotos(int userId, {
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
  Future<APIResponse> kickChatMember(Object chatId, int userId, {
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

    return _fetchResponse("kickChatMember", params);
  }

  /// Leave a chat.
  ///
  /// - [chatId] can be one of [int](chat id) or [String](channel name).
  ///
  /// https://core.telegram.org/bots/api#leavechat
  Future<APIResponse> leaveChat(Object chatId) {
    // essential params
    Map<String, dynamic> params = Map<String, dynamic>();
    params["chat_id"] = chatId;

    return _fetchResponse("leaveChat", params);
  }

  /// Unban a chat member.
  ///
  /// - [chatId] can be one of [int](chat id) or [String](channel name).
  ///
  /// https://core.telegram.org/bots/api#unbanchatmember
  Future<APIResponse> unbanChatMember(Object chatId, int userId) {
    // essential params
    Map<String, dynamic> params = Map<String, dynamic>();
    params["chat_id"] = chatId;
    params["user_id"] = userId;

    return _fetchResponse("unbanChatMember", params);
  }

  /// Restrict a chat member.
  ///
  /// - [chatId] can be one of [int](chat id) or [String](channel name).
  ///
  /// https://core.telegram.org/bots/api#restrictchatmember
  Future<APIResponse> restrictChatMember(Object chatId, int userId, {
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

    return _fetchResponse("restrictChatMember", params);
  }

  /// Promote a chat member.
  ///
  /// - [chatId] can be one of [int](chat id) or [String](channel name).
  ///
  /// options include: can_change_info, can_post_messages, can_edit_messages, can_delete_messages, can_invite_users, can_restrict_members, can_pin_messages, and can_promote_members
  ///
  /// https://core.telegram.org/bots/api#promotechatmember
  Future<APIResponse> promoteChatMember(Object chatId, int userId, {
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

    return _fetchResponse("promoteChatMember", params);
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
  Future<APIResponse> setChatPhoto(Object chatId, InputFile photo) {
    // essential params
    Map<String, dynamic> params = Map<String, dynamic>();
    params["chat_id"] = chatId;

    return _sendObject("setChatPhoto", "photo", photo, params);
  }

  /// Delete a chat photo.
  ///
  /// - [chatId] can be one of [int](chat id) or [String](channel name).
  ///
  /// https://core.telegram.org/bots/api#deletechatphoto
  Future<APIResponse> deleteChatPhoto(Object chatId) {
    // essential params
    Map<String, dynamic> params = Map<String, dynamic>();
    params["chat_id"] = chatId;

    return _fetchResponse("deleteChatPhoto", params);
  }

  /// Set a chat title.
  ///
  /// - [chatId] can be one of [int](chat id) or [String](channel name).
  ///
  /// https://core.telegram.org/bots/api#setchattitle
  Future<APIResponse> setChatTitle(Object chatId, String title) {
    // essential params
    Map<String, dynamic> params = Map<String, dynamic>();
    params["chat_id"] = chatId;
    params["title"] = title;

    return _fetchResponse("setChatTitle", params);
  }

  /// Set a chat description.
  ///
  /// - [chatId] can be one of [int](chat id) or [String](channel name).
  ///
  /// https://core.telegram.org/bots/api#setchatdescription
  Future<APIResponse> setChatDescription(Object chatId, String description) {
    // essential params
    Map<String, dynamic> params = Map<String, dynamic>();
    params["chat_id"] = chatId;
    params["description"] = description;

    return _fetchResponse("setChatDescription", params);
  }

  /// PinChatMessage pins a chat message
  ///
  /// - [chatId] can be one of [int](chat id) or [String](channel name).
  ///
  /// https://core.telegram.org/bots/api#pinchatmessage
  Future<APIResponse> pinChatMessage(Object chatId, int messageId, {
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

    return _fetchResponse("pinChatMessage", params);
  }

  /// Unpin a chat message.
  ///
  /// - [chatId] can be one of [int](chat id) or [String](channel name).
  ///
  /// https://core.telegram.org/bots/api#unpinchatmessage
  Future<APIResponse> unpinChatMessage(Object chatId) {
    // essential params
    Map<String, dynamic> params = Map<String, dynamic>();
    params["chat_id"] = chatId;

    return _fetchResponse("unpinChatMessage", params);
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
  Future<APIResponse> setChatStickerSet(Object chatId, String stickerSetName) {
    // essential params
    Map<String, dynamic> params = Map<String, dynamic>();
    params["chat_id"] = chatId;
    params["sticker_set_name"] = stickerSetName;

    return _fetchResponse("setChatStickerSet", params);
  }

  /// Delete a chat sticker set.
  ///
  /// - [chatId] can be one of [int](chat id) or [String](channel name).
  ///
  /// https://core.telegram.org/bots/api#deletechatstickerset
  Future<APIResponse> deleteChatStickerSet(Object chatId) {
    // essential params
    Map<String, dynamic> params = Map<String, dynamic>();
    params["chat_id"] = chatId;

    return _fetchResponse("deleteChatStickerSet", params);
  }

  /// Answer a callback query.
  ///
  /// https://core.telegram.org/bots/api#answercallbackquery
  Future<APIResponse> answerCallbackQuery(String callbackQueryId, {
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

    return _fetchResponse("answerCallbackQuery", params);
  }

  ////////////////////////////////
  /// Methods for updating messages
  ///
  /// https://core.telegram.org/bots/api#updating-messages

  /// Edit text of a message.
  ///
  /// - [chatId] can be one of [int](chat id) or [String](channel name).
  /// - [replyMarkup] can be one of [InlineKeyboardMarkup], [ReplyKeyboardMarkup], [ReplyKeyboardRemove], or [ForceReply].
  ///
  /// NOTE:
  ///   required params: [chatId] + [messageId] (when [inlineMessageId] is not given)
  ///                 or [InlineMessageId] (when [chatId] & [messageId] is not given)
  ///
  /// https://core.telegram.org/bots/api#editmessagetext
  Future<APIResponseMessage> editMessageText(String text, {
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

    return _fetchMessage("editMessageText", params);
  }

  /// Edit caption of a message.
  ///
  /// - [chatId] can be one of [int](chat id) or [String](channel name).
  /// - [replyMarkup] can be one of [InlineKeyboardMarkup], [ReplyKeyboardMarkup], [ReplyKeyboardRemove], or [ForceReply].
  ///
  /// NOTE:
  ///   required params: [chatId] + [messageId] (when [inlineMessageId] is not given)
  ///                 or [InlineMessageId] (when [chatId] & [messageId] is not given)
  ///
  /// https://core.telegram.org/bots/api#editmessagecaption
  Future<APIResponseMessage> editMessageCaption(String caption, {
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

    return _fetchMessage("editMessageCaption", params);
  }

  /// Edit reply markup of a message.
  ///
  /// - [chatId] can be one of [int](chat id) or [String](channel name).
  /// - [replyMarkup] can be one of [InlineKeyboardMarkup], [ReplyKeyboardMarkup], [ReplyKeyboardRemove], or [ForceReply].
  ///
  /// NOTE:
  ///   required params: [chatId] + [messageId] (when [inlineMessageId] is not given)
  ///                 or [InlineMessageId] (when [chatId] & [messageId] is not given)
  ///
  /// https://core.telegram.org/bots/api#editmessagereplymarkup
  Future<APIResponseMessage> editMessageReplyMarkup({
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

    return _fetchMessage("editMessageReplyMarkup", params);
  }

  /// Edit live location of a message.
  ///
  /// - [chatId] can be one of [int](chat id) or [String](channel name).
  /// - [replyMarkup] can be one of [InlineKeyboardMarkup], [ReplyKeyboardMarkup], [ReplyKeyboardRemove], or [ForceReply].
  ///
  /// NOTE:
  ///   required params: [chatId] + [messageId] (when [inlineMessageId] is not given)
  ///                 or [InlineMessageId] (when [chatId] & [messageId] is not given)
  ///
  /// https://core.telegram.org/bots/api#editmessagelivelocation
  Future<APIResponseMessage> editMessageLiveLocation(double latitude, longitude, {
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

    return _fetchMessage("editMessageLiveLocation", params);
  }

  /// Stop live location of a message.
  ///
  /// - [chatId] can be one of [int](chat id) or [String](channel name).
  /// - [replyMarkup] can be one of [InlineKeyboardMarkup], [ReplyKeyboardMarkup], [ReplyKeyboardRemove], or [ForceReply].
  ///
  /// NOTE:
  ///   required params: [chatId] + [messageId] (when [inlineMessageId] is not given)
  ///                 or [InlineMessageId] (when [chatId] & [messageId] is not given)
  ///
  /// https://core.telegram.org/bots/api#stopmessagelivelocation
  Future<APIResponseMessage> stopMessageLiveLocation({
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

    return _fetchMessage("stopMessageLiveLocation", params);
  }

  /// Delete a message.
  ///
  /// - [chatId] can be one of [int](chat id) or [String](channel name).
  ///
  /// https://core.telegram.org/bots/api#deletemessage
  Future<APIResponse> deleteMessage(Object chatId, int messageId) {
    // essential params
    Map<String, dynamic> params = Map<String, dynamic>();
    params["chat_id"] = chatId;
    params["message_id"] = messageId;

    return _fetchResponse("deleteMessage", params);
  }

  /// Send answers to an inline query.
  ///
  /// - [results] = [List] of [InlineQueryResultArticle], [InlineQueryResultPhoto], [InlineQueryResultGif], [InlineQueryResultMpeg4Gif], or [InlineQueryResultVideo].
  ///
  /// https://core.telegram.org/bots/api#answerinlinequery
  Future<APIResponse> answerInlineQuery(String inlineQueryId, List<InlineQueryResult> results, {
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

    return _fetchResponse("answerInlineQuery", params);
  }

  /// Send an invoice.
  ///
  /// - [replyMarkup] can be one of [InlineKeyboardMarkup], [ReplyKeyboardMarkup], [ReplyKeyboardRemove], or [ForceReply].
  ///
  /// https://core.telegram.org/bots/api#sendinvoice
  Future<APIResponseMessage> sendInvoice(int chatId, String title, description, payload, providerToken, startParameter, currency, List<LabeledPrice> prices, {
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
  Future<APIResponse> answerShippingQuery(String shippingQueryId, bool ok, {
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

    return _fetchResponse("answerShippingQuery", params);
  }

  /// Answer a pre-checkout query.
  ///
  /// NOTE: If [ok] is false, [errorMessage] should be provided.
  ///
  /// https://core.telegram.org/bots/api#answerprecheckoutquery
  Future<APIResponse> answerPreCheckoutQuery(String preCheckoutQueryId, bool ok, {
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

    return _fetchResponse("answerPreCheckoutQuery", params);
  }

  /// Send a game.
  ///
  /// - [chatId] can be one of [int](chat id) or [String](channel name).
  /// - [replyMarkup] can be one of [InlineKeyboardMarkup], [ReplyKeyboardMarkup], [ReplyKeyboardRemove], or [ForceReply].
  ///
  /// https://core.telegram.org/bots/api#sendgame
  Future<APIResponseMessage> sendGame(Object chatId, String gameShortName, {
    bool disableNotification,
    int replyToMessageId,
    ReplyMarkup replyMarkup,
  }) {
    // essential params
    Map<String, dynamic> params = new Map<String, dynamic>();
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
  /// NOTE:
  ///   required params: [chatId] + [messageId] (when [inlineMessageId] is not given)
  ///                 or [InlineMessageId] (when [chatId] & [messageId] is not given)
  ///
  /// other options: force, and disable_edit_message
  ///
  /// https://core.telegram.org/bots/api#setgamescore
  Future<APIResponseMessage> setGameScore(int userId, int score, {
    Object chatId,
    int messageId,
    int inlineMessageId,
    bool force,
    bool disableEditMessage,
  }) {
    // essential params
    Map<String, dynamic> params = new Map<String, dynamic>();
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

    return _fetchMessage("setGameScore", params);
  }

  /// Get high scores of a game.
  ///
  /// NOTE:
  ///   required params: [chatId] + [messageId] (when [inlineMessageId] is not given)
  ///                 or [InlineMessageId] (when [chatId] & [messageId] is not given)
  ///
  /// https://core.telegram.org/bots/api#getgamehighscores
  Future<APIResponseGameHighScores> getGameHighScores(int userId, {
    Object chatId,
    int messageId,
    int inlineMessageId,
  }) {
    // essential params
    Map<String, dynamic> params = new Map<String, dynamic>();
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
