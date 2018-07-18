// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

APIResponseParameters _$APIResponseParametersFromJson(
    Map<String, dynamic> json) {
  return new APIResponseParameters(
      migrateToChatId: json['migrate_to_chat_id'] as int,
      retryAfter: json['retry_after'] as int);
}

abstract class _$APIResponseParametersSerializerMixin {
  int get migrateToChatId;
  int get retryAfter;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{};

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('migrate_to_chat_id', migrateToChatId);
    writeNotNull('retry_after', retryAfter);
    return val;
  }
}

APIResponse _$APIResponseFromJson(Map<String, dynamic> json) {
  return new APIResponse(json['ok'] as bool,
      description: json['description'] as String,
      parameters: json['parameters'] == null
          ? null
          : new APIResponseParameters.fromJson(
              json['parameters'] as Map<String, dynamic>));
}

abstract class _$APIResponseSerializerMixin {
  bool get ok;
  String get description;
  APIResponseParameters get parameters;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'ok': ok,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('description', description);
    writeNotNull('parameters', parameters);
    return val;
  }
}

APIResponseWebhookInfo _$APIResponseWebhookInfoFromJson(
    Map<String, dynamic> json) {
  return new APIResponseWebhookInfo(json['ok'] as bool,
      description: json['description'] as String,
      parameters: json['parameters'] == null
          ? null
          : new APIResponseParameters.fromJson(
              json['parameters'] as Map<String, dynamic>),
      result: json['result'] == null
          ? null
          : new WebhookInfo.fromJson(json['result'] as Map<String, dynamic>));
}

abstract class _$APIResponseWebhookInfoSerializerMixin {
  bool get ok;
  String get description;
  APIResponseParameters get parameters;
  WebhookInfo get result;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'ok': ok,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('description', description);
    writeNotNull('parameters', parameters);
    writeNotNull('result', result);
    return val;
  }
}

APIResponseUser _$APIResponseUserFromJson(Map<String, dynamic> json) {
  return new APIResponseUser(json['ok'] as bool,
      description: json['description'] as String,
      parameters: json['parameters'] == null
          ? null
          : new APIResponseParameters.fromJson(
              json['parameters'] as Map<String, dynamic>),
      result: json['result'] == null
          ? null
          : new User.fromJson(json['result'] as Map<String, dynamic>));
}

abstract class _$APIResponseUserSerializerMixin {
  bool get ok;
  String get description;
  APIResponseParameters get parameters;
  User get result;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'ok': ok,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('description', description);
    writeNotNull('parameters', parameters);
    writeNotNull('result', result);
    return val;
  }
}

APIResponseMessage _$APIResponseMessageFromJson(Map<String, dynamic> json) {
  return new APIResponseMessage(json['ok'] as bool,
      description: json['description'] as String,
      parameters: json['parameters'] == null
          ? null
          : new APIResponseParameters.fromJson(
              json['parameters'] as Map<String, dynamic>),
      result: json['result'] == null
          ? null
          : new Message.fromJson(json['result'] as Map<String, dynamic>));
}

abstract class _$APIResponseMessageSerializerMixin {
  bool get ok;
  String get description;
  APIResponseParameters get parameters;
  Message get result;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'ok': ok,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('description', description);
    writeNotNull('parameters', parameters);
    writeNotNull('result', result);
    return val;
  }
}

APIResponseMessages _$APIResponseMessagesFromJson(Map<String, dynamic> json) {
  return new APIResponseMessages(json['ok'] as bool,
      description: json['description'] as String,
      parameters: json['parameters'] == null
          ? null
          : new APIResponseParameters.fromJson(
              json['parameters'] as Map<String, dynamic>),
      result: (json['result'] as List)
          ?.map((e) => e == null
              ? null
              : new Message.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

abstract class _$APIResponseMessagesSerializerMixin {
  bool get ok;
  String get description;
  APIResponseParameters get parameters;
  List<Message> get result;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'ok': ok,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('description', description);
    writeNotNull('parameters', parameters);
    writeNotNull('result', result);
    return val;
  }
}

APIResponseUserProfilePhotos _$APIResponseUserProfilePhotosFromJson(
    Map<String, dynamic> json) {
  return new APIResponseUserProfilePhotos(json['ok'] as bool,
      description: json['description'] as String,
      parameters: json['parameters'] == null
          ? null
          : new APIResponseParameters.fromJson(
              json['parameters'] as Map<String, dynamic>),
      result: json['result'] == null
          ? null
          : new UserProfilePhotos.fromJson(
              json['result'] as Map<String, dynamic>));
}

abstract class _$APIResponseUserProfilePhotosSerializerMixin {
  bool get ok;
  String get description;
  APIResponseParameters get parameters;
  UserProfilePhotos get result;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'ok': ok,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('description', description);
    writeNotNull('parameters', parameters);
    writeNotNull('result', result);
    return val;
  }
}

APIResponseFile _$APIResponseFileFromJson(Map<String, dynamic> json) {
  return new APIResponseFile(json['ok'] as bool,
      description: json['description'] as String,
      parameters: json['parameters'] == null
          ? null
          : new APIResponseParameters.fromJson(
              json['parameters'] as Map<String, dynamic>),
      result: json['result'] == null
          ? null
          : new FileObject.fromJson(json['result'] as Map<String, dynamic>));
}

abstract class _$APIResponseFileSerializerMixin {
  bool get ok;
  String get description;
  APIResponseParameters get parameters;
  FileObject get result;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'ok': ok,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('description', description);
    writeNotNull('parameters', parameters);
    writeNotNull('result', result);
    return val;
  }
}

APIResponseUpdates _$APIResponseUpdatesFromJson(Map<String, dynamic> json) {
  return new APIResponseUpdates(json['ok'] as bool,
      description: json['description'] as String,
      parameters: json['parameters'] == null
          ? null
          : new APIResponseParameters.fromJson(
              json['parameters'] as Map<String, dynamic>),
      result: (json['result'] as List)
          ?.map((e) =>
              e == null ? null : new Update.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

abstract class _$APIResponseUpdatesSerializerMixin {
  bool get ok;
  String get description;
  APIResponseParameters get parameters;
  List<Update> get result;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'ok': ok,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('description', description);
    writeNotNull('parameters', parameters);
    val['result'] = result;
    return val;
  }
}

APIResponseChat _$APIResponseChatFromJson(Map<String, dynamic> json) {
  return new APIResponseChat(json['ok'] as bool,
      description: json['description'] as String,
      parameters: json['parameters'] == null
          ? null
          : new APIResponseParameters.fromJson(
              json['parameters'] as Map<String, dynamic>),
      result: json['result'] == null
          ? null
          : new Chat.fromJson(json['result'] as Map<String, dynamic>));
}

abstract class _$APIResponseChatSerializerMixin {
  bool get ok;
  String get description;
  APIResponseParameters get parameters;
  Chat get result;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'ok': ok,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('description', description);
    writeNotNull('parameters', parameters);
    writeNotNull('result', result);
    return val;
  }
}

APIResponseChatAdministrators _$APIResponseChatAdministratorsFromJson(
    Map<String, dynamic> json) {
  return new APIResponseChatAdministrators(json['ok'] as bool,
      description: json['description'] as String,
      parameters: json['parameters'] == null
          ? null
          : new APIResponseParameters.fromJson(
              json['parameters'] as Map<String, dynamic>),
      result: (json['result'] as List)
          ?.map((e) => e == null
              ? null
              : new ChatMember.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

abstract class _$APIResponseChatAdministratorsSerializerMixin {
  bool get ok;
  String get description;
  APIResponseParameters get parameters;
  List<ChatMember> get result;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'ok': ok,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('description', description);
    writeNotNull('parameters', parameters);
    writeNotNull('result', result);
    return val;
  }
}

APIResponseChatMember _$APIResponseChatMemberFromJson(
    Map<String, dynamic> json) {
  return new APIResponseChatMember(json['ok'] as bool,
      description: json['description'] as String,
      parameters: json['parameters'] == null
          ? null
          : new APIResponseParameters.fromJson(
              json['parameters'] as Map<String, dynamic>),
      result: json['result'] == null
          ? null
          : new ChatMember.fromJson(json['result'] as Map<String, dynamic>));
}

abstract class _$APIResponseChatMemberSerializerMixin {
  bool get ok;
  String get description;
  APIResponseParameters get parameters;
  ChatMember get result;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'ok': ok,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('description', description);
    writeNotNull('parameters', parameters);
    writeNotNull('result', result);
    return val;
  }
}

APIResponseInt _$APIResponseIntFromJson(Map<String, dynamic> json) {
  return new APIResponseInt(json['ok'] as bool,
      description: json['description'] as String,
      parameters: json['parameters'] == null
          ? null
          : new APIResponseParameters.fromJson(
              json['parameters'] as Map<String, dynamic>),
      result: json['result'] as int);
}

abstract class _$APIResponseIntSerializerMixin {
  bool get ok;
  String get description;
  APIResponseParameters get parameters;
  int get result;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'ok': ok,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('description', description);
    writeNotNull('parameters', parameters);
    writeNotNull('result', result);
    return val;
  }
}

APIResponseString _$APIResponseStringFromJson(Map<String, dynamic> json) {
  return new APIResponseString(json['ok'] as bool,
      description: json['description'] as String,
      parameters: json['parameters'] == null
          ? null
          : new APIResponseParameters.fromJson(
              json['parameters'] as Map<String, dynamic>),
      result: json['result'] as String);
}

abstract class _$APIResponseStringSerializerMixin {
  bool get ok;
  String get description;
  APIResponseParameters get parameters;
  String get result;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'ok': ok,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('description', description);
    writeNotNull('parameters', parameters);
    writeNotNull('result', result);
    return val;
  }
}

APIResponseGameHighScores _$APIResponseGameHighScoresFromJson(
    Map<String, dynamic> json) {
  return new APIResponseGameHighScores(json['ok'] as bool,
      description: json['description'] as String,
      parameters: json['parameters'] == null
          ? null
          : new APIResponseParameters.fromJson(
              json['parameters'] as Map<String, dynamic>),
      result: (json['result'] as List)
          ?.map((e) => e == null
              ? null
              : new GameHighScore.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

abstract class _$APIResponseGameHighScoresSerializerMixin {
  bool get ok;
  String get description;
  APIResponseParameters get parameters;
  List<GameHighScore> get result;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'ok': ok,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('description', description);
    writeNotNull('parameters', parameters);
    writeNotNull('result', result);
    return val;
  }
}

APIResponseStickerSet _$APIResponseStickerSetFromJson(
    Map<String, dynamic> json) {
  return new APIResponseStickerSet(json['ok'] as bool,
      description: json['description'] as String,
      parameters: json['parameters'] == null
          ? null
          : new APIResponseParameters.fromJson(
              json['parameters'] as Map<String, dynamic>),
      result: json['result'] == null
          ? null
          : new StickerSet.fromJson(json['result'] as Map<String, dynamic>));
}

abstract class _$APIResponseStickerSetSerializerMixin {
  bool get ok;
  String get description;
  APIResponseParameters get parameters;
  StickerSet get result;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'ok': ok,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('description', description);
    writeNotNull('parameters', parameters);
    writeNotNull('result', result);
    return val;
  }
}

WebhookInfo _$WebhookInfoFromJson(Map<String, dynamic> json) {
  return new WebhookInfo(
      json['url'] as String,
      json['has_custom_certificate'] as bool,
      json['pending_update_count'] as int,
      lastErrorDate: json['last_error_date'] as int,
      lastErrorMessage: json['last_error_message'] as String,
      maxConnections: json['max_connections'] as int,
      allowedUpdates: (json['allowed_updates'] as List)
          ?.map((e) =>
              $enumDecodeNullable('UpdateType', UpdateType.values, e as String))
          ?.toList());
}

abstract class _$WebhookInfoSerializerMixin {
  String get url;
  bool get hasCustomCertificate;
  int get pendingUpdateCount;
  int get lastErrorDate;
  String get lastErrorMessage;
  int get maxConnections;
  List<UpdateType> get allowedUpdates;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'url': url,
      'has_custom_certificate': hasCustomCertificate,
      'pending_update_count': pendingUpdateCount,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('last_error_date', lastErrorDate);
    writeNotNull('last_error_message', lastErrorMessage);
    writeNotNull('max_connections', maxConnections);
    writeNotNull('allowed_updates',
        allowedUpdates?.map((e) => e?.toString()?.split('.')?.last)?.toList());
    return val;
  }
}

Update _$UpdateFromJson(Map<String, dynamic> json) {
  return new Update(json['update_id'] as int,
      message: json['message'] == null
          ? null
          : new Message.fromJson(json['message'] as Map<String, dynamic>),
      editedMessage: json['edited_message'] == null
          ? null
          : new Message.fromJson(
              json['edited_message'] as Map<String, dynamic>),
      channelPost: json['channel_post'] == null
          ? null
          : new Message.fromJson(json['channel_post'] as Map<String, dynamic>),
      editedChannelPost: json['edited_channel_post'] == null
          ? null
          : new Message.fromJson(
              json['edited_channel_post'] as Map<String, dynamic>),
      inlineQuery: json['inline_query'] == null
          ? null
          : new InlineQuery.fromJson(
              json['inline_query'] as Map<String, dynamic>),
      chosenInlineResult: json['chosen_inline_result'] == null
          ? null
          : new ChosenInlineResult.fromJson(
              json['chosen_inline_result'] as Map<String, dynamic>),
      callbackQuery: json['callback_query'] == null
          ? null
          : new CallbackQuery.fromJson(
              json['callback_query'] as Map<String, dynamic>),
      shippingQuery: json['shipping_query'] == null
          ? null
          : new ShippingQuery.fromJson(
              json['shipping_query'] as Map<String, dynamic>),
      preCheckoutQuery: json['pre_checkout_query'] == null
          ? null
          : new PreCheckoutQuery.fromJson(
              json['pre_checkout_query'] as Map<String, dynamic>));
}

abstract class _$UpdateSerializerMixin {
  int get updateId;
  Message get message;
  Message get editedMessage;
  Message get channelPost;
  Message get editedChannelPost;
  InlineQuery get inlineQuery;
  ChosenInlineResult get chosenInlineResult;
  CallbackQuery get callbackQuery;
  ShippingQuery get shippingQuery;
  PreCheckoutQuery get preCheckoutQuery;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'update_id': updateId,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('message', message);
    writeNotNull('edited_message', editedMessage);
    writeNotNull('channel_post', channelPost);
    writeNotNull('edited_channel_post', editedChannelPost);
    writeNotNull('inline_query', inlineQuery);
    writeNotNull('chosen_inline_result', chosenInlineResult);
    writeNotNull('callback_query', callbackQuery);
    writeNotNull('shipping_query', shippingQuery);
    writeNotNull('pre_checkout_query', preCheckoutQuery);
    return val;
  }
}

User _$UserFromJson(Map<String, dynamic> json) {
  return new User(json['id'] as int, json['is_bot'] as bool,
      lastName: json['last_name'] as String,
      username: json['username'] as String,
      languageCode: json['language_code'] as String)
    ..firstName = json['first_name'] as String;
}

abstract class _$UserSerializerMixin {
  int get id;
  bool get isBot;
  String get firstName;
  String get lastName;
  String get username;
  String get languageCode;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'id': id,
      'is_bot': isBot,
      'first_name': firstName,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('last_name', lastName);
    writeNotNull('username', username);
    writeNotNull('language_code', languageCode);
    return val;
  }
}

Chat _$ChatFromJson(Map<String, dynamic> json) {
  return new Chat(json['id'] as int,
      $enumDecodeNullable('ChatType', ChatType.values, json['type'] as String),
      title: json['title'] as String,
      username: json['username'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      allMembersAreAdministrators:
          json['all_members_are_administrators'] as bool,
      photo: json['photo'] == null
          ? null
          : new ChatPhoto.fromJson(json['photo'] as Map<String, dynamic>),
      description: json['description'] as String,
      inviteLink: json['invite_link'] as String,
      pinnedMessage: json['pinned_message'] == null
          ? null
          : new Message.fromJson(
              json['pinned_message'] as Map<String, dynamic>),
      stickerSetName: json['sticker_set_name'] as String,
      canSetStickerSet: json['can_set_sticker_set'] as bool);
}

abstract class _$ChatSerializerMixin {
  int get id;
  ChatType get type;
  String get title;
  String get username;
  String get firstName;
  String get lastName;
  bool get allMembersAreAdministrators;
  ChatPhoto get photo;
  String get description;
  String get inviteLink;
  Message get pinnedMessage;
  String get stickerSetName;
  bool get canSetStickerSet;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'id': id,
      'type': type?.toString()?.split('.')?.last,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('title', title);
    writeNotNull('username', username);
    writeNotNull('first_name', firstName);
    writeNotNull('last_name', lastName);
    writeNotNull('all_members_are_administrators', allMembersAreAdministrators);
    writeNotNull('photo', photo);
    writeNotNull('description', description);
    writeNotNull('invite_link', inviteLink);
    writeNotNull('pinned_message', pinnedMessage);
    writeNotNull('sticker_set_name', stickerSetName);
    writeNotNull('can_set_sticker_set', canSetStickerSet);
    return val;
  }
}

InputMedia _$InputMediaFromJson(Map<String, dynamic> json) {
  return new InputMedia(
      $enumDecodeNullable(
          'InputMediaType', InputMediaType.values, json['type'] as String),
      json['media'] as String,
      caption: json['caption'] as String,
      parseMode: $enumDecodeNullable(
          'ParseMode', ParseMode.values, json['parse_mode'] as String),
      width: json['width'] as int,
      height: json['height'] as int,
      duration: json['duration'] as int,
      supportsStreaming: json['supports_streaming'] as bool);
}

abstract class _$InputMediaSerializerMixin {
  InputMediaType get type;
  String get media;
  String get caption;
  ParseMode get parseMode;
  int get width;
  int get height;
  int get duration;
  bool get supportsStreaming;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'type': type?.toString()?.split('.')?.last,
      'media': media,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('caption', caption);
    writeNotNull('parse_mode', parseMode?.toString()?.split('.')?.last);
    writeNotNull('width', width);
    writeNotNull('height', height);
    writeNotNull('duration', duration);
    writeNotNull('supports_streaming', supportsStreaming);
    return val;
  }
}

InputFile _$InputFileFromJson(Map<String, dynamic> json) {
  return new InputFile(
      filepath: json['filepath'] as String,
      url: json['url'] as String,
      bytes: (json['bytes'] as List)?.map((e) => e as int)?.toList(),
      fileId: json['file_id'] as String);
}

abstract class _$InputFileSerializerMixin {
  String get filepath;
  String get url;
  List<int> get bytes;
  String get fileId;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'filepath': filepath,
        'url': url,
        'bytes': bytes,
        'file_id': fileId
      };
}

Audio _$AudioFromJson(Map<String, dynamic> json) {
  return new Audio(json['file_id'] as String, json['duration'] as int,
      performer: json['performer'] as String,
      title: json['title'] as String,
      mimeType: json['mime_type'] as String,
      fileSize: json['file_size'] as int);
}

abstract class _$AudioSerializerMixin {
  String get fileId;
  int get duration;
  String get performer;
  String get title;
  String get mimeType;
  int get fileSize;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'file_id': fileId,
      'duration': duration,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('performer', performer);
    writeNotNull('title', title);
    writeNotNull('mime_type', mimeType);
    writeNotNull('file_size', fileSize);
    return val;
  }
}

MessageEntity _$MessageEntityFromJson(Map<String, dynamic> json) {
  return new MessageEntity(
      $enumDecodeNullable('MessageEntityType', MessageEntityType.values,
          json['type'] as String),
      json['offset'] as int,
      json['length'] as int,
      url: json['url'] as String,
      user: json['user'] == null
          ? null
          : new User.fromJson(json['user'] as Map<String, dynamic>));
}

abstract class _$MessageEntitySerializerMixin {
  MessageEntityType get type;
  int get offset;
  int get length;
  String get url;
  User get user;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'type': type?.toString()?.split('.')?.last,
      'offset': offset,
      'length': length,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('url', url);
    writeNotNull('user', user);
    return val;
  }
}

PhotoSize _$PhotoSizeFromJson(Map<String, dynamic> json) {
  return new PhotoSize(
      json['file_id'] as String, json['width'] as int, json['height'] as int,
      fileSize: json['file_size'] as int);
}

abstract class _$PhotoSizeSerializerMixin {
  String get fileId;
  int get width;
  int get height;
  int get fileSize;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'file_id': fileId,
      'width': width,
      'height': height,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('file_size', fileSize);
    return val;
  }
}

Document _$DocumentFromJson(Map<String, dynamic> json) {
  return new Document(json['file_id'] as String,
      thumb: json['thumb'] == null
          ? null
          : new PhotoSize.fromJson(json['thumb'] as Map<String, dynamic>),
      fileName: json['file_name'] as String,
      mimeType: json['mime_type'] as String,
      fileSize: json['file_size'] as int);
}

abstract class _$DocumentSerializerMixin {
  String get fileId;
  PhotoSize get thumb;
  String get fileName;
  String get mimeType;
  int get fileSize;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'file_id': fileId,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('thumb', thumb);
    writeNotNull('file_name', fileName);
    writeNotNull('mime_type', mimeType);
    writeNotNull('file_size', fileSize);
    return val;
  }
}

Sticker _$StickerFromJson(Map<String, dynamic> json) {
  return new Sticker(
      json['file_id'] as String, json['width'] as int, json['height'] as int,
      thumb: json['thumb'] == null
          ? null
          : new PhotoSize.fromJson(json['thumb'] as Map<String, dynamic>),
      emoji: json['emoji'] as String,
      setName: json['set_name'] as String,
      maskPosition: json['mask_position'] == null
          ? null
          : new MaskPosition.fromJson(
              json['mask_position'] as Map<String, dynamic>),
      fileSize: json['file_size'] as int);
}

abstract class _$StickerSerializerMixin {
  String get fileId;
  int get width;
  int get height;
  PhotoSize get thumb;
  String get emoji;
  String get setName;
  MaskPosition get maskPosition;
  int get fileSize;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'file_id': fileId,
      'width': width,
      'height': height,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('thumb', thumb);
    writeNotNull('emoji', emoji);
    writeNotNull('set_name', setName);
    writeNotNull('mask_position', maskPosition);
    writeNotNull('file_size', fileSize);
    return val;
  }
}

StickerSet _$StickerSetFromJson(Map<String, dynamic> json) {
  return new StickerSet(
      json['name'] as String,
      json['title'] as String,
      json['contains_masks'] as bool,
      (json['stickers'] as List)
          ?.map((e) => e == null
              ? null
              : new Sticker.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

abstract class _$StickerSetSerializerMixin {
  String get name;
  String get title;
  bool get containsMasks;
  List<Sticker> get stickers;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'title': title,
        'contains_masks': containsMasks,
        'stickers': stickers
      };
}

MaskPosition _$MaskPositionFromJson(Map<String, dynamic> json) {
  return new MaskPosition(
      $enumDecodeNullable('MaskPositionPoint', MaskPositionPoint.values,
          json['point'] as String),
      (json['x_shift'] as num)?.toDouble(),
      (json['y_shift'] as num)?.toDouble(),
      (json['scale'] as num)?.toDouble());
}

abstract class _$MaskPositionSerializerMixin {
  MaskPositionPoint get point;
  double get xShift;
  double get yShift;
  double get scale;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'point': point?.toString()?.split('.')?.last,
        'x_shift': xShift,
        'y_shift': yShift,
        'scale': scale
      };
}

Video _$VideoFromJson(Map<String, dynamic> json) {
  return new Video(json['file_id'] as String, json['width'] as int,
      json['height'] as int, json['duration'] as int,
      thumb: json['thumb'] == null
          ? null
          : new PhotoSize.fromJson(json['thumb'] as Map<String, dynamic>),
      mimeType: json['mime_type'] as String,
      fileSize: json['file_size'] as int);
}

abstract class _$VideoSerializerMixin {
  String get fileId;
  int get width;
  int get height;
  int get duration;
  PhotoSize get thumb;
  String get mimeType;
  int get fileSize;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'file_id': fileId,
      'width': width,
      'height': height,
      'duration': duration,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('thumb', thumb);
    writeNotNull('mime_type', mimeType);
    writeNotNull('file_size', fileSize);
    return val;
  }
}

Voice _$VoiceFromJson(Map<String, dynamic> json) {
  return new Voice(json['file_id'] as String, json['duration'] as int,
      mimeType: json['mime_type'] as String,
      fileSize: json['file_size'] as int);
}

abstract class _$VoiceSerializerMixin {
  String get fileId;
  int get duration;
  String get mimeType;
  int get fileSize;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'file_id': fileId,
      'duration': duration,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('mime_type', mimeType);
    writeNotNull('file_size', fileSize);
    return val;
  }
}

VideoNote _$VideoNoteFromJson(Map<String, dynamic> json) {
  return new VideoNote(
      json['file_id'] as String, json['length'] as int, json['duration'] as int,
      thumb: json['thumb'] == null
          ? null
          : new PhotoSize.fromJson(json['thumb'] as Map<String, dynamic>),
      fileSize: json['file_size'] as int);
}

abstract class _$VideoNoteSerializerMixin {
  String get fileId;
  int get length;
  int get duration;
  PhotoSize get thumb;
  int get fileSize;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'file_id': fileId,
      'length': length,
      'duration': duration,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('thumb', thumb);
    writeNotNull('file_size', fileSize);
    return val;
  }
}

Contact _$ContactFromJson(Map<String, dynamic> json) {
  return new Contact(
      json['phone_number'] as String, json['first_name'] as String,
      lastName: json['last_name'] as String, userId: json['user_id'] as int);
}

abstract class _$ContactSerializerMixin {
  String get phoneNumber;
  String get firstName;
  String get lastName;
  int get userId;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'phone_number': phoneNumber,
      'first_name': firstName,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('last_name', lastName);
    writeNotNull('user_id', userId);
    return val;
  }
}

Location _$LocationFromJson(Map<String, dynamic> json) {
  return new Location((json['longitude'] as num)?.toDouble(),
      (json['latitude'] as num)?.toDouble());
}

abstract class _$LocationSerializerMixin {
  double get longitude;
  double get latitude;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'longitude': longitude, 'latitude': latitude};
}

Venue _$VenueFromJson(Map<String, dynamic> json) {
  return new Venue(
      json['location'] == null
          ? null
          : new Location.fromJson(json['location'] as Map<String, dynamic>),
      json['title'] as String,
      json['address'] as String,
      foursquareId: json['foursquare_id'] as String);
}

abstract class _$VenueSerializerMixin {
  Location get location;
  String get title;
  String get address;
  String get foursquareId;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'location': location,
      'title': title,
      'address': address,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('foursquare_id', foursquareId);
    return val;
  }
}

UserProfilePhotos _$UserProfilePhotosFromJson(Map<String, dynamic> json) {
  return new UserProfilePhotos(
      json['total_count'] as int,
      (json['photos'] as List)
          ?.map((e) => (e as List)
              ?.map((e) => e == null
                  ? null
                  : new PhotoSize.fromJson(e as Map<String, dynamic>))
              ?.toList())
          ?.toList());
}

abstract class _$UserProfilePhotosSerializerMixin {
  int get totalCount;
  List<List<PhotoSize>> get photos;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'total_count': totalCount, 'photos': photos};
}

FileObject _$FileObjectFromJson(Map<String, dynamic> json) {
  return new FileObject(json['file_id'] as String,
      fileSize: json['file_size'] as int,
      filePath: json['file_path'] as String);
}

abstract class _$FileObjectSerializerMixin {
  String get fileId;
  int get fileSize;
  String get filePath;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'file_id': fileId,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('file_size', fileSize);
    writeNotNull('file_path', filePath);
    return val;
  }
}

ReplyMarkup _$ReplyMarkupFromJson(Map<String, dynamic> json) {
  return new ReplyMarkup();
}

abstract class _$ReplyMarkupSerializerMixin {
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

ReplyKeyboardMarkup _$ReplyKeyboardMarkupFromJson(Map<String, dynamic> json) {
  return new ReplyKeyboardMarkup(
      (json['keyboard'] as List)
          ?.map((e) => (e as List)
              ?.map((e) => e == null
                  ? null
                  : new KeyboardButton.fromJson(e as Map<String, dynamic>))
              ?.toList())
          ?.toList(),
      resizeKeyboard: json['resize_keyboard'] as bool,
      oneTimeKeyboard: json['one_time_keyboard'] as bool,
      selective: json['selective'] as bool);
}

abstract class _$ReplyKeyboardMarkupSerializerMixin {
  List<List<KeyboardButton>> get keyboard;
  bool get resizeKeyboard;
  bool get oneTimeKeyboard;
  bool get selective;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'keyboard': keyboard,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('resize_keyboard', resizeKeyboard);
    writeNotNull('one_time_keyboard', oneTimeKeyboard);
    writeNotNull('selective', selective);
    return val;
  }
}

KeyboardButton _$KeyboardButtonFromJson(Map<String, dynamic> json) {
  return new KeyboardButton(json['text'] as String,
      requestContact: json['request_contact'] as bool,
      requestLocation: json['request_location'] as bool);
}

abstract class _$KeyboardButtonSerializerMixin {
  String get text;
  bool get requestContact;
  bool get requestLocation;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'text': text,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('request_contact', requestContact);
    writeNotNull('request_location', requestLocation);
    return val;
  }
}

ReplyKeyboardRemove _$ReplyKeyboardRemoveFromJson(Map<String, dynamic> json) {
  return new ReplyKeyboardRemove(json['remove_keyboard'] as bool,
      selective: json['selective'] as bool);
}

abstract class _$ReplyKeyboardRemoveSerializerMixin {
  bool get removeKeyboard;
  bool get selective;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'remove_keyboard': removeKeyboard,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('selective', selective);
    return val;
  }
}

InlineKeyboardMarkup _$InlineKeyboardMarkupFromJson(Map<String, dynamic> json) {
  return new InlineKeyboardMarkup((json['inline_keyboard'] as List)
      ?.map((e) => (e as List)
          ?.map((e) => e == null
              ? null
              : new InlineKeyboardButton.fromJson(e as Map<String, dynamic>))
          ?.toList())
      ?.toList());
}

abstract class _$InlineKeyboardMarkupSerializerMixin {
  List<List<InlineKeyboardButton>> get inlineKeyboard;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'inline_keyboard': inlineKeyboard};
}

InlineKeyboardButton _$InlineKeyboardButtonFromJson(Map<String, dynamic> json) {
  return new InlineKeyboardButton(json['text'] as String,
      url: json['url'] as String,
      callbackData: json['callback_data'] as String,
      switchInlineQuery: json['switch_inline_query'] as String,
      switchInlineQueryCurrentChat:
          json['switch_inline_query_current_chat'] as String,
      callbackGame: json['callback_game'] == null
          ? null
          : new CallbackGame.fromJson(
              json['callback_game'] as Map<String, dynamic>),
      pay: json['pay'] as bool);
}

abstract class _$InlineKeyboardButtonSerializerMixin {
  String get text;
  String get url;
  String get callbackData;
  String get switchInlineQuery;
  String get switchInlineQueryCurrentChat;
  CallbackGame get callbackGame;
  bool get pay;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'text': text,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('url', url);
    writeNotNull('callback_data', callbackData);
    writeNotNull('switch_inline_query', switchInlineQuery);
    writeNotNull(
        'switch_inline_query_current_chat', switchInlineQueryCurrentChat);
    writeNotNull('callback_game', callbackGame);
    writeNotNull('pay', pay);
    return val;
  }
}

CallbackQuery _$CallbackQueryFromJson(Map<String, dynamic> json) {
  return new CallbackQuery(
      json['id'] as String,
      json['from'] == null
          ? null
          : new User.fromJson(json['from'] as Map<String, dynamic>),
      json['chat_instance'] as String,
      message: json['message'] == null
          ? null
          : new Message.fromJson(json['message'] as Map<String, dynamic>),
      inlineMessageId: json['inline_message_id'] as String,
      data: json['data'] as String,
      gameShortName: json['game_short_name'] as String);
}

abstract class _$CallbackQuerySerializerMixin {
  String get id;
  User get from;
  Message get message;
  String get inlineMessageId;
  String get chatInstance;
  String get data;
  String get gameShortName;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'id': id,
      'from': from,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('message', message);
    writeNotNull('inline_message_id', inlineMessageId);
    writeNotNull('chat_instance', chatInstance);
    writeNotNull('data', data);
    writeNotNull('game_short_name', gameShortName);
    return val;
  }
}

ShippingQuery _$ShippingQueryFromJson(Map<String, dynamic> json) {
  return new ShippingQuery(
      json['id'] as String,
      json['from'] == null
          ? null
          : new User.fromJson(json['from'] as Map<String, dynamic>),
      json['invoice_payload'] as String,
      json['shipping_address'] == null
          ? null
          : new ShippingAddress.fromJson(
              json['shipping_address'] as Map<String, dynamic>));
}

abstract class _$ShippingQuerySerializerMixin {
  String get id;
  User get from;
  String get invoicePayload;
  ShippingAddress get shippingAddress;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'from': from,
        'invoice_payload': invoicePayload,
        'shipping_address': shippingAddress
      };
}

PreCheckoutQuery _$PreCheckoutQueryFromJson(Map<String, dynamic> json) {
  return new PreCheckoutQuery(
      json['id'] as String,
      json['from'] == null
          ? null
          : new User.fromJson(json['from'] as Map<String, dynamic>),
      json['currency'] as String,
      json['total_amount'] as int,
      json['invoice_payload'] as String,
      shippingOptionId: json['shipping_option_id'] as String,
      orderInfo: json['order_info'] == null
          ? null
          : new OrderInfo.fromJson(json['order_info'] as Map<String, dynamic>));
}

abstract class _$PreCheckoutQuerySerializerMixin {
  String get id;
  User get from;
  String get currency;
  int get totalAmount;
  String get invoicePayload;
  String get shippingOptionId;
  OrderInfo get orderInfo;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'id': id,
      'from': from,
      'currency': currency,
      'total_amount': totalAmount,
      'invoice_payload': invoicePayload,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('shipping_option_id', shippingOptionId);
    writeNotNull('order_info', orderInfo);
    return val;
  }
}

ForceReply _$ForceReplyFromJson(Map<String, dynamic> json) {
  return new ForceReply(json['force_reply'] as bool,
      selective: json['selective'] as bool);
}

abstract class _$ForceReplySerializerMixin {
  bool get forceReply;
  bool get selective;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'force_reply': forceReply,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('selective', selective);
    return val;
  }
}

ChatPhoto _$ChatPhotoFromJson(Map<String, dynamic> json) {
  return new ChatPhoto(
      json['small_file_id'] as String, json['big_file_id'] as String);
}

abstract class _$ChatPhotoSerializerMixin {
  String get smallFileId;
  String get bigFileId;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'small_file_id': smallFileId, 'big_file_id': bigFileId};
}

ChatMember _$ChatMemberFromJson(Map<String, dynamic> json) {
  return new ChatMember(
      json['user'] == null
          ? null
          : new User.fromJson(json['user'] as Map<String, dynamic>),
      $enumDecodeNullable('ChatMemberStatus', ChatMemberStatus.values,
          json['status'] as String),
      untilDate: json['until_date'] as int,
      canBeEdited: json['can_be_edited'] as bool,
      canChangeInfo: json['can_change_info'] as bool,
      canPostMessages: json['can_post_messages'] as bool,
      canEditMessages: json['can_edit_messages'] as bool,
      canDeleteMessages: json['can_delete_messages'] as bool,
      canInviteUsers: json['can_invite_users'] as bool,
      canRestrictMembers: json['can_restrict_members'] as bool,
      canPinMessages: json['can_pin_messages'] as bool,
      canPromoteMembers: json['can_promote_members'] as bool,
      canSendMessages: json['can_send_messages'] as bool,
      canSendMediaMessages: json['can_send_media_messages'] as bool,
      canSendOtherMessages: json['can_send_other_messages'] as bool,
      canAddWebPagePreviews: json['can_add_web_page_previews'] as bool);
}

abstract class _$ChatMemberSerializerMixin {
  User get user;
  ChatMemberStatus get status;
  int get untilDate;
  bool get canBeEdited;
  bool get canChangeInfo;
  bool get canPostMessages;
  bool get canEditMessages;
  bool get canDeleteMessages;
  bool get canInviteUsers;
  bool get canRestrictMembers;
  bool get canPinMessages;
  bool get canPromoteMembers;
  bool get canSendMessages;
  bool get canSendMediaMessages;
  bool get canSendOtherMessages;
  bool get canAddWebPagePreviews;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'user': user,
      'status': status?.toString()?.split('.')?.last,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('until_date', untilDate);
    writeNotNull('can_be_edited', canBeEdited);
    writeNotNull('can_change_info', canChangeInfo);
    writeNotNull('can_post_messages', canPostMessages);
    writeNotNull('can_edit_messages', canEditMessages);
    writeNotNull('can_delete_messages', canDeleteMessages);
    writeNotNull('can_invite_users', canInviteUsers);
    writeNotNull('can_restrict_members', canRestrictMembers);
    writeNotNull('can_pin_messages', canPinMessages);
    writeNotNull('can_promote_members', canPromoteMembers);
    writeNotNull('can_send_messages', canSendMessages);
    writeNotNull('can_send_media_messages', canSendMediaMessages);
    writeNotNull('can_send_other_messages', canSendOtherMessages);
    writeNotNull('can_add_web_page_previews', canAddWebPagePreviews);
    return val;
  }
}

Message _$MessageFromJson(Map<String, dynamic> json) {
  return new Message(json['message_id'] as int, json['date'] as int,
      json['chat'] == null ? null : new Chat.fromJson(json['chat'] as Map<String, dynamic>),
      from: json['from'] == null
          ? null
          : new User.fromJson(json['from'] as Map<String, dynamic>),
      forwardFrom: json['forward_from'] == null
          ? null
          : new User.fromJson(json['forward_from'] as Map<String, dynamic>),
      forwardFromChat: json['forward_from_chat'] == null
          ? null
          : new Chat.fromJson(
              json['forward_from_chat'] as Map<String, dynamic>),
      forwardFromMessageId: json['forward_from_message_id'] as int,
      forwardSignature: json['forward_signature'] as String,
      forwardDate: json['forward_date'] as int,
      replyToMessage: json['reply_to_message'] == null
          ? null
          : new Message.fromJson(
              json['reply_to_message'] as Map<String, dynamic>),
      editDate: json['edit_date'] as int,
      authorSignature: json['author_signature'] as String,
      text: json['text'] as String,
      entities: (json['entities'] as List)
          ?.map((e) => e == null
              ? null
              : new MessageEntity.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      captionEntities: (json['caption_entities'] as List)
          ?.map((e) => e == null
              ? null
              : new MessageEntity.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      audio: json['audio'] == null
          ? null
          : new Audio.fromJson(json['audio'] as Map<String, dynamic>),
      document: json['document'] == null
          ? null
          : new Document.fromJson(json['document'] as Map<String, dynamic>),
      game: json['game'] == null
          ? null
          : new Game.fromJson(json['game'] as Map<String, dynamic>),
      photo: (json['photo'] as List)?.map((e) => e == null ? null : new PhotoSize.fromJson(e as Map<String, dynamic>))?.toList(),
      sticker: json['sticker'] == null ? null : new Sticker.fromJson(json['sticker'] as Map<String, dynamic>),
      video: json['video'] == null ? null : new Video.fromJson(json['video'] as Map<String, dynamic>),
      voice: json['voice'] == null ? null : new Voice.fromJson(json['voice'] as Map<String, dynamic>),
      videoNote: json['video_note'] == null ? null : new VideoNote.fromJson(json['video_note'] as Map<String, dynamic>),
      caption: json['caption'] as String,
      contact: json['contact'] == null ? null : new Contact.fromJson(json['contact'] as Map<String, dynamic>),
      location: json['location'] == null ? null : new Location.fromJson(json['location'] as Map<String, dynamic>),
      venue: json['venue'] == null ? null : new Venue.fromJson(json['venue'] as Map<String, dynamic>),
      newChatMembers: (json['new_chat_members'] as List)?.map((e) => e == null ? null : new User.fromJson(e as Map<String, dynamic>))?.toList(),
      leftChatMember: json['left_chat_member'] == null ? null : new User.fromJson(json['left_chat_member'] as Map<String, dynamic>),
      newChatTitle: json['new_chat_title'] as String,
      newChatPhoto: (json['new_chat_photo'] as List)?.map((e) => e == null ? null : new PhotoSize.fromJson(e as Map<String, dynamic>))?.toList(),
      deleteChatPhoto: json['delete_chat_photo'] as bool,
      groupChatCreated: json['group_chat_created'] as bool,
      supergroupChatCreated: json['supergroup_chat_created'] as bool,
      channelChatCreated: json['channel_chat_created'] as bool,
      migrateToChatId: json['migrate_to_chat_id'] as int,
      migrateFromChatId: json['migrate_from_chat_id'] as int,
      pinnedMessage: json['pinned_message'] == null ? null : new Message.fromJson(json['pinned_message'] as Map<String, dynamic>),
      invoice: json['invoice'] == null ? null : new Invoice.fromJson(json['invoice'] as Map<String, dynamic>),
      successfulPayment: json['successful_payment'] == null ? null : new SuccessfulPayment.fromJson(json['successful_payment'] as Map<String, dynamic>),
      connectedWebsite: json['connected_website'] as String);
}

abstract class _$MessageSerializerMixin {
  int get messageId;
  User get from;
  int get date;
  Chat get chat;
  User get forwardFrom;
  Chat get forwardFromChat;
  int get forwardFromMessageId;
  String get forwardSignature;
  int get forwardDate;
  Message get replyToMessage;
  int get editDate;
  String get authorSignature;
  String get text;
  List<MessageEntity> get entities;
  List<MessageEntity> get captionEntities;
  Audio get audio;
  Document get document;
  Game get game;
  List<PhotoSize> get photo;
  Sticker get sticker;
  Video get video;
  Voice get voice;
  VideoNote get videoNote;
  String get caption;
  Contact get contact;
  Location get location;
  Venue get venue;
  List<User> get newChatMembers;
  User get leftChatMember;
  String get newChatTitle;
  List<PhotoSize> get newChatPhoto;
  bool get deleteChatPhoto;
  bool get groupChatCreated;
  bool get supergroupChatCreated;
  bool get channelChatCreated;
  int get migrateToChatId;
  int get migrateFromChatId;
  Message get pinnedMessage;
  Invoice get invoice;
  SuccessfulPayment get successfulPayment;
  String get connectedWebsite;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'message_id': messageId,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('from', from);
    val['date'] = date;
    val['chat'] = chat;
    writeNotNull('forward_from', forwardFrom);
    writeNotNull('forward_from_chat', forwardFromChat);
    writeNotNull('forward_from_message_id', forwardFromMessageId);
    writeNotNull('forward_signature', forwardSignature);
    writeNotNull('forward_date', forwardDate);
    writeNotNull('reply_to_message', replyToMessage);
    writeNotNull('edit_date', editDate);
    writeNotNull('author_signature', authorSignature);
    writeNotNull('text', text);
    writeNotNull('entities', entities);
    writeNotNull('caption_entities', captionEntities);
    writeNotNull('audio', audio);
    writeNotNull('document', document);
    writeNotNull('game', game);
    writeNotNull('photo', photo);
    writeNotNull('sticker', sticker);
    writeNotNull('video', video);
    writeNotNull('voice', voice);
    writeNotNull('video_note', videoNote);
    writeNotNull('caption', caption);
    writeNotNull('contact', contact);
    writeNotNull('location', location);
    writeNotNull('venue', venue);
    writeNotNull('new_chat_members', newChatMembers);
    writeNotNull('left_chat_member', leftChatMember);
    writeNotNull('new_chat_title', newChatTitle);
    writeNotNull('new_chat_photo', newChatPhoto);
    writeNotNull('delete_chat_photo', deleteChatPhoto);
    writeNotNull('group_chat_created', groupChatCreated);
    writeNotNull('supergroup_chat_created', supergroupChatCreated);
    writeNotNull('channel_chat_created', channelChatCreated);
    writeNotNull('migrate_to_chat_id', migrateToChatId);
    writeNotNull('migrate_from_chat_id', migrateFromChatId);
    writeNotNull('pinned_message', pinnedMessage);
    writeNotNull('invoice', invoice);
    writeNotNull('successful_payment', successfulPayment);
    writeNotNull('connected_website', connectedWebsite);
    return val;
  }
}

InlineQuery _$InlineQueryFromJson(Map<String, dynamic> json) {
  return new InlineQuery(
      json['id'] as String,
      json['from'] == null
          ? null
          : new User.fromJson(json['from'] as Map<String, dynamic>),
      json['query'] as String,
      json['offset'] as String,
      location: json['location'] == null
          ? null
          : new Location.fromJson(json['location'] as Map<String, dynamic>));
}

abstract class _$InlineQuerySerializerMixin {
  String get id;
  User get from;
  Location get location;
  String get query;
  String get offset;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'id': id,
      'from': from,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('location', location);
    val['query'] = query;
    val['offset'] = offset;
    return val;
  }
}

ChosenInlineResult _$ChosenInlineResultFromJson(Map<String, dynamic> json) {
  return new ChosenInlineResult(
      json['result_id'] as String,
      json['from'] == null
          ? null
          : new User.fromJson(json['from'] as Map<String, dynamic>),
      json['query'] as String,
      location: json['location'] == null
          ? null
          : new Location.fromJson(json['location'] as Map<String, dynamic>),
      inlineMessageId: json['inline_message_id'] as String);
}

abstract class _$ChosenInlineResultSerializerMixin {
  String get resultId;
  User get from;
  Location get location;
  String get inlineMessageId;
  String get query;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'result_id': resultId,
      'from': from,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('location', location);
    writeNotNull('inline_message_id', inlineMessageId);
    val['query'] = query;
    return val;
  }
}

InlineQueryResult _$InlineQueryResultFromJson(Map<String, dynamic> json) {
  return new InlineQueryResult(
      $enumDecodeNullable('InlineQueryResultType', InlineQueryResultType.values,
          json['type'] as String),
      json['id'] as String);
}

abstract class _$InlineQueryResultSerializerMixin {
  InlineQueryResultType get type;
  String get id;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'type': type?.toString()?.split('.')?.last, 'id': id};
}

InlineQueryResultArticle _$InlineQueryResultArticleFromJson(
    Map<String, dynamic> json) {
  return new InlineQueryResultArticle(
      json['title'] as String,
      json['input_message_content'] == null
          ? null
          : new InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>),
      url: json['url'] as String,
      hideUrl: json['hide_url'] as bool,
      description: json['description'] as String,
      thumbUrl: json['thumb_url'] as String,
      thumbWidth: json['thumb_width'] as int,
      thumbHeight: json['thumb_height'] as int)
    ..type = $enumDecodeNullable('InlineQueryResultType',
        InlineQueryResultType.values, json['type'] as String)
    ..id = json['id'] as String
    ..replyMarkup = json['reply_markup'] == null
        ? null
        : new InlineKeyboardMarkup.fromJson(
            json['reply_markup'] as Map<String, dynamic>);
}

abstract class _$InlineQueryResultArticleSerializerMixin {
  InlineQueryResultType get type;
  String get id;
  String get title;
  InputMessageContent get inputMessageContent;
  InlineKeyboardMarkup get replyMarkup;
  String get url;
  bool get hideUrl;
  String get description;
  String get thumbUrl;
  int get thumbWidth;
  int get thumbHeight;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'type': type?.toString()?.split('.')?.last,
      'id': id,
      'title': title,
      'input_message_content': inputMessageContent,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('reply_markup', replyMarkup);
    writeNotNull('url', url);
    writeNotNull('hide_url', hideUrl);
    writeNotNull('description', description);
    writeNotNull('thumb_url', thumbUrl);
    writeNotNull('thumb_width', thumbWidth);
    writeNotNull('thumb_height', thumbHeight);
    return val;
  }
}

InlineQueryResultPhoto _$InlineQueryResultPhotoFromJson(
    Map<String, dynamic> json) {
  return new InlineQueryResultPhoto(
      json['photo_url'] as String, json['thumb_url'] as String,
      photoWidth: json['photo_width'] as int,
      photoHeight: json['photo_height'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      caption: json['caption'] as String,
      parseMode: $enumDecodeNullable(
          'ParseMode', ParseMode.values, json['parse_mode'] as String),
      replyMarkup: json['reply_markup'] == null
          ? null
          : new InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      inputMessageContent: json['input_message_content'] == null
          ? null
          : new InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>))
    ..type = $enumDecodeNullable('InlineQueryResultType',
        InlineQueryResultType.values, json['type'] as String)
    ..id = json['id'] as String;
}

abstract class _$InlineQueryResultPhotoSerializerMixin {
  InlineQueryResultType get type;
  String get id;
  String get photoUrl;
  int get photoWidth;
  int get photoHeight;
  String get thumbUrl;
  String get title;
  String get description;
  String get caption;
  ParseMode get parseMode;
  InlineKeyboardMarkup get replyMarkup;
  InputMessageContent get inputMessageContent;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'type': type?.toString()?.split('.')?.last,
      'id': id,
      'photo_url': photoUrl,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('photo_width', photoWidth);
    writeNotNull('photo_height', photoHeight);
    val['thumb_url'] = thumbUrl;
    writeNotNull('title', title);
    writeNotNull('description', description);
    writeNotNull('caption', caption);
    writeNotNull('parse_mode', parseMode?.toString()?.split('.')?.last);
    writeNotNull('reply_markup', replyMarkup);
    writeNotNull('input_message_content', inputMessageContent);
    return val;
  }
}

InlineQueryResultGif _$InlineQueryResultGifFromJson(Map<String, dynamic> json) {
  return new InlineQueryResultGif(
      json['gif_url'] as String, json['thumb_url'] as String,
      gifWidth: json['gif_width'] as int,
      gifHeight: json['gif_height'] as int,
      gifDuration: json['gif_duration'] as int,
      title: json['title'] as String,
      caption: json['caption'] as String,
      parseMode: $enumDecodeNullable(
          'ParseMode', ParseMode.values, json['parse_mode'] as String),
      replyMarkup: json['reply_markup'] == null
          ? null
          : new InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      inputMessageContent: json['input_message_content'] == null
          ? null
          : new InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>))
    ..type = $enumDecodeNullable('InlineQueryResultType',
        InlineQueryResultType.values, json['type'] as String)
    ..id = json['id'] as String;
}

abstract class _$InlineQueryResultGifSerializerMixin {
  InlineQueryResultType get type;
  String get id;
  String get gifUrl;
  int get gifWidth;
  int get gifHeight;
  int get gifDuration;
  String get thumbUrl;
  String get title;
  String get caption;
  ParseMode get parseMode;
  InlineKeyboardMarkup get replyMarkup;
  InputMessageContent get inputMessageContent;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'type': type?.toString()?.split('.')?.last,
      'id': id,
      'gif_url': gifUrl,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('gif_width', gifWidth);
    writeNotNull('gif_height', gifHeight);
    writeNotNull('gif_duration', gifDuration);
    val['thumb_url'] = thumbUrl;
    writeNotNull('title', title);
    writeNotNull('caption', caption);
    writeNotNull('parse_mode', parseMode?.toString()?.split('.')?.last);
    writeNotNull('reply_markup', replyMarkup);
    writeNotNull('input_message_content', inputMessageContent);
    return val;
  }
}

InlineQueryResultMpeg4Gif _$InlineQueryResultMpeg4GifFromJson(
    Map<String, dynamic> json) {
  return new InlineQueryResultMpeg4Gif(
      json['mpeg4_url'] as String, json['thumb_url'] as String,
      mpeg4Width: json['mpeg4_width'] as int,
      mpeg4Height: json['mpeg4_height'] as int,
      mpeg4Duration: json['mpeg4_duration'] as int,
      title: json['title'] as String,
      caption: json['caption'] as String,
      parseMode: $enumDecodeNullable(
          'ParseMode', ParseMode.values, json['parse_mode'] as String),
      replyMarkup: json['reply_markup'] == null
          ? null
          : new InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      inputMessageContent: json['input_message_content'] == null
          ? null
          : new InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>))
    ..type = $enumDecodeNullable('InlineQueryResultType',
        InlineQueryResultType.values, json['type'] as String)
    ..id = json['id'] as String;
}

abstract class _$InlineQueryResultMpeg4GifSerializerMixin {
  InlineQueryResultType get type;
  String get id;
  String get mpeg4Url;
  int get mpeg4Width;
  int get mpeg4Height;
  int get mpeg4Duration;
  String get thumbUrl;
  String get title;
  String get caption;
  ParseMode get parseMode;
  InlineKeyboardMarkup get replyMarkup;
  InputMessageContent get inputMessageContent;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'type': type?.toString()?.split('.')?.last,
      'id': id,
      'mpeg4_url': mpeg4Url,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('mpeg4_width', mpeg4Width);
    writeNotNull('mpeg4_height', mpeg4Height);
    writeNotNull('mpeg4_duration', mpeg4Duration);
    val['thumb_url'] = thumbUrl;
    writeNotNull('title', title);
    writeNotNull('caption', caption);
    writeNotNull('parse_mode', parseMode?.toString()?.split('.')?.last);
    writeNotNull('reply_markup', replyMarkup);
    writeNotNull('input_message_content', inputMessageContent);
    return val;
  }
}

InlineQueryResultVideo _$InlineQueryResultVideoFromJson(
    Map<String, dynamic> json) {
  return new InlineQueryResultVideo(
      json['video_url'] as String,
      $enumDecodeNullable(
          'VideoMimeType', VideoMimeType.values, json['mime_type'] as String),
      json['thumb_url'] as String,
      json['title'] as String,
      caption: json['caption'] as String,
      parseMode: $enumDecodeNullable(
          'ParseMode', ParseMode.values, json['parse_mode'] as String),
      videoWidth: json['video_width'] as int,
      videoHeight: json['video_height'] as int,
      videoDuration: json['video_duration'] as int,
      description: json['description'] as String,
      replyMarkup: json['reply_markup'] == null
          ? null
          : new InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      inputMessageContent: json['input_message_content'] == null
          ? null
          : new InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>))
    ..type = $enumDecodeNullable('InlineQueryResultType',
        InlineQueryResultType.values, json['type'] as String)
    ..id = json['id'] as String;
}

abstract class _$InlineQueryResultVideoSerializerMixin {
  InlineQueryResultType get type;
  String get id;
  String get videoUrl;
  VideoMimeType get mimeType;
  String get thumbUrl;
  String get title;
  String get caption;
  ParseMode get parseMode;
  int get videoWidth;
  int get videoHeight;
  int get videoDuration;
  String get description;
  InlineKeyboardMarkup get replyMarkup;
  InputMessageContent get inputMessageContent;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'type': type?.toString()?.split('.')?.last,
      'id': id,
      'video_url': videoUrl,
      'mime_type': mimeType?.toString()?.split('.')?.last,
      'thumb_url': thumbUrl,
      'title': title,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('caption', caption);
    writeNotNull('parse_mode', parseMode?.toString()?.split('.')?.last);
    writeNotNull('video_width', videoWidth);
    writeNotNull('video_height', videoHeight);
    writeNotNull('video_duration', videoDuration);
    writeNotNull('description', description);
    writeNotNull('reply_markup', replyMarkup);
    writeNotNull('input_message_content', inputMessageContent);
    return val;
  }
}

InlineQueryResultAudio _$InlineQueryResultAudioFromJson(
    Map<String, dynamic> json) {
  return new InlineQueryResultAudio(
      json['audio_url'] as String, json['title'] as String,
      caption: json['caption'] as String,
      parseMode: $enumDecodeNullable(
          'ParseMode', ParseMode.values, json['parse_mode'] as String),
      performer: json['performer'] as String,
      audioDuration: json['audio_duration'] as int,
      replyMarkup: json['reply_markup'] == null
          ? null
          : new InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      inputMessageContent: json['input_message_content'] == null
          ? null
          : new InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>))
    ..type = $enumDecodeNullable('InlineQueryResultType',
        InlineQueryResultType.values, json['type'] as String)
    ..id = json['id'] as String;
}

abstract class _$InlineQueryResultAudioSerializerMixin {
  InlineQueryResultType get type;
  String get id;
  String get audioUrl;
  String get title;
  String get caption;
  ParseMode get parseMode;
  String get performer;
  int get audioDuration;
  InlineKeyboardMarkup get replyMarkup;
  InputMessageContent get inputMessageContent;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'type': type?.toString()?.split('.')?.last,
      'id': id,
      'audio_url': audioUrl,
      'title': title,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('caption', caption);
    writeNotNull('parse_mode', parseMode?.toString()?.split('.')?.last);
    writeNotNull('performer', performer);
    writeNotNull('audio_duration', audioDuration);
    writeNotNull('reply_markup', replyMarkup);
    writeNotNull('input_message_content', inputMessageContent);
    return val;
  }
}

InlineQueryResultVoice _$InlineQueryResultVoiceFromJson(
    Map<String, dynamic> json) {
  return new InlineQueryResultVoice(
      json['voice_url'] as String, json['title'] as String,
      caption: json['caption'] as String,
      parseMode: $enumDecodeNullable(
          'ParseMode', ParseMode.values, json['parse_mode'] as String),
      voiceDuration: json['voice_duration'] as int,
      replyMarkup: json['reply_markup'] == null
          ? null
          : new InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      inputMessageContent: json['input_message_content'] == null
          ? null
          : new InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>))
    ..type = $enumDecodeNullable('InlineQueryResultType',
        InlineQueryResultType.values, json['type'] as String)
    ..id = json['id'] as String;
}

abstract class _$InlineQueryResultVoiceSerializerMixin {
  InlineQueryResultType get type;
  String get id;
  String get voiceUrl;
  String get title;
  String get caption;
  ParseMode get parseMode;
  int get voiceDuration;
  InlineKeyboardMarkup get replyMarkup;
  InputMessageContent get inputMessageContent;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'type': type?.toString()?.split('.')?.last,
      'id': id,
      'voice_url': voiceUrl,
      'title': title,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('caption', caption);
    writeNotNull('parse_mode', parseMode?.toString()?.split('.')?.last);
    writeNotNull('voice_duration', voiceDuration);
    writeNotNull('reply_markup', replyMarkup);
    writeNotNull('input_message_content', inputMessageContent);
    return val;
  }
}

InlineQueryResultDocument _$InlineQueryResultDocumentFromJson(
    Map<String, dynamic> json) {
  return new InlineQueryResultDocument(
      json['title'] as String,
      json['document_url'] as String,
      $enumDecodeNullable('DocumentMimeType', DocumentMimeType.values,
          json['mime_type'] as String),
      caption: json['caption'] as String,
      parseMode: $enumDecodeNullable(
          'ParseMode', ParseMode.values, json['parse_mode'] as String),
      description: json['description'] as String,
      replyMarkup: json['reply_markup'] == null
          ? null
          : new InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      inputMessageContent: json['input_message_content'] == null
          ? null
          : new InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>),
      thumbUrl: json['thumb_url'] as String,
      thumbWidth: json['thumb_width'] as int,
      thumbHeight: json['thumb_height'] as int)
    ..type = $enumDecodeNullable('InlineQueryResultType',
        InlineQueryResultType.values, json['type'] as String)
    ..id = json['id'] as String;
}

abstract class _$InlineQueryResultDocumentSerializerMixin {
  InlineQueryResultType get type;
  String get id;
  String get title;
  String get caption;
  ParseMode get parseMode;
  String get documentUrl;
  DocumentMimeType get mimeType;
  String get description;
  InlineKeyboardMarkup get replyMarkup;
  InputMessageContent get inputMessageContent;
  String get thumbUrl;
  int get thumbWidth;
  int get thumbHeight;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'type': type?.toString()?.split('.')?.last,
      'id': id,
      'title': title,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('caption', caption);
    writeNotNull('parse_mode', parseMode?.toString()?.split('.')?.last);
    val['document_url'] = documentUrl;
    val['mime_type'] = mimeType?.toString()?.split('.')?.last;
    writeNotNull('description', description);
    writeNotNull('reply_markup', replyMarkup);
    writeNotNull('input_message_content', inputMessageContent);
    writeNotNull('thumb_url', thumbUrl);
    writeNotNull('thumb_width', thumbWidth);
    writeNotNull('thumb_height', thumbHeight);
    return val;
  }
}

InlineQueryResultLocation _$InlineQueryResultLocationFromJson(
    Map<String, dynamic> json) {
  return new InlineQueryResultLocation((json['latitude'] as num)?.toDouble(),
      (json['longitude'] as num)?.toDouble(), json['title'] as String,
      replyMarkup: json['reply_markup'] == null
          ? null
          : new InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      inputMessageContent: json['input_message_content'] == null
          ? null
          : new InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>),
      thumbUrl: json['thumb_url'] as String,
      thumbWidth: json['thumb_width'] as int,
      thumbHeight: json['thumb_height'] as int)
    ..type = $enumDecodeNullable('InlineQueryResultType',
        InlineQueryResultType.values, json['type'] as String)
    ..id = json['id'] as String;
}

abstract class _$InlineQueryResultLocationSerializerMixin {
  InlineQueryResultType get type;
  String get id;
  double get latitude;
  double get longitude;
  String get title;
  InlineKeyboardMarkup get replyMarkup;
  InputMessageContent get inputMessageContent;
  String get thumbUrl;
  int get thumbWidth;
  int get thumbHeight;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'type': type?.toString()?.split('.')?.last,
      'id': id,
      'latitude': latitude,
      'longitude': longitude,
      'title': title,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('reply_markup', replyMarkup);
    writeNotNull('input_message_content', inputMessageContent);
    writeNotNull('thumb_url', thumbUrl);
    writeNotNull('thumb_width', thumbWidth);
    writeNotNull('thumb_height', thumbHeight);
    return val;
  }
}

InlineQueryResultVenue _$InlineQueryResultVenueFromJson(
    Map<String, dynamic> json) {
  return new InlineQueryResultVenue(
      (json['latitude'] as num)?.toDouble(),
      (json['longitude'] as num)?.toDouble(),
      json['title'] as String,
      json['address'] as String,
      foursquareId: json['foursquare_id'] as String,
      replyMarkup: json['reply_markup'] == null
          ? null
          : new InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      inputMessageContent: json['input_message_content'] == null
          ? null
          : new InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>),
      thumbUrl: json['thumb_url'] as String,
      thumbWidth: json['thumb_width'] as int,
      thumbHeight: json['thumb_height'] as int)
    ..type = $enumDecodeNullable('InlineQueryResultType',
        InlineQueryResultType.values, json['type'] as String)
    ..id = json['id'] as String;
}

abstract class _$InlineQueryResultVenueSerializerMixin {
  InlineQueryResultType get type;
  String get id;
  double get latitude;
  double get longitude;
  String get title;
  String get address;
  String get foursquareId;
  InlineKeyboardMarkup get replyMarkup;
  InputMessageContent get inputMessageContent;
  String get thumbUrl;
  int get thumbWidth;
  int get thumbHeight;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'type': type?.toString()?.split('.')?.last,
      'id': id,
      'latitude': latitude,
      'longitude': longitude,
      'title': title,
      'address': address,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('foursquare_id', foursquareId);
    writeNotNull('reply_markup', replyMarkup);
    writeNotNull('input_message_content', inputMessageContent);
    writeNotNull('thumb_url', thumbUrl);
    writeNotNull('thumb_width', thumbWidth);
    writeNotNull('thumb_height', thumbHeight);
    return val;
  }
}

InlineQueryResultContact _$InlineQueryResultContactFromJson(
    Map<String, dynamic> json) {
  return new InlineQueryResultContact(
      json['phone_number'] as String, json['first_name'] as String,
      lastName: json['last_name'] as String,
      replyMarkup: json['reply_markup'] == null
          ? null
          : new InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      inputMessageContent: json['input_message_content'] == null
          ? null
          : new InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>),
      thumbUrl: json['thumb_url'] as String,
      thumbWidth: json['thumb_width'] as int,
      thumbHeight: json['thumb_height'] as int)
    ..type = $enumDecodeNullable('InlineQueryResultType',
        InlineQueryResultType.values, json['type'] as String)
    ..id = json['id'] as String;
}

abstract class _$InlineQueryResultContactSerializerMixin {
  InlineQueryResultType get type;
  String get id;
  String get phoneNumber;
  String get firstName;
  String get lastName;
  InlineKeyboardMarkup get replyMarkup;
  InputMessageContent get inputMessageContent;
  String get thumbUrl;
  int get thumbWidth;
  int get thumbHeight;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'type': type?.toString()?.split('.')?.last,
      'id': id,
      'phone_number': phoneNumber,
      'first_name': firstName,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('last_name', lastName);
    writeNotNull('reply_markup', replyMarkup);
    writeNotNull('input_message_content', inputMessageContent);
    writeNotNull('thumb_url', thumbUrl);
    writeNotNull('thumb_width', thumbWidth);
    writeNotNull('thumb_height', thumbHeight);
    return val;
  }
}

InlineQueryResultGame _$InlineQueryResultGameFromJson(
    Map<String, dynamic> json) {
  return new InlineQueryResultGame(json['game_short_name'] as String,
      replyMarkup: json['reply_markup'] == null
          ? null
          : new InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>))
    ..type = $enumDecodeNullable('InlineQueryResultType',
        InlineQueryResultType.values, json['type'] as String)
    ..id = json['id'] as String;
}

abstract class _$InlineQueryResultGameSerializerMixin {
  InlineQueryResultType get type;
  String get id;
  String get gameShortName;
  InlineKeyboardMarkup get replyMarkup;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'type': type?.toString()?.split('.')?.last,
      'id': id,
      'game_short_name': gameShortName,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('reply_markup', replyMarkup);
    return val;
  }
}

InlineQueryResultCachedPhoto _$InlineQueryResultCachedPhotoFromJson(
    Map<String, dynamic> json) {
  return new InlineQueryResultCachedPhoto(json['photo_file_id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      caption: json['caption'] as String,
      parseMode: $enumDecodeNullable(
          'ParseMode', ParseMode.values, json['parse_mode'] as String),
      replyMarkup: json['reply_markup'] == null
          ? null
          : new InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      inputMessageContent: json['input_message_content'] == null
          ? null
          : new InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>))
    ..type = $enumDecodeNullable('InlineQueryResultType',
        InlineQueryResultType.values, json['type'] as String)
    ..id = json['id'] as String;
}

abstract class _$InlineQueryResultCachedPhotoSerializerMixin {
  InlineQueryResultType get type;
  String get id;
  String get photoFileId;
  String get title;
  String get description;
  String get caption;
  ParseMode get parseMode;
  InlineKeyboardMarkup get replyMarkup;
  InputMessageContent get inputMessageContent;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'type': type?.toString()?.split('.')?.last,
      'id': id,
      'photo_file_id': photoFileId,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('title', title);
    writeNotNull('description', description);
    writeNotNull('caption', caption);
    writeNotNull('parse_mode', parseMode?.toString()?.split('.')?.last);
    writeNotNull('reply_markup', replyMarkup);
    writeNotNull('input_message_content', inputMessageContent);
    return val;
  }
}

InlineQueryResultCachedGif _$InlineQueryResultCachedGifFromJson(
    Map<String, dynamic> json) {
  return new InlineQueryResultCachedGif(json['gif_file_id'] as String,
      title: json['title'] as String,
      caption: json['caption'] as String,
      parseMode: $enumDecodeNullable(
          'ParseMode', ParseMode.values, json['parse_mode'] as String),
      replyMarkup: json['reply_markup'] == null
          ? null
          : new InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      inputMessageContent: json['input_message_content'] == null
          ? null
          : new InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>))
    ..type = $enumDecodeNullable('InlineQueryResultType',
        InlineQueryResultType.values, json['type'] as String)
    ..id = json['id'] as String;
}

abstract class _$InlineQueryResultCachedGifSerializerMixin {
  InlineQueryResultType get type;
  String get id;
  String get gifFileId;
  String get title;
  String get caption;
  ParseMode get parseMode;
  InlineKeyboardMarkup get replyMarkup;
  InputMessageContent get inputMessageContent;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'type': type?.toString()?.split('.')?.last,
      'id': id,
      'gif_file_id': gifFileId,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('title', title);
    writeNotNull('caption', caption);
    writeNotNull('parse_mode', parseMode?.toString()?.split('.')?.last);
    writeNotNull('reply_markup', replyMarkup);
    writeNotNull('input_message_content', inputMessageContent);
    return val;
  }
}

InlineQueryResultCachedMpeg4Gif _$InlineQueryResultCachedMpeg4GifFromJson(
    Map<String, dynamic> json) {
  return new InlineQueryResultCachedMpeg4Gif(json['mpeg4_file_id'] as String,
      title: json['title'] as String,
      caption: json['caption'] as String,
      parseMode: $enumDecodeNullable(
          'ParseMode', ParseMode.values, json['parse_mode'] as String),
      replyMarkup: json['reply_markup'] == null
          ? null
          : new InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      inputMessageContent: json['input_message_content'] == null
          ? null
          : new InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>))
    ..type = $enumDecodeNullable('InlineQueryResultType',
        InlineQueryResultType.values, json['type'] as String)
    ..id = json['id'] as String;
}

abstract class _$InlineQueryResultCachedMpeg4GifSerializerMixin {
  InlineQueryResultType get type;
  String get id;
  String get mpeg4FileId;
  String get title;
  String get caption;
  ParseMode get parseMode;
  InlineKeyboardMarkup get replyMarkup;
  InputMessageContent get inputMessageContent;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'type': type?.toString()?.split('.')?.last,
      'id': id,
      'mpeg4_file_id': mpeg4FileId,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('title', title);
    writeNotNull('caption', caption);
    writeNotNull('parse_mode', parseMode?.toString()?.split('.')?.last);
    writeNotNull('reply_markup', replyMarkup);
    writeNotNull('input_message_content', inputMessageContent);
    return val;
  }
}

InlineQueryResultCachedSticker _$InlineQueryResultCachedStickerFromJson(
    Map<String, dynamic> json) {
  return new InlineQueryResultCachedSticker(json['sticker_file_id'] as String,
      replyMarkup: json['reply_markup'] == null
          ? null
          : new InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      inputMessageContent: json['input_message_content'] == null
          ? null
          : new InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>))
    ..type = $enumDecodeNullable('InlineQueryResultType',
        InlineQueryResultType.values, json['type'] as String)
    ..id = json['id'] as String;
}

abstract class _$InlineQueryResultCachedStickerSerializerMixin {
  InlineQueryResultType get type;
  String get id;
  String get stickerFileId;
  InlineKeyboardMarkup get replyMarkup;
  InputMessageContent get inputMessageContent;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'type': type?.toString()?.split('.')?.last,
      'id': id,
      'sticker_file_id': stickerFileId,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('reply_markup', replyMarkup);
    writeNotNull('input_message_content', inputMessageContent);
    return val;
  }
}

InlineQueryResultCachedDocument _$InlineQueryResultCachedDocumentFromJson(
    Map<String, dynamic> json) {
  return new InlineQueryResultCachedDocument(
      json['document_file_id'] as String, json['title'] as String,
      description: json['description'] as String,
      caption: json['caption'] as String,
      parseMode: $enumDecodeNullable(
          'ParseMode', ParseMode.values, json['parse_mode'] as String),
      replyMarkup: json['reply_markup'] == null
          ? null
          : new InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      inputMessageContent: json['input_message_content'] == null
          ? null
          : new InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>))
    ..type = $enumDecodeNullable('InlineQueryResultType',
        InlineQueryResultType.values, json['type'] as String)
    ..id = json['id'] as String;
}

abstract class _$InlineQueryResultCachedDocumentSerializerMixin {
  InlineQueryResultType get type;
  String get id;
  String get documentFileId;
  String get title;
  String get description;
  String get caption;
  ParseMode get parseMode;
  InlineKeyboardMarkup get replyMarkup;
  InputMessageContent get inputMessageContent;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'type': type?.toString()?.split('.')?.last,
      'id': id,
      'document_file_id': documentFileId,
      'title': title,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('description', description);
    writeNotNull('caption', caption);
    writeNotNull('parse_mode', parseMode?.toString()?.split('.')?.last);
    writeNotNull('reply_markup', replyMarkup);
    writeNotNull('input_message_content', inputMessageContent);
    return val;
  }
}

InlineQueryResultCachedVideo _$InlineQueryResultCachedVideoFromJson(
    Map<String, dynamic> json) {
  return new InlineQueryResultCachedVideo(
      json['video_file_id'] as String, json['title'] as String,
      description: json['description'] as String,
      caption: json['caption'] as String,
      parseMode: $enumDecodeNullable(
          'ParseMode', ParseMode.values, json['parse_mode'] as String),
      replyMarkup: json['reply_markup'] == null
          ? null
          : new InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      inputMessageContent: json['input_message_content'] == null
          ? null
          : new InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>))
    ..type = $enumDecodeNullable('InlineQueryResultType',
        InlineQueryResultType.values, json['type'] as String)
    ..id = json['id'] as String;
}

abstract class _$InlineQueryResultCachedVideoSerializerMixin {
  InlineQueryResultType get type;
  String get id;
  String get videoFileId;
  String get title;
  String get description;
  String get caption;
  ParseMode get parseMode;
  InlineKeyboardMarkup get replyMarkup;
  InputMessageContent get inputMessageContent;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'type': type?.toString()?.split('.')?.last,
      'id': id,
      'video_file_id': videoFileId,
      'title': title,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('description', description);
    writeNotNull('caption', caption);
    writeNotNull('parse_mode', parseMode?.toString()?.split('.')?.last);
    writeNotNull('reply_markup', replyMarkup);
    writeNotNull('input_message_content', inputMessageContent);
    return val;
  }
}

InlineQueryResultCachedVoice _$InlineQueryResultCachedVoiceFromJson(
    Map<String, dynamic> json) {
  return new InlineQueryResultCachedVoice(
      json['voice_file_id'] as String, json['title'] as String,
      caption: json['caption'] as String,
      parseMode: $enumDecodeNullable(
          'ParseMode', ParseMode.values, json['parse_mode'] as String),
      replyMarkup: json['reply_markup'] == null
          ? null
          : new InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      inputMessageContent: json['input_message_content'] == null
          ? null
          : new InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>))
    ..type = $enumDecodeNullable('InlineQueryResultType',
        InlineQueryResultType.values, json['type'] as String)
    ..id = json['id'] as String;
}

abstract class _$InlineQueryResultCachedVoiceSerializerMixin {
  InlineQueryResultType get type;
  String get id;
  String get voiceFileId;
  String get title;
  String get caption;
  ParseMode get parseMode;
  InlineKeyboardMarkup get replyMarkup;
  InputMessageContent get inputMessageContent;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'type': type?.toString()?.split('.')?.last,
      'id': id,
      'voice_file_id': voiceFileId,
      'title': title,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('caption', caption);
    writeNotNull('parse_mode', parseMode?.toString()?.split('.')?.last);
    writeNotNull('reply_markup', replyMarkup);
    writeNotNull('input_message_content', inputMessageContent);
    return val;
  }
}

InlineQueryResultCachedAudio _$InlineQueryResultCachedAudioFromJson(
    Map<String, dynamic> json) {
  return new InlineQueryResultCachedAudio(json['audio_file_id'] as String,
      caption: json['caption'] as String,
      parseMode: $enumDecodeNullable(
          'ParseMode', ParseMode.values, json['parse_mode'] as String),
      replyMarkup: json['reply_markup'] == null
          ? null
          : new InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      inputMessageContent: json['input_message_content'] == null
          ? null
          : new InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>))
    ..type = $enumDecodeNullable('InlineQueryResultType',
        InlineQueryResultType.values, json['type'] as String)
    ..id = json['id'] as String;
}

abstract class _$InlineQueryResultCachedAudioSerializerMixin {
  InlineQueryResultType get type;
  String get id;
  String get audioFileId;
  String get caption;
  ParseMode get parseMode;
  InlineKeyboardMarkup get replyMarkup;
  InputMessageContent get inputMessageContent;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'type': type?.toString()?.split('.')?.last,
      'id': id,
      'audio_file_id': audioFileId,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('caption', caption);
    writeNotNull('parse_mode', parseMode?.toString()?.split('.')?.last);
    writeNotNull('reply_markup', replyMarkup);
    writeNotNull('input_message_content', inputMessageContent);
    return val;
  }
}

InputMessageContent _$InputMessageContentFromJson(Map<String, dynamic> json) {
  return new InputMessageContent();
}

abstract class _$InputMessageContentSerializerMixin {
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

InputTextMessageContent _$InputTextMessageContentFromJson(
    Map<String, dynamic> json) {
  return new InputTextMessageContent(json['message_text'] as String,
      parseMode: $enumDecodeNullable(
          'ParseMode', ParseMode.values, json['parse_mode'] as String),
      disableWebPagePreview: json['disable_web_page_preview'] as bool);
}

abstract class _$InputTextMessageContentSerializerMixin {
  String get messageText;
  ParseMode get parseMode;
  bool get disableWebPagePreview;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'message_text': messageText,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('parse_mode', parseMode?.toString()?.split('.')?.last);
    writeNotNull('disable_web_page_preview', disableWebPagePreview);
    return val;
  }
}

InputLocationMessageContent _$InputLocationMessageContentFromJson(
    Map<String, dynamic> json) {
  return new InputLocationMessageContent((json['latitude'] as num)?.toDouble(),
      (json['longitude'] as num)?.toDouble());
}

abstract class _$InputLocationMessageContentSerializerMixin {
  double get latitude;
  double get longitude;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'latitude': latitude, 'longitude': longitude};
}

InputVenueMessageContent _$InputVenueMessageContentFromJson(
    Map<String, dynamic> json) {
  return new InputVenueMessageContent(
      (json['latitude'] as num)?.toDouble(),
      (json['longitude'] as num)?.toDouble(),
      json['title'] as String,
      json['address'] as String,
      foursquareId: json['foursquare_id'] as String);
}

abstract class _$InputVenueMessageContentSerializerMixin {
  double get latitude;
  double get longitude;
  String get title;
  String get address;
  String get foursquareId;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'latitude': latitude,
      'longitude': longitude,
      'title': title,
      'address': address,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('foursquare_id', foursquareId);
    return val;
  }
}

InputContactMessageContent _$InputContactMessageContentFromJson(
    Map<String, dynamic> json) {
  return new InputContactMessageContent(
      json['phone_number'] as String, json['first_name'] as String,
      lastName: json['last_name'] as String);
}

abstract class _$InputContactMessageContentSerializerMixin {
  String get phoneNumber;
  String get firstName;
  String get lastName;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'phone_number': phoneNumber,
      'first_name': firstName,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('last_name', lastName);
    return val;
  }
}

CallbackGame _$CallbackGameFromJson(Map<String, dynamic> json) {
  return new CallbackGame();
}

abstract class _$CallbackGameSerializerMixin {
  Map<String, dynamic> toJson() => <String, dynamic>{};
}

Game _$GameFromJson(Map<String, dynamic> json) {
  return new Game(
      json['title'] as String,
      json['description'] as String,
      (json['photo'] as List)
          ?.map((e) => e == null
              ? null
              : new PhotoSize.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      text: json['text'] as String,
      textEntities: (json['text_entities'] as List)
          ?.map((e) => e == null
              ? null
              : new MessageEntity.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      animation: json['animation'] == null
          ? null
          : new Animation.fromJson(json['animation'] as Map<String, dynamic>));
}

abstract class _$GameSerializerMixin {
  String get title;
  String get description;
  List<PhotoSize> get photo;
  String get text;
  List<MessageEntity> get textEntities;
  Animation get animation;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'title': title,
      'description': description,
      'photo': photo,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('text', text);
    writeNotNull('text_entities', textEntities);
    writeNotNull('animation', animation);
    return val;
  }
}

Animation _$AnimationFromJson(Map<String, dynamic> json) {
  return new Animation(json['file_id'] as String,
      thumb: json['thumb'] == null
          ? null
          : new PhotoSize.fromJson(json['thumb'] as Map<String, dynamic>),
      fileName: json['file_name'] as String,
      mimeType: json['mime_type'] as String,
      fileSize: json['file_size'] as int);
}

abstract class _$AnimationSerializerMixin {
  String get fileId;
  PhotoSize get thumb;
  String get fileName;
  String get mimeType;
  int get fileSize;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'file_id': fileId,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('thumb', thumb);
    writeNotNull('file_name', fileName);
    writeNotNull('mime_type', mimeType);
    writeNotNull('file_size', fileSize);
    return val;
  }
}

GameHighScore _$GameHighScoreFromJson(Map<String, dynamic> json) {
  return new GameHighScore(
      json['position'] as int,
      json['user'] == null
          ? null
          : new User.fromJson(json['user'] as Map<String, dynamic>),
      json['score'] as int);
}

abstract class _$GameHighScoreSerializerMixin {
  int get position;
  User get user;
  int get score;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'position': position, 'user': user, 'score': score};
}

Invoice _$InvoiceFromJson(Map<String, dynamic> json) {
  return new Invoice(
      json['title'] as String,
      json['description'] as String,
      json['start_parameter'] as String,
      json['currency'] as String,
      json['total_amount'] as int);
}

abstract class _$InvoiceSerializerMixin {
  String get title;
  String get description;
  String get startParameter;
  String get currency;
  int get totalAmount;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'title': title,
        'description': description,
        'start_parameter': startParameter,
        'currency': currency,
        'total_amount': totalAmount
      };
}

SuccessfulPayment _$SuccessfulPaymentFromJson(Map<String, dynamic> json) {
  return new SuccessfulPayment(
      json['currency'] as String,
      json['total_amount'] as int,
      json['invoice_payload'] as String,
      json['telegram_payment_charge_id'] as String,
      json['provider_payment_charge_id'] as String,
      shippingOptionId: json['shipping_option_id'] as String,
      orderInfo: json['order_info'] == null
          ? null
          : new OrderInfo.fromJson(json['order_info'] as Map<String, dynamic>));
}

abstract class _$SuccessfulPaymentSerializerMixin {
  String get currency;
  int get totalAmount;
  String get invoicePayload;
  String get shippingOptionId;
  OrderInfo get orderInfo;
  String get telegramPaymentChargeId;
  String get providerPaymentChargeId;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'currency': currency,
      'total_amount': totalAmount,
      'invoice_payload': invoicePayload,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('shipping_option_id', shippingOptionId);
    writeNotNull('order_info', orderInfo);
    val['telegram_payment_charge_id'] = telegramPaymentChargeId;
    val['provider_payment_charge_id'] = providerPaymentChargeId;
    return val;
  }
}

OrderInfo _$OrderInfoFromJson(Map<String, dynamic> json) {
  return new OrderInfo(
      name: json['name'] as String,
      phoneNumber: json['phone_number'] as String,
      email: json['email'] as String,
      shippingAddress: json['shipping_address'] == null
          ? null
          : new ShippingAddress.fromJson(
              json['shipping_address'] as Map<String, dynamic>));
}

abstract class _$OrderInfoSerializerMixin {
  String get name;
  String get phoneNumber;
  String get email;
  ShippingAddress get shippingAddress;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{};

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('name', name);
    writeNotNull('phone_number', phoneNumber);
    writeNotNull('email', email);
    writeNotNull('shipping_address', shippingAddress);
    return val;
  }
}

ShippingOption _$ShippingOptionFromJson(Map<String, dynamic> json) {
  return new ShippingOption(
      json['id'] as String,
      json['title'] as String,
      (json['prices'] as List)
          ?.map((e) => e == null
              ? null
              : new LabeledPrice.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

abstract class _$ShippingOptionSerializerMixin {
  String get id;
  String get title;
  List<LabeledPrice> get prices;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'id': id, 'title': title, 'prices': prices};
}

LabeledPrice _$LabeledPriceFromJson(Map<String, dynamic> json) {
  return new LabeledPrice(json['label'] as String, json['amount'] as int);
}

abstract class _$LabeledPriceSerializerMixin {
  String get label;
  int get amount;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'label': label, 'amount': amount};
}

ShippingAddress _$ShippingAddressFromJson(Map<String, dynamic> json) {
  return new ShippingAddress(
      json['country_code'] as String,
      json['state'] as String,
      json['city'] as String,
      json['street_line1'] as String,
      json['street_line2'] as String,
      json['post_code'] as String);
}

abstract class _$ShippingAddressSerializerMixin {
  String get countryCode;
  String get state;
  String get city;
  String get streetLine1;
  String get streetLine2;
  String get postCode;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'country_code': countryCode,
        'state': state,
        'city': city,
        'street_line1': streetLine1,
        'street_line2': streetLine2,
        'post_code': postCode
      };
}
