// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

APIResponseParameters _$APIResponseParametersFromJson(
    Map<String, dynamic> json) {
  return APIResponseParameters(
      migrateToChatId: json['migrate_to_chat_id'] as int,
      retryAfter: json['retry_after'] as int);
}

Map<String, dynamic> _$APIResponseParametersToJson(
    APIResponseParameters instance) {
  var val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('migrate_to_chat_id', instance.migrateToChatId);
  writeNotNull('retry_after', instance.retryAfter);
  return val;
}

APIResponseBase _$APIResponseBaseFromJson(Map<String, dynamic> json) {
  return APIResponseBase(json['ok'] as bool,
      description: json['description'] as String,
      parameters: json['parameters'] == null
          ? null
          : APIResponseParameters.fromJson(
              json['parameters'] as Map<String, dynamic>))
    ..errorCode = json['error_code'] as int;
}

Map<String, dynamic> _$APIResponseBaseToJson(APIResponseBase instance) {
  var val = <String, dynamic>{
    'ok': instance.ok,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('error_code', instance.errorCode);
  writeNotNull('description', instance.description);
  writeNotNull('parameters', instance.parameters);
  return val;
}

APIResponseWebhookInfo _$APIResponseWebhookInfoFromJson(
    Map<String, dynamic> json) {
  return APIResponseWebhookInfo(json['ok'] as bool,
      description: json['description'] as String,
      parameters: json['parameters'] == null
          ? null
          : APIResponseParameters.fromJson(
              json['parameters'] as Map<String, dynamic>),
      result: json['result'] == null
          ? null
          : WebhookInfo.fromJson(json['result'] as Map<String, dynamic>))
    ..errorCode = json['error_code'] as int;
}

Map<String, dynamic> _$APIResponseWebhookInfoToJson(
    APIResponseWebhookInfo instance) {
  var val = <String, dynamic>{
    'ok': instance.ok,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('error_code', instance.errorCode);
  writeNotNull('description', instance.description);
  writeNotNull('parameters', instance.parameters);
  writeNotNull('result', instance.result);
  return val;
}

APIResponseUser _$APIResponseUserFromJson(Map<String, dynamic> json) {
  return APIResponseUser(json['ok'] as bool,
      description: json['description'] as String,
      parameters: json['parameters'] == null
          ? null
          : APIResponseParameters.fromJson(
              json['parameters'] as Map<String, dynamic>),
      result: json['result'] == null
          ? null
          : User.fromJson(json['result'] as Map<String, dynamic>))
    ..errorCode = json['error_code'] as int;
}

Map<String, dynamic> _$APIResponseUserToJson(APIResponseUser instance) {
  var val = <String, dynamic>{
    'ok': instance.ok,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('error_code', instance.errorCode);
  writeNotNull('description', instance.description);
  writeNotNull('parameters', instance.parameters);
  writeNotNull('result', instance.result);
  return val;
}

APIResponseMessage _$APIResponseMessageFromJson(Map<String, dynamic> json) {
  return APIResponseMessage(json['ok'] as bool,
      description: json['description'] as String,
      parameters: json['parameters'] == null
          ? null
          : APIResponseParameters.fromJson(
              json['parameters'] as Map<String, dynamic>),
      result: json['result'] == null
          ? null
          : Message.fromJson(json['result'] as Map<String, dynamic>))
    ..errorCode = json['error_code'] as int;
}

Map<String, dynamic> _$APIResponseMessageToJson(APIResponseMessage instance) {
  var val = <String, dynamic>{
    'ok': instance.ok,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('error_code', instance.errorCode);
  writeNotNull('description', instance.description);
  writeNotNull('parameters', instance.parameters);
  writeNotNull('result', instance.result);
  return val;
}

APIResponseMessages _$APIResponseMessagesFromJson(Map<String, dynamic> json) {
  return APIResponseMessages(json['ok'] as bool,
      description: json['description'] as String,
      parameters: json['parameters'] == null
          ? null
          : APIResponseParameters.fromJson(
              json['parameters'] as Map<String, dynamic>),
      result: (json['result'] as List)
          ?.map((e) =>
              e == null ? null : Message.fromJson(e as Map<String, dynamic>))
          ?.toList())
    ..errorCode = json['error_code'] as int;
}

Map<String, dynamic> _$APIResponseMessagesToJson(APIResponseMessages instance) {
  var val = <String, dynamic>{
    'ok': instance.ok,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('error_code', instance.errorCode);
  writeNotNull('description', instance.description);
  writeNotNull('parameters', instance.parameters);
  writeNotNull('result', instance.result);
  return val;
}

APIResponseUserProfilePhotos _$APIResponseUserProfilePhotosFromJson(
    Map<String, dynamic> json) {
  return APIResponseUserProfilePhotos(json['ok'] as bool,
      description: json['description'] as String,
      parameters: json['parameters'] == null
          ? null
          : APIResponseParameters.fromJson(
              json['parameters'] as Map<String, dynamic>),
      result: json['result'] == null
          ? null
          : UserProfilePhotos.fromJson(json['result'] as Map<String, dynamic>))
    ..errorCode = json['error_code'] as int;
}

Map<String, dynamic> _$APIResponseUserProfilePhotosToJson(
    APIResponseUserProfilePhotos instance) {
  var val = <String, dynamic>{
    'ok': instance.ok,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('error_code', instance.errorCode);
  writeNotNull('description', instance.description);
  writeNotNull('parameters', instance.parameters);
  writeNotNull('result', instance.result);
  return val;
}

APIResponseFile _$APIResponseFileFromJson(Map<String, dynamic> json) {
  return APIResponseFile(json['ok'] as bool,
      description: json['description'] as String,
      parameters: json['parameters'] == null
          ? null
          : APIResponseParameters.fromJson(
              json['parameters'] as Map<String, dynamic>),
      result: json['result'] == null
          ? null
          : FileObject.fromJson(json['result'] as Map<String, dynamic>))
    ..errorCode = json['error_code'] as int;
}

Map<String, dynamic> _$APIResponseFileToJson(APIResponseFile instance) {
  var val = <String, dynamic>{
    'ok': instance.ok,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('error_code', instance.errorCode);
  writeNotNull('description', instance.description);
  writeNotNull('parameters', instance.parameters);
  writeNotNull('result', instance.result);
  return val;
}

APIResponseUpdates _$APIResponseUpdatesFromJson(Map<String, dynamic> json) {
  return APIResponseUpdates(json['ok'] as bool,
      description: json['description'] as String,
      parameters: json['parameters'] == null
          ? null
          : APIResponseParameters.fromJson(
              json['parameters'] as Map<String, dynamic>),
      result: (json['result'] as List)
          ?.map((e) =>
              e == null ? null : Update.fromJson(e as Map<String, dynamic>))
          ?.toList())
    ..errorCode = json['error_code'] as int;
}

Map<String, dynamic> _$APIResponseUpdatesToJson(APIResponseUpdates instance) {
  var val = <String, dynamic>{
    'ok': instance.ok,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('error_code', instance.errorCode);
  writeNotNull('description', instance.description);
  writeNotNull('parameters', instance.parameters);
  val['result'] = instance.result;
  return val;
}

APIResponseChat _$APIResponseChatFromJson(Map<String, dynamic> json) {
  return APIResponseChat(json['ok'] as bool,
      description: json['description'] as String,
      parameters: json['parameters'] == null
          ? null
          : APIResponseParameters.fromJson(
              json['parameters'] as Map<String, dynamic>),
      result: json['result'] == null
          ? null
          : Chat.fromJson(json['result'] as Map<String, dynamic>))
    ..errorCode = json['error_code'] as int;
}

Map<String, dynamic> _$APIResponseChatToJson(APIResponseChat instance) {
  var val = <String, dynamic>{
    'ok': instance.ok,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('error_code', instance.errorCode);
  writeNotNull('description', instance.description);
  writeNotNull('parameters', instance.parameters);
  writeNotNull('result', instance.result);
  return val;
}

APIResponseChatAdministrators _$APIResponseChatAdministratorsFromJson(
    Map<String, dynamic> json) {
  return APIResponseChatAdministrators(json['ok'] as bool,
      description: json['description'] as String,
      parameters: json['parameters'] == null
          ? null
          : APIResponseParameters.fromJson(
              json['parameters'] as Map<String, dynamic>),
      result: (json['result'] as List)
          ?.map((e) =>
              e == null ? null : ChatMember.fromJson(e as Map<String, dynamic>))
          ?.toList())
    ..errorCode = json['error_code'] as int;
}

Map<String, dynamic> _$APIResponseChatAdministratorsToJson(
    APIResponseChatAdministrators instance) {
  var val = <String, dynamic>{
    'ok': instance.ok,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('error_code', instance.errorCode);
  writeNotNull('description', instance.description);
  writeNotNull('parameters', instance.parameters);
  writeNotNull('result', instance.result);
  return val;
}

APIResponseChatMember _$APIResponseChatMemberFromJson(
    Map<String, dynamic> json) {
  return APIResponseChatMember(json['ok'] as bool,
      description: json['description'] as String,
      parameters: json['parameters'] == null
          ? null
          : APIResponseParameters.fromJson(
              json['parameters'] as Map<String, dynamic>),
      result: json['result'] == null
          ? null
          : ChatMember.fromJson(json['result'] as Map<String, dynamic>))
    ..errorCode = json['error_code'] as int;
}

Map<String, dynamic> _$APIResponseChatMemberToJson(
    APIResponseChatMember instance) {
  var val = <String, dynamic>{
    'ok': instance.ok,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('error_code', instance.errorCode);
  writeNotNull('description', instance.description);
  writeNotNull('parameters', instance.parameters);
  writeNotNull('result', instance.result);
  return val;
}

APIResponseInt _$APIResponseIntFromJson(Map<String, dynamic> json) {
  return APIResponseInt(json['ok'] as bool,
      description: json['description'] as String,
      parameters: json['parameters'] == null
          ? null
          : APIResponseParameters.fromJson(
              json['parameters'] as Map<String, dynamic>),
      result: json['result'] as int)
    ..errorCode = json['error_code'] as int;
}

Map<String, dynamic> _$APIResponseIntToJson(APIResponseInt instance) {
  var val = <String, dynamic>{
    'ok': instance.ok,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('error_code', instance.errorCode);
  writeNotNull('description', instance.description);
  writeNotNull('parameters', instance.parameters);
  writeNotNull('result', instance.result);
  return val;
}

APIResponseBool _$APIResponseBoolFromJson(Map<String, dynamic> json) {
  return APIResponseBool(json['ok'] as bool,
      description: json['description'] as String,
      parameters: json['parameters'] == null
          ? null
          : APIResponseParameters.fromJson(
              json['parameters'] as Map<String, dynamic>),
      result: json['result'] as bool)
    ..errorCode = json['error_code'] as int;
}

Map<String, dynamic> _$APIResponseBoolToJson(APIResponseBool instance) {
  var val = <String, dynamic>{
    'ok': instance.ok,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('error_code', instance.errorCode);
  writeNotNull('description', instance.description);
  writeNotNull('parameters', instance.parameters);
  writeNotNull('result', instance.result);
  return val;
}

APIResponseString _$APIResponseStringFromJson(Map<String, dynamic> json) {
  return APIResponseString(json['ok'] as bool,
      description: json['description'] as String,
      parameters: json['parameters'] == null
          ? null
          : APIResponseParameters.fromJson(
              json['parameters'] as Map<String, dynamic>),
      result: json['result'] as String)
    ..errorCode = json['error_code'] as int;
}

Map<String, dynamic> _$APIResponseStringToJson(APIResponseString instance) {
  var val = <String, dynamic>{
    'ok': instance.ok,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('error_code', instance.errorCode);
  writeNotNull('description', instance.description);
  writeNotNull('parameters', instance.parameters);
  writeNotNull('result', instance.result);
  return val;
}

APIResponseGameHighScores _$APIResponseGameHighScoresFromJson(
    Map<String, dynamic> json) {
  return APIResponseGameHighScores(json['ok'] as bool,
      description: json['description'] as String,
      parameters: json['parameters'] == null
          ? null
          : APIResponseParameters.fromJson(
              json['parameters'] as Map<String, dynamic>),
      result: (json['result'] as List)
          ?.map((e) => e == null
              ? null
              : GameHighScore.fromJson(e as Map<String, dynamic>))
          ?.toList())
    ..errorCode = json['error_code'] as int;
}

Map<String, dynamic> _$APIResponseGameHighScoresToJson(
    APIResponseGameHighScores instance) {
  var val = <String, dynamic>{
    'ok': instance.ok,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('error_code', instance.errorCode);
  writeNotNull('description', instance.description);
  writeNotNull('parameters', instance.parameters);
  writeNotNull('result', instance.result);
  return val;
}

APIResponseStickerSet _$APIResponseStickerSetFromJson(
    Map<String, dynamic> json) {
  return APIResponseStickerSet(json['ok'] as bool,
      description: json['description'] as String,
      parameters: json['parameters'] == null
          ? null
          : APIResponseParameters.fromJson(
              json['parameters'] as Map<String, dynamic>),
      result: json['result'] == null
          ? null
          : StickerSet.fromJson(json['result'] as Map<String, dynamic>))
    ..errorCode = json['error_code'] as int;
}

Map<String, dynamic> _$APIResponseStickerSetToJson(
    APIResponseStickerSet instance) {
  var val = <String, dynamic>{
    'ok': instance.ok,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('error_code', instance.errorCode);
  writeNotNull('description', instance.description);
  writeNotNull('parameters', instance.parameters);
  writeNotNull('result', instance.result);
  return val;
}

WebhookInfo _$WebhookInfoFromJson(Map<String, dynamic> json) {
  return WebhookInfo(
      json['url'] as String,
      json['has_custom_certificate'] as bool,
      json['pending_update_count'] as int,
      lastErrorDate: json['last_error_date'] as int,
      lastErrorMessage: json['last_error_message'] as String,
      maxConnections: json['max_connections'] as int,
      allowedUpdates: (json['allowed_updates'] as List)
          ?.map((e) => _$enumDecodeNullable(_$UpdateTypeEnumMap, e))
          ?.toList());
}

Map<String, dynamic> _$WebhookInfoToJson(WebhookInfo instance) {
  var val = <String, dynamic>{
    'url': instance.url,
    'has_custom_certificate': instance.hasCustomCertificate,
    'pending_update_count': instance.pendingUpdateCount,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('last_error_date', instance.lastErrorDate);
  writeNotNull('last_error_message', instance.lastErrorMessage);
  writeNotNull('max_connections', instance.maxConnections);
  writeNotNull('allowed_updates',
      instance.allowedUpdates?.map((e) => _$UpdateTypeEnumMap[e])?.toList());
  return val;
}

T _$enumDecode<T>(Map<T, dynamic> enumValues, dynamic source) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }
  return enumValues.entries
      .singleWhere((e) => e.value == source,
          orElse: () => throw ArgumentError(
              '`$source` is not one of the supported values: '
              '${enumValues.values.join(', ')}'))
      .key;
}

T _$enumDecodeNullable<T>(Map<T, dynamic> enumValues, dynamic source) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source);
}

const _$UpdateTypeEnumMap = <UpdateType, dynamic>{
  UpdateType.Message: 'message',
  UpdateType.EditedMessage: 'edited_message',
  UpdateType.ChannelPost: 'channel_post',
  UpdateType.EditedChannelPost: 'edited_channel_post',
  UpdateType.InlineQuery: 'inline_query',
  UpdateType.ChosenInlineResult: 'chosen_inline_result',
  UpdateType.CallbackQuery: 'callback_query'
};

Update _$UpdateFromJson(Map<String, dynamic> json) {
  return Update(json['update_id'] as int,
      message: json['message'] == null
          ? null
          : Message.fromJson(json['message'] as Map<String, dynamic>),
      editedMessage: json['edited_message'] == null
          ? null
          : Message.fromJson(json['edited_message'] as Map<String, dynamic>),
      channelPost: json['channel_post'] == null
          ? null
          : Message.fromJson(json['channel_post'] as Map<String, dynamic>),
      editedChannelPost: json['edited_channel_post'] == null
          ? null
          : Message.fromJson(
              json['edited_channel_post'] as Map<String, dynamic>),
      inlineQuery: json['inline_query'] == null
          ? null
          : InlineQuery.fromJson(json['inline_query'] as Map<String, dynamic>),
      chosenInlineResult: json['chosen_inline_result'] == null
          ? null
          : ChosenInlineResult.fromJson(
              json['chosen_inline_result'] as Map<String, dynamic>),
      callbackQuery: json['callback_query'] == null
          ? null
          : CallbackQuery.fromJson(
              json['callback_query'] as Map<String, dynamic>),
      shippingQuery: json['shipping_query'] == null
          ? null
          : ShippingQuery.fromJson(
              json['shipping_query'] as Map<String, dynamic>),
      preCheckoutQuery: json['pre_checkout_query'] == null
          ? null
          : PreCheckoutQuery.fromJson(
              json['pre_checkout_query'] as Map<String, dynamic>));
}

Map<String, dynamic> _$UpdateToJson(Update instance) {
  var val = <String, dynamic>{
    'update_id': instance.updateId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('message', instance.message);
  writeNotNull('edited_message', instance.editedMessage);
  writeNotNull('channel_post', instance.channelPost);
  writeNotNull('edited_channel_post', instance.editedChannelPost);
  writeNotNull('inline_query', instance.inlineQuery);
  writeNotNull('chosen_inline_result', instance.chosenInlineResult);
  writeNotNull('callback_query', instance.callbackQuery);
  writeNotNull('shipping_query', instance.shippingQuery);
  writeNotNull('pre_checkout_query', instance.preCheckoutQuery);
  return val;
}

User _$UserFromJson(Map<String, dynamic> json) {
  return User(json['id'] as int, json['is_bot'] as bool,
      lastName: json['last_name'] as String,
      username: json['username'] as String,
      languageCode: json['language_code'] as String)
    ..firstName = json['first_name'] as String;
}

Map<String, dynamic> _$UserToJson(User instance) {
  var val = <String, dynamic>{
    'id': instance.id,
    'is_bot': instance.isBot,
    'first_name': instance.firstName,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('last_name', instance.lastName);
  writeNotNull('username', instance.username);
  writeNotNull('language_code', instance.languageCode);
  return val;
}

Chat _$ChatFromJson(Map<String, dynamic> json) {
  return Chat(
      json['id'] as int, _$enumDecodeNullable(_$ChatTypeEnumMap, json['type']),
      title: json['title'] as String,
      username: json['username'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      allMembersAreAdministrators:
          json['all_members_are_administrators'] as bool,
      photo: json['photo'] == null
          ? null
          : ChatPhoto.fromJson(json['photo'] as Map<String, dynamic>),
      description: json['description'] as String,
      inviteLink: json['invite_link'] as String,
      pinnedMessage: json['pinned_message'] == null
          ? null
          : Message.fromJson(json['pinned_message'] as Map<String, dynamic>),
      stickerSetName: json['sticker_set_name'] as String,
      canSetStickerSet: json['can_set_sticker_set'] as bool);
}

Map<String, dynamic> _$ChatToJson(Chat instance) {
  var val = <String, dynamic>{
    'id': instance.id,
    'type': _$ChatTypeEnumMap[instance.type],
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('title', instance.title);
  writeNotNull('username', instance.username);
  writeNotNull('first_name', instance.firstName);
  writeNotNull('last_name', instance.lastName);
  writeNotNull(
      'all_members_are_administrators', instance.allMembersAreAdministrators);
  writeNotNull('photo', instance.photo);
  writeNotNull('description', instance.description);
  writeNotNull('invite_link', instance.inviteLink);
  writeNotNull('pinned_message', instance.pinnedMessage);
  writeNotNull('sticker_set_name', instance.stickerSetName);
  writeNotNull('can_set_sticker_set', instance.canSetStickerSet);
  return val;
}

const _$ChatTypeEnumMap = <ChatType, dynamic>{
  ChatType.Private: 'private',
  ChatType.Group: 'group',
  ChatType.Channel: 'channel'
};

InputMedia _$InputMediaFromJson(Map<String, dynamic> json) {
  return InputMedia(_$enumDecodeNullable(_$InputMediaTypeEnumMap, json['type']),
      json['media'] as String);
}

Map<String, dynamic> _$InputMediaToJson(InputMedia instance) =>
    <String, dynamic>{
      'type': _$InputMediaTypeEnumMap[instance.type],
      'media': instance.media
    };

const _$InputMediaTypeEnumMap = <InputMediaType, dynamic>{
  InputMediaType.Animation: 'animation',
  InputMediaType.Document: 'document',
  InputMediaType.Audio: 'audio',
  InputMediaType.Photo: 'photo',
  InputMediaType.Video: 'video'
};

InputMediaAnimation _$InputMediaAnimationFromJson(Map<String, dynamic> json) {
  return InputMediaAnimation(json['media'] as String,
      caption: json['caption'] as String,
      parseMode: _$enumDecodeNullable(_$ParseModeEnumMap, json['parse_mode']))
    ..type = _$enumDecodeNullable(_$InputMediaTypeEnumMap, json['type']);
}

Map<String, dynamic> _$InputMediaAnimationToJson(InputMediaAnimation instance) {
  var val = <String, dynamic>{
    'type': _$InputMediaTypeEnumMap[instance.type],
    'media': instance.media,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('caption', instance.caption);
  writeNotNull('parse_mode', _$ParseModeEnumMap[instance.parseMode]);
  return val;
}

const _$ParseModeEnumMap = <ParseMode, dynamic>{
  ParseMode.Markdown: 'Markdown',
  ParseMode.Html: 'HTML'
};

InputMediaDocument _$InputMediaDocumentFromJson(Map<String, dynamic> json) {
  return InputMediaDocument(json['media'] as String,
      thumb: json['thumb'] == null
          ? null
          : InputFile.fromJson(json['thumb'] as Map<String, dynamic>),
      caption: json['caption'] as String,
      parseMode: _$enumDecodeNullable(_$ParseModeEnumMap, json['parse_mode']))
    ..type = _$enumDecodeNullable(_$InputMediaTypeEnumMap, json['type']);
}

Map<String, dynamic> _$InputMediaDocumentToJson(InputMediaDocument instance) {
  var val = <String, dynamic>{
    'type': _$InputMediaTypeEnumMap[instance.type],
    'media': instance.media,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('thumb', instance.thumb);
  writeNotNull('caption', instance.caption);
  writeNotNull('parse_mode', _$ParseModeEnumMap[instance.parseMode]);
  return val;
}

InputMediaAudio _$InputMediaAudioFromJson(Map<String, dynamic> json) {
  return InputMediaAudio(json['media'] as String,
      thumb: json['thumb'] == null
          ? null
          : InputFile.fromJson(json['thumb'] as Map<String, dynamic>),
      caption: json['caption'] as String,
      parseMode: _$enumDecodeNullable(_$ParseModeEnumMap, json['parse_mode']),
      duration: json['duration'] as int,
      performer: json['performer'] as String,
      title: json['title'] as String)
    ..type = _$enumDecodeNullable(_$InputMediaTypeEnumMap, json['type']);
}

Map<String, dynamic> _$InputMediaAudioToJson(InputMediaAudio instance) {
  var val = <String, dynamic>{
    'type': _$InputMediaTypeEnumMap[instance.type],
    'media': instance.media,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('thumb', instance.thumb);
  writeNotNull('caption', instance.caption);
  writeNotNull('parse_mode', _$ParseModeEnumMap[instance.parseMode]);
  writeNotNull('duration', instance.duration);
  writeNotNull('performer', instance.performer);
  writeNotNull('title', instance.title);
  return val;
}

InputMediaPhoto _$InputMediaPhotoFromJson(Map<String, dynamic> json) {
  return InputMediaPhoto(json['media'] as String,
      caption: json['caption'] as String,
      parseMode: _$enumDecodeNullable(_$ParseModeEnumMap, json['parse_mode']))
    ..type = _$enumDecodeNullable(_$InputMediaTypeEnumMap, json['type']);
}

Map<String, dynamic> _$InputMediaPhotoToJson(InputMediaPhoto instance) {
  var val = <String, dynamic>{
    'type': _$InputMediaTypeEnumMap[instance.type],
    'media': instance.media,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('caption', instance.caption);
  writeNotNull('parse_mode', _$ParseModeEnumMap[instance.parseMode]);
  return val;
}

InputMediaVideo _$InputMediaVideoFromJson(Map<String, dynamic> json) {
  return InputMediaVideo(json['media'] as String,
      thumb: json['thumb'] == null
          ? null
          : InputFile.fromJson(json['thumb'] as Map<String, dynamic>),
      caption: json['caption'] as String,
      parseMode: _$enumDecodeNullable(_$ParseModeEnumMap, json['parse_mode']),
      width: json['width'] as int,
      height: json['height'] as int,
      duration: json['duration'] as int,
      supportsStreaming: json['supports_streaming'] as bool)
    ..type = _$enumDecodeNullable(_$InputMediaTypeEnumMap, json['type']);
}

Map<String, dynamic> _$InputMediaVideoToJson(InputMediaVideo instance) {
  var val = <String, dynamic>{
    'type': _$InputMediaTypeEnumMap[instance.type],
    'media': instance.media,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('thumb', instance.thumb);
  writeNotNull('caption', instance.caption);
  writeNotNull('parse_mode', _$ParseModeEnumMap[instance.parseMode]);
  writeNotNull('width', instance.width);
  writeNotNull('height', instance.height);
  writeNotNull('duration', instance.duration);
  writeNotNull('supports_streaming', instance.supportsStreaming);
  return val;
}

InputFile _$InputFileFromJson(Map<String, dynamic> json) {
  return InputFile(
      filepath: json['filepath'] as String,
      url: json['url'] as String,
      bytes: (json['bytes'] as List)?.map((e) => e as int)?.toList(),
      fileId: json['file_id'] as String);
}

Map<String, dynamic> _$InputFileToJson(InputFile instance) => <String, dynamic>{
      'filepath': instance.filepath,
      'url': instance.url,
      'bytes': instance.bytes,
      'file_id': instance.fileId
    };

Audio _$AudioFromJson(Map<String, dynamic> json) {
  return Audio(json['file_id'] as String, json['duration'] as int,
      performer: json['performer'] as String,
      title: json['title'] as String,
      mimeType: json['mime_type'] as String,
      fileSize: json['file_size'] as int,
      thumb: json['thumb'] == null
          ? null
          : PhotoSize.fromJson(json['thumb'] as Map<String, dynamic>));
}

Map<String, dynamic> _$AudioToJson(Audio instance) {
  var val = <String, dynamic>{
    'file_id': instance.fileId,
    'duration': instance.duration,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('performer', instance.performer);
  writeNotNull('title', instance.title);
  writeNotNull('mime_type', instance.mimeType);
  writeNotNull('file_size', instance.fileSize);
  writeNotNull('thumb', instance.thumb);
  return val;
}

MessageEntity _$MessageEntityFromJson(Map<String, dynamic> json) {
  return MessageEntity(
      _$enumDecodeNullable(_$MessageEntityTypeEnumMap, json['type']),
      json['offset'] as int,
      json['length'] as int,
      url: json['url'] as String,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>));
}

Map<String, dynamic> _$MessageEntityToJson(MessageEntity instance) {
  var val = <String, dynamic>{
    'type': _$MessageEntityTypeEnumMap[instance.type],
    'offset': instance.offset,
    'length': instance.length,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('url', instance.url);
  writeNotNull('user', instance.user);
  return val;
}

const _$MessageEntityTypeEnumMap = <MessageEntityType, dynamic>{
  MessageEntityType.Mention: 'mention',
  MessageEntityType.Hashtag: 'hashtag',
  MessageEntityType.Cashtag: 'cashtag',
  MessageEntityType.BotCommand: 'bot_command',
  MessageEntityType.Url: 'url',
  MessageEntityType.Email: 'email',
  MessageEntityType.PhoneNumber: 'phone_number',
  MessageEntityType.Bold: 'bold',
  MessageEntityType.Italic: 'italic',
  MessageEntityType.Code: 'code',
  MessageEntityType.Pre: 'pre',
  MessageEntityType.TextLink: 'text_link',
  MessageEntityType.TextMention: 'text_mention'
};

PhotoSize _$PhotoSizeFromJson(Map<String, dynamic> json) {
  return PhotoSize(
      json['file_id'] as String, json['width'] as int, json['height'] as int,
      fileSize: json['file_size'] as int);
}

Map<String, dynamic> _$PhotoSizeToJson(PhotoSize instance) {
  var val = <String, dynamic>{
    'file_id': instance.fileId,
    'width': instance.width,
    'height': instance.height,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('file_size', instance.fileSize);
  return val;
}

Document _$DocumentFromJson(Map<String, dynamic> json) {
  return Document(json['file_id'] as String,
      thumb: json['thumb'] == null
          ? null
          : PhotoSize.fromJson(json['thumb'] as Map<String, dynamic>),
      fileName: json['file_name'] as String,
      mimeType: json['mime_type'] as String,
      fileSize: json['file_size'] as int);
}

Map<String, dynamic> _$DocumentToJson(Document instance) {
  var val = <String, dynamic>{
    'file_id': instance.fileId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('thumb', instance.thumb);
  writeNotNull('file_name', instance.fileName);
  writeNotNull('mime_type', instance.mimeType);
  writeNotNull('file_size', instance.fileSize);
  return val;
}

Sticker _$StickerFromJson(Map<String, dynamic> json) {
  return Sticker(
      json['file_id'] as String, json['width'] as int, json['height'] as int,
      thumb: json['thumb'] == null
          ? null
          : PhotoSize.fromJson(json['thumb'] as Map<String, dynamic>),
      emoji: json['emoji'] as String,
      setName: json['set_name'] as String,
      maskPosition: json['mask_position'] == null
          ? null
          : MaskPosition.fromJson(
              json['mask_position'] as Map<String, dynamic>),
      fileSize: json['file_size'] as int);
}

Map<String, dynamic> _$StickerToJson(Sticker instance) {
  var val = <String, dynamic>{
    'file_id': instance.fileId,
    'width': instance.width,
    'height': instance.height,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('thumb', instance.thumb);
  writeNotNull('emoji', instance.emoji);
  writeNotNull('set_name', instance.setName);
  writeNotNull('mask_position', instance.maskPosition);
  writeNotNull('file_size', instance.fileSize);
  return val;
}

StickerSet _$StickerSetFromJson(Map<String, dynamic> json) {
  return StickerSet(
      json['name'] as String,
      json['title'] as String,
      json['contains_masks'] as bool,
      (json['stickers'] as List)
          ?.map((e) =>
              e == null ? null : Sticker.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$StickerSetToJson(StickerSet instance) =>
    <String, dynamic>{
      'name': instance.name,
      'title': instance.title,
      'contains_masks': instance.containsMasks,
      'stickers': instance.stickers
    };

MaskPosition _$MaskPositionFromJson(Map<String, dynamic> json) {
  return MaskPosition(
      _$enumDecodeNullable(_$MaskPositionPointEnumMap, json['point']),
      (json['x_shift'] as num)?.toDouble(),
      (json['y_shift'] as num)?.toDouble(),
      (json['scale'] as num)?.toDouble());
}

Map<String, dynamic> _$MaskPositionToJson(MaskPosition instance) =>
    <String, dynamic>{
      'point': _$MaskPositionPointEnumMap[instance.point],
      'x_shift': instance.xShift,
      'y_shift': instance.yShift,
      'scale': instance.scale
    };

const _$MaskPositionPointEnumMap = <MaskPositionPoint, dynamic>{
  MaskPositionPoint.Forehead: 'forehead',
  MaskPositionPoint.Eyes: 'eyes',
  MaskPositionPoint.Mouth: 'mouth',
  MaskPositionPoint.Chin: 'chin'
};

Video _$VideoFromJson(Map<String, dynamic> json) {
  return Video(json['file_id'] as String, json['width'] as int,
      json['height'] as int, json['duration'] as int,
      thumb: json['thumb'] == null
          ? null
          : PhotoSize.fromJson(json['thumb'] as Map<String, dynamic>),
      mimeType: json['mime_type'] as String,
      fileSize: json['file_size'] as int);
}

Map<String, dynamic> _$VideoToJson(Video instance) {
  var val = <String, dynamic>{
    'file_id': instance.fileId,
    'width': instance.width,
    'height': instance.height,
    'duration': instance.duration,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('thumb', instance.thumb);
  writeNotNull('mime_type', instance.mimeType);
  writeNotNull('file_size', instance.fileSize);
  return val;
}

Voice _$VoiceFromJson(Map<String, dynamic> json) {
  return Voice(json['file_id'] as String, json['duration'] as int,
      mimeType: json['mime_type'] as String,
      fileSize: json['file_size'] as int);
}

Map<String, dynamic> _$VoiceToJson(Voice instance) {
  var val = <String, dynamic>{
    'file_id': instance.fileId,
    'duration': instance.duration,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('mime_type', instance.mimeType);
  writeNotNull('file_size', instance.fileSize);
  return val;
}

VideoNote _$VideoNoteFromJson(Map<String, dynamic> json) {
  return VideoNote(
      json['file_id'] as String, json['length'] as int, json['duration'] as int,
      thumb: json['thumb'] == null
          ? null
          : PhotoSize.fromJson(json['thumb'] as Map<String, dynamic>),
      fileSize: json['file_size'] as int);
}

Map<String, dynamic> _$VideoNoteToJson(VideoNote instance) {
  var val = <String, dynamic>{
    'file_id': instance.fileId,
    'length': instance.length,
    'duration': instance.duration,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('thumb', instance.thumb);
  writeNotNull('file_size', instance.fileSize);
  return val;
}

Contact _$ContactFromJson(Map<String, dynamic> json) {
  return Contact(json['phone_number'] as String, json['first_name'] as String,
      lastName: json['last_name'] as String,
      userId: json['user_id'] as int,
      vCard: json['vcard'] as String);
}

Map<String, dynamic> _$ContactToJson(Contact instance) {
  var val = <String, dynamic>{
    'phone_number': instance.phoneNumber,
    'first_name': instance.firstName,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('last_name', instance.lastName);
  writeNotNull('user_id', instance.userId);
  writeNotNull('vcard', instance.vCard);
  return val;
}

Location _$LocationFromJson(Map<String, dynamic> json) {
  return Location((json['longitude'] as num)?.toDouble(),
      (json['latitude'] as num)?.toDouble());
}

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'longitude': instance.longitude,
      'latitude': instance.latitude
    };

Venue _$VenueFromJson(Map<String, dynamic> json) {
  return Venue(
      json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      json['title'] as String,
      json['address'] as String,
      foursquareId: json['foursquare_id'] as String,
      foursquareType: json['foursquare_type'] as String);
}

Map<String, dynamic> _$VenueToJson(Venue instance) {
  var val = <String, dynamic>{
    'location': instance.location,
    'title': instance.title,
    'address': instance.address,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('foursquare_id', instance.foursquareId);
  writeNotNull('foursquare_type', instance.foursquareType);
  return val;
}

UserProfilePhotos _$UserProfilePhotosFromJson(Map<String, dynamic> json) {
  return UserProfilePhotos(
      json['total_count'] as int,
      (json['photos'] as List)
          ?.map((e) => (e as List)
              ?.map((e) => e == null
                  ? null
                  : PhotoSize.fromJson(e as Map<String, dynamic>))
              ?.toList())
          ?.toList());
}

Map<String, dynamic> _$UserProfilePhotosToJson(UserProfilePhotos instance) =>
    <String, dynamic>{
      'total_count': instance.totalCount,
      'photos': instance.photos
    };

FileObject _$FileObjectFromJson(Map<String, dynamic> json) {
  return FileObject(json['file_id'] as String,
      fileSize: json['file_size'] as int,
      filePath: json['file_path'] as String);
}

Map<String, dynamic> _$FileObjectToJson(FileObject instance) {
  var val = <String, dynamic>{
    'file_id': instance.fileId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('file_size', instance.fileSize);
  writeNotNull('file_path', instance.filePath);
  return val;
}

ReplyMarkup _$ReplyMarkupFromJson(Map<String, dynamic> json) {
  return ReplyMarkup();
}

Map<String, dynamic> _$ReplyMarkupToJson(ReplyMarkup instance) =>
    <String, dynamic>{};

ReplyKeyboardMarkup _$ReplyKeyboardMarkupFromJson(Map<String, dynamic> json) {
  return ReplyKeyboardMarkup(
      (json['keyboard'] as List)
          ?.map((e) => (e as List)
              ?.map((e) => e == null
                  ? null
                  : KeyboardButton.fromJson(e as Map<String, dynamic>))
              ?.toList())
          ?.toList(),
      resizeKeyboard: json['resize_keyboard'] as bool,
      oneTimeKeyboard: json['one_time_keyboard'] as bool,
      selective: json['selective'] as bool);
}

Map<String, dynamic> _$ReplyKeyboardMarkupToJson(ReplyKeyboardMarkup instance) {
  var val = <String, dynamic>{
    'keyboard': instance.keyboard,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('resize_keyboard', instance.resizeKeyboard);
  writeNotNull('one_time_keyboard', instance.oneTimeKeyboard);
  writeNotNull('selective', instance.selective);
  return val;
}

KeyboardButton _$KeyboardButtonFromJson(Map<String, dynamic> json) {
  return KeyboardButton(json['text'] as String,
      requestContact: json['request_contact'] as bool,
      requestLocation: json['request_location'] as bool);
}

Map<String, dynamic> _$KeyboardButtonToJson(KeyboardButton instance) {
  var val = <String, dynamic>{
    'text': instance.text,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('request_contact', instance.requestContact);
  writeNotNull('request_location', instance.requestLocation);
  return val;
}

ReplyKeyboardRemove _$ReplyKeyboardRemoveFromJson(Map<String, dynamic> json) {
  return ReplyKeyboardRemove(json['remove_keyboard'] as bool,
      selective: json['selective'] as bool);
}

Map<String, dynamic> _$ReplyKeyboardRemoveToJson(ReplyKeyboardRemove instance) {
  var val = <String, dynamic>{
    'remove_keyboard': instance.removeKeyboard,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('selective', instance.selective);
  return val;
}

InlineKeyboardMarkup _$InlineKeyboardMarkupFromJson(Map<String, dynamic> json) {
  return InlineKeyboardMarkup((json['inline_keyboard'] as List)
      ?.map((e) => (e as List)
          ?.map((e) => e == null
              ? null
              : InlineKeyboardButton.fromJson(e as Map<String, dynamic>))
          ?.toList())
      ?.toList());
}

Map<String, dynamic> _$InlineKeyboardMarkupToJson(
        InlineKeyboardMarkup instance) =>
    <String, dynamic>{'inline_keyboard': instance.inlineKeyboard};

InlineKeyboardButton _$InlineKeyboardButtonFromJson(Map<String, dynamic> json) {
  return InlineKeyboardButton(json['text'] as String,
      url: json['url'] as String,
      callbackData: json['callback_data'] as String,
      switchInlineQuery: json['switch_inline_query'] as String,
      switchInlineQueryCurrentChat:
          json['switch_inline_query_current_chat'] as String,
      callbackGame: json['callback_game'] == null
          ? null
          : CallbackGame.fromJson(
              json['callback_game'] as Map<String, dynamic>),
      pay: json['pay'] as bool);
}

Map<String, dynamic> _$InlineKeyboardButtonToJson(
    InlineKeyboardButton instance) {
  var val = <String, dynamic>{
    'text': instance.text,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('url', instance.url);
  writeNotNull('callback_data', instance.callbackData);
  writeNotNull('switch_inline_query', instance.switchInlineQuery);
  writeNotNull('switch_inline_query_current_chat',
      instance.switchInlineQueryCurrentChat);
  writeNotNull('callback_game', instance.callbackGame);
  writeNotNull('pay', instance.pay);
  return val;
}

CallbackQuery _$CallbackQueryFromJson(Map<String, dynamic> json) {
  return CallbackQuery(
      json['id'] as String,
      json['from'] == null
          ? null
          : User.fromJson(json['from'] as Map<String, dynamic>),
      json['chat_instance'] as String,
      message: json['message'] == null
          ? null
          : Message.fromJson(json['message'] as Map<String, dynamic>),
      inlineMessageId: json['inline_message_id'] as String,
      data: json['data'] as String,
      gameShortName: json['game_short_name'] as String);
}

Map<String, dynamic> _$CallbackQueryToJson(CallbackQuery instance) {
  var val = <String, dynamic>{
    'id': instance.id,
    'from': instance.from,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('message', instance.message);
  writeNotNull('inline_message_id', instance.inlineMessageId);
  writeNotNull('chat_instance', instance.chatInstance);
  writeNotNull('data', instance.data);
  writeNotNull('game_short_name', instance.gameShortName);
  return val;
}

ShippingQuery _$ShippingQueryFromJson(Map<String, dynamic> json) {
  return ShippingQuery(
      json['id'] as String,
      json['from'] == null
          ? null
          : User.fromJson(json['from'] as Map<String, dynamic>),
      json['invoice_payload'] as String,
      json['shipping_address'] == null
          ? null
          : ShippingAddress.fromJson(
              json['shipping_address'] as Map<String, dynamic>));
}

Map<String, dynamic> _$ShippingQueryToJson(ShippingQuery instance) =>
    <String, dynamic>{
      'id': instance.id,
      'from': instance.from,
      'invoice_payload': instance.invoicePayload,
      'shipping_address': instance.shippingAddress
    };

PreCheckoutQuery _$PreCheckoutQueryFromJson(Map<String, dynamic> json) {
  return PreCheckoutQuery(
      json['id'] as String,
      json['from'] == null
          ? null
          : User.fromJson(json['from'] as Map<String, dynamic>),
      json['currency'] as String,
      json['total_amount'] as int,
      json['invoice_payload'] as String,
      shippingOptionId: json['shipping_option_id'] as String,
      orderInfo: json['order_info'] == null
          ? null
          : OrderInfo.fromJson(json['order_info'] as Map<String, dynamic>));
}

Map<String, dynamic> _$PreCheckoutQueryToJson(PreCheckoutQuery instance) {
  var val = <String, dynamic>{
    'id': instance.id,
    'from': instance.from,
    'currency': instance.currency,
    'total_amount': instance.totalAmount,
    'invoice_payload': instance.invoicePayload,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('shipping_option_id', instance.shippingOptionId);
  writeNotNull('order_info', instance.orderInfo);
  return val;
}

ForceReply _$ForceReplyFromJson(Map<String, dynamic> json) {
  return ForceReply(json['force_reply'] as bool,
      selective: json['selective'] as bool);
}

Map<String, dynamic> _$ForceReplyToJson(ForceReply instance) {
  var val = <String, dynamic>{
    'force_reply': instance.forceReply,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('selective', instance.selective);
  return val;
}

ChatPhoto _$ChatPhotoFromJson(Map<String, dynamic> json) {
  return ChatPhoto(
      json['small_file_id'] as String, json['big_file_id'] as String);
}

Map<String, dynamic> _$ChatPhotoToJson(ChatPhoto instance) => <String, dynamic>{
      'small_file_id': instance.smallFileId,
      'big_file_id': instance.bigFileId
    };

ChatMember _$ChatMemberFromJson(Map<String, dynamic> json) {
  return ChatMember(
      json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      _$enumDecodeNullable(_$ChatMemberStatusEnumMap, json['status']),
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

Map<String, dynamic> _$ChatMemberToJson(ChatMember instance) {
  var val = <String, dynamic>{
    'user': instance.user,
    'status': _$ChatMemberStatusEnumMap[instance.status],
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('until_date', instance.untilDate);
  writeNotNull('can_be_edited', instance.canBeEdited);
  writeNotNull('can_change_info', instance.canChangeInfo);
  writeNotNull('can_post_messages', instance.canPostMessages);
  writeNotNull('can_edit_messages', instance.canEditMessages);
  writeNotNull('can_delete_messages', instance.canDeleteMessages);
  writeNotNull('can_invite_users', instance.canInviteUsers);
  writeNotNull('can_restrict_members', instance.canRestrictMembers);
  writeNotNull('can_pin_messages', instance.canPinMessages);
  writeNotNull('can_promote_members', instance.canPromoteMembers);
  writeNotNull('can_send_messages', instance.canSendMessages);
  writeNotNull('can_send_media_messages', instance.canSendMediaMessages);
  writeNotNull('can_send_other_messages', instance.canSendOtherMessages);
  writeNotNull('can_add_web_page_previews', instance.canAddWebPagePreviews);
  return val;
}

const _$ChatMemberStatusEnumMap = <ChatMemberStatus, dynamic>{
  ChatMemberStatus.Creator: 'creator',
  ChatMemberStatus.Administrator: 'administrator',
  ChatMemberStatus.Member: 'member',
  ChatMemberStatus.Left: 'left',
  ChatMemberStatus.Kicked: 'kicked'
};

Message _$MessageFromJson(Map<String, dynamic> json) {
  return Message(
      json['message_id'] as int,
      json['date'] as int,
      json['chat'] == null
          ? null
          : Chat.fromJson(json['chat'] as Map<String, dynamic>),
      from: json['from'] == null
          ? null
          : User.fromJson(json['from'] as Map<String, dynamic>),
      forwardFrom: json['forward_from'] == null
          ? null
          : User.fromJson(json['forward_from'] as Map<String, dynamic>),
      forwardFromChat: json['forward_from_chat'] == null
          ? null
          : Chat.fromJson(json['forward_from_chat'] as Map<String, dynamic>),
      forwardFromMessageId: json['forward_from_message_id'] as int,
      forwardSignature: json['forward_signature'] as String,
      forwardDate: json['forward_date'] as int,
      replyToMessage: json['reply_to_message'] == null
          ? null
          : Message.fromJson(json['reply_to_message'] as Map<String, dynamic>),
      editDate: json['edit_date'] as int,
      authorSignature: json['author_signature'] as String,
      text: json['text'] as String,
      entities: (json['entities'] as List)
          ?.map((e) => e == null
              ? null
              : MessageEntity.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      captionEntities: (json['caption_entities'] as List)
          ?.map((e) => e == null
              ? null
              : MessageEntity.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      audio: json['audio'] == null
          ? null
          : Audio.fromJson(json['audio'] as Map<String, dynamic>),
      document: json['document'] == null
          ? null
          : Document.fromJson(json['document'] as Map<String, dynamic>),
      game: json['game'] == null
          ? null
          : Game.fromJson(json['game'] as Map<String, dynamic>),
      photo: (json['photo'] as List)
          ?.map((e) => e == null ? null : PhotoSize.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      sticker: json['sticker'] == null ? null : Sticker.fromJson(json['sticker'] as Map<String, dynamic>),
      video: json['video'] == null ? null : Video.fromJson(json['video'] as Map<String, dynamic>),
      voice: json['voice'] == null ? null : Voice.fromJson(json['voice'] as Map<String, dynamic>),
      videoNote: json['video_note'] == null ? null : VideoNote.fromJson(json['video_note'] as Map<String, dynamic>),
      caption: json['caption'] as String,
      contact: json['contact'] == null ? null : Contact.fromJson(json['contact'] as Map<String, dynamic>),
      location: json['location'] == null ? null : Location.fromJson(json['location'] as Map<String, dynamic>),
      venue: json['venue'] == null ? null : Venue.fromJson(json['venue'] as Map<String, dynamic>),
      newChatMembers: (json['new_chat_members'] as List)?.map((e) => e == null ? null : User.fromJson(e as Map<String, dynamic>))?.toList(),
      leftChatMember: json['left_chat_member'] == null ? null : User.fromJson(json['left_chat_member'] as Map<String, dynamic>),
      newChatTitle: json['new_chat_title'] as String,
      newChatPhoto: (json['new_chat_photo'] as List)?.map((e) => e == null ? null : PhotoSize.fromJson(e as Map<String, dynamic>))?.toList(),
      deleteChatPhoto: json['delete_chat_photo'] as bool,
      groupChatCreated: json['group_chat_created'] as bool,
      supergroupChatCreated: json['supergroup_chat_created'] as bool,
      channelChatCreated: json['channel_chat_created'] as bool,
      migrateToChatId: json['migrate_to_chat_id'] as int,
      migrateFromChatId: json['migrate_from_chat_id'] as int,
      pinnedMessage: json['pinned_message'] == null ? null : Message.fromJson(json['pinned_message'] as Map<String, dynamic>),
      invoice: json['invoice'] == null ? null : Invoice.fromJson(json['invoice'] as Map<String, dynamic>),
      successfulPayment: json['successful_payment'] == null ? null : SuccessfulPayment.fromJson(json['successful_payment'] as Map<String, dynamic>),
      connectedWebsite: json['connected_website'] as String)
    ..animation = json['animation'] == null ? null : Animation.fromJson(json['animation'] as Map<String, dynamic>);
}

Map<String, dynamic> _$MessageToJson(Message instance) {
  var val = <String, dynamic>{
    'message_id': instance.messageId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('from', instance.from);
  val['date'] = instance.date;
  val['chat'] = instance.chat;
  writeNotNull('forward_from', instance.forwardFrom);
  writeNotNull('forward_from_chat', instance.forwardFromChat);
  writeNotNull('forward_from_message_id', instance.forwardFromMessageId);
  writeNotNull('forward_signature', instance.forwardSignature);
  writeNotNull('forward_date', instance.forwardDate);
  writeNotNull('reply_to_message', instance.replyToMessage);
  writeNotNull('edit_date', instance.editDate);
  writeNotNull('author_signature', instance.authorSignature);
  writeNotNull('text', instance.text);
  writeNotNull('entities', instance.entities);
  writeNotNull('caption_entities', instance.captionEntities);
  writeNotNull('audio', instance.audio);
  writeNotNull('document', instance.document);
  writeNotNull('animation', instance.animation);
  writeNotNull('game', instance.game);
  writeNotNull('photo', instance.photo);
  writeNotNull('sticker', instance.sticker);
  writeNotNull('video', instance.video);
  writeNotNull('voice', instance.voice);
  writeNotNull('video_note', instance.videoNote);
  writeNotNull('caption', instance.caption);
  writeNotNull('contact', instance.contact);
  writeNotNull('location', instance.location);
  writeNotNull('venue', instance.venue);
  writeNotNull('new_chat_members', instance.newChatMembers);
  writeNotNull('left_chat_member', instance.leftChatMember);
  writeNotNull('new_chat_title', instance.newChatTitle);
  writeNotNull('new_chat_photo', instance.newChatPhoto);
  writeNotNull('delete_chat_photo', instance.deleteChatPhoto);
  writeNotNull('group_chat_created', instance.groupChatCreated);
  writeNotNull('supergroup_chat_created', instance.supergroupChatCreated);
  writeNotNull('channel_chat_created', instance.channelChatCreated);
  writeNotNull('migrate_to_chat_id', instance.migrateToChatId);
  writeNotNull('migrate_from_chat_id', instance.migrateFromChatId);
  writeNotNull('pinned_message', instance.pinnedMessage);
  writeNotNull('invoice', instance.invoice);
  writeNotNull('successful_payment', instance.successfulPayment);
  writeNotNull('connected_website', instance.connectedWebsite);
  return val;
}

InlineQuery _$InlineQueryFromJson(Map<String, dynamic> json) {
  return InlineQuery(
      json['id'] as String,
      json['from'] == null
          ? null
          : User.fromJson(json['from'] as Map<String, dynamic>),
      json['query'] as String,
      json['offset'] as String,
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>));
}

Map<String, dynamic> _$InlineQueryToJson(InlineQuery instance) {
  var val = <String, dynamic>{
    'id': instance.id,
    'from': instance.from,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('location', instance.location);
  val['query'] = instance.query;
  val['offset'] = instance.offset;
  return val;
}

ChosenInlineResult _$ChosenInlineResultFromJson(Map<String, dynamic> json) {
  return ChosenInlineResult(
      json['result_id'] as String,
      json['from'] == null
          ? null
          : User.fromJson(json['from'] as Map<String, dynamic>),
      json['query'] as String,
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      inlineMessageId: json['inline_message_id'] as String);
}

Map<String, dynamic> _$ChosenInlineResultToJson(ChosenInlineResult instance) {
  var val = <String, dynamic>{
    'result_id': instance.resultId,
    'from': instance.from,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('location', instance.location);
  writeNotNull('inline_message_id', instance.inlineMessageId);
  val['query'] = instance.query;
  return val;
}

InlineQueryResult _$InlineQueryResultFromJson(Map<String, dynamic> json) {
  return InlineQueryResult(
      _$enumDecodeNullable(_$InlineQueryResultTypeEnumMap, json['type']),
      json['id'] as String);
}

Map<String, dynamic> _$InlineQueryResultToJson(InlineQueryResult instance) =>
    <String, dynamic>{
      'type': _$InlineQueryResultTypeEnumMap[instance.type],
      'id': instance.id
    };

const _$InlineQueryResultTypeEnumMap = <InlineQueryResultType, dynamic>{
  InlineQueryResultType.Article: 'article',
  InlineQueryResultType.Photo: 'photo',
  InlineQueryResultType.Gif: 'gif',
  InlineQueryResultType.Mpeg4Gif: 'mpeg4_gif',
  InlineQueryResultType.Video: 'video',
  InlineQueryResultType.Audio: 'audio',
  InlineQueryResultType.Voice: 'voice',
  InlineQueryResultType.Document: 'document',
  InlineQueryResultType.Location: 'location',
  InlineQueryResultType.Venue: 'venue',
  InlineQueryResultType.Contact: 'contact',
  InlineQueryResultType.Sticker: 'sticker',
  InlineQueryResultType.Game: 'game'
};

InlineQueryResultArticle _$InlineQueryResultArticleFromJson(
    Map<String, dynamic> json) {
  return InlineQueryResultArticle(
      json['title'] as String,
      json['input_message_content'] == null
          ? null
          : InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>),
      url: json['url'] as String,
      hideUrl: json['hide_url'] as bool,
      description: json['description'] as String,
      thumbUrl: json['thumb_url'] as String,
      thumbWidth: json['thumb_width'] as int,
      thumbHeight: json['thumb_height'] as int)
    ..type = _$enumDecodeNullable(_$InlineQueryResultTypeEnumMap, json['type'])
    ..id = json['id'] as String
    ..replyMarkup = json['reply_markup'] == null
        ? null
        : InlineKeyboardMarkup.fromJson(
            json['reply_markup'] as Map<String, dynamic>);
}

Map<String, dynamic> _$InlineQueryResultArticleToJson(
    InlineQueryResultArticle instance) {
  var val = <String, dynamic>{
    'type': _$InlineQueryResultTypeEnumMap[instance.type],
    'id': instance.id,
    'title': instance.title,
    'input_message_content': instance.inputMessageContent,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('reply_markup', instance.replyMarkup);
  writeNotNull('url', instance.url);
  writeNotNull('hide_url', instance.hideUrl);
  writeNotNull('description', instance.description);
  writeNotNull('thumb_url', instance.thumbUrl);
  writeNotNull('thumb_width', instance.thumbWidth);
  writeNotNull('thumb_height', instance.thumbHeight);
  return val;
}

InlineQueryResultPhoto _$InlineQueryResultPhotoFromJson(
    Map<String, dynamic> json) {
  return InlineQueryResultPhoto(
      json['photo_url'] as String, json['thumb_url'] as String,
      photoWidth: json['photo_width'] as int,
      photoHeight: json['photo_height'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      caption: json['caption'] as String,
      parseMode: _$enumDecodeNullable(_$ParseModeEnumMap, json['parse_mode']),
      replyMarkup: json['reply_markup'] == null
          ? null
          : InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      inputMessageContent: json['input_message_content'] == null
          ? null
          : InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>))
    ..type = _$enumDecodeNullable(_$InlineQueryResultTypeEnumMap, json['type'])
    ..id = json['id'] as String;
}

Map<String, dynamic> _$InlineQueryResultPhotoToJson(
    InlineQueryResultPhoto instance) {
  var val = <String, dynamic>{
    'type': _$InlineQueryResultTypeEnumMap[instance.type],
    'id': instance.id,
    'photo_url': instance.photoUrl,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('photo_width', instance.photoWidth);
  writeNotNull('photo_height', instance.photoHeight);
  val['thumb_url'] = instance.thumbUrl;
  writeNotNull('title', instance.title);
  writeNotNull('description', instance.description);
  writeNotNull('caption', instance.caption);
  writeNotNull('parse_mode', _$ParseModeEnumMap[instance.parseMode]);
  writeNotNull('reply_markup', instance.replyMarkup);
  writeNotNull('input_message_content', instance.inputMessageContent);
  return val;
}

InlineQueryResultGif _$InlineQueryResultGifFromJson(Map<String, dynamic> json) {
  return InlineQueryResultGif(
      json['gif_url'] as String, json['thumb_url'] as String,
      gifWidth: json['gif_width'] as int,
      gifHeight: json['gif_height'] as int,
      gifDuration: json['gif_duration'] as int,
      title: json['title'] as String,
      caption: json['caption'] as String,
      parseMode: _$enumDecodeNullable(_$ParseModeEnumMap, json['parse_mode']),
      replyMarkup: json['reply_markup'] == null
          ? null
          : InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      inputMessageContent: json['input_message_content'] == null
          ? null
          : InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>))
    ..type = _$enumDecodeNullable(_$InlineQueryResultTypeEnumMap, json['type'])
    ..id = json['id'] as String;
}

Map<String, dynamic> _$InlineQueryResultGifToJson(
    InlineQueryResultGif instance) {
  var val = <String, dynamic>{
    'type': _$InlineQueryResultTypeEnumMap[instance.type],
    'id': instance.id,
    'gif_url': instance.gifUrl,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('gif_width', instance.gifWidth);
  writeNotNull('gif_height', instance.gifHeight);
  writeNotNull('gif_duration', instance.gifDuration);
  val['thumb_url'] = instance.thumbUrl;
  writeNotNull('title', instance.title);
  writeNotNull('caption', instance.caption);
  writeNotNull('parse_mode', _$ParseModeEnumMap[instance.parseMode]);
  writeNotNull('reply_markup', instance.replyMarkup);
  writeNotNull('input_message_content', instance.inputMessageContent);
  return val;
}

InlineQueryResultMpeg4Gif _$InlineQueryResultMpeg4GifFromJson(
    Map<String, dynamic> json) {
  return InlineQueryResultMpeg4Gif(
      json['mpeg4_url'] as String, json['thumb_url'] as String,
      mpeg4Width: json['mpeg4_width'] as int,
      mpeg4Height: json['mpeg4_height'] as int,
      mpeg4Duration: json['mpeg4_duration'] as int,
      title: json['title'] as String,
      caption: json['caption'] as String,
      parseMode: _$enumDecodeNullable(_$ParseModeEnumMap, json['parse_mode']),
      replyMarkup: json['reply_markup'] == null
          ? null
          : InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      inputMessageContent: json['input_message_content'] == null
          ? null
          : InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>))
    ..type = _$enumDecodeNullable(_$InlineQueryResultTypeEnumMap, json['type'])
    ..id = json['id'] as String;
}

Map<String, dynamic> _$InlineQueryResultMpeg4GifToJson(
    InlineQueryResultMpeg4Gif instance) {
  var val = <String, dynamic>{
    'type': _$InlineQueryResultTypeEnumMap[instance.type],
    'id': instance.id,
    'mpeg4_url': instance.mpeg4Url,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('mpeg4_width', instance.mpeg4Width);
  writeNotNull('mpeg4_height', instance.mpeg4Height);
  writeNotNull('mpeg4_duration', instance.mpeg4Duration);
  val['thumb_url'] = instance.thumbUrl;
  writeNotNull('title', instance.title);
  writeNotNull('caption', instance.caption);
  writeNotNull('parse_mode', _$ParseModeEnumMap[instance.parseMode]);
  writeNotNull('reply_markup', instance.replyMarkup);
  writeNotNull('input_message_content', instance.inputMessageContent);
  return val;
}

InlineQueryResultVideo _$InlineQueryResultVideoFromJson(
    Map<String, dynamic> json) {
  return InlineQueryResultVideo(
      json['video_url'] as String,
      _$enumDecodeNullable(_$VideoMimeTypeEnumMap, json['mime_type']),
      json['thumb_url'] as String,
      json['title'] as String,
      caption: json['caption'] as String,
      parseMode: _$enumDecodeNullable(_$ParseModeEnumMap, json['parse_mode']),
      videoWidth: json['video_width'] as int,
      videoHeight: json['video_height'] as int,
      videoDuration: json['video_duration'] as int,
      description: json['description'] as String,
      replyMarkup: json['reply_markup'] == null
          ? null
          : InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      inputMessageContent: json['input_message_content'] == null
          ? null
          : InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>))
    ..type = _$enumDecodeNullable(_$InlineQueryResultTypeEnumMap, json['type'])
    ..id = json['id'] as String;
}

Map<String, dynamic> _$InlineQueryResultVideoToJson(
    InlineQueryResultVideo instance) {
  var val = <String, dynamic>{
    'type': _$InlineQueryResultTypeEnumMap[instance.type],
    'id': instance.id,
    'video_url': instance.videoUrl,
    'mime_type': _$VideoMimeTypeEnumMap[instance.mimeType],
    'thumb_url': instance.thumbUrl,
    'title': instance.title,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('caption', instance.caption);
  writeNotNull('parse_mode', _$ParseModeEnumMap[instance.parseMode]);
  writeNotNull('video_width', instance.videoWidth);
  writeNotNull('video_height', instance.videoHeight);
  writeNotNull('video_duration', instance.videoDuration);
  writeNotNull('description', instance.description);
  writeNotNull('reply_markup', instance.replyMarkup);
  writeNotNull('input_message_content', instance.inputMessageContent);
  return val;
}

const _$VideoMimeTypeEnumMap = <VideoMimeType, dynamic>{
  VideoMimeType.TextHtml: 'text/html',
  VideoMimeType.VideoMp4: 'video/mp4'
};

InlineQueryResultAudio _$InlineQueryResultAudioFromJson(
    Map<String, dynamic> json) {
  return InlineQueryResultAudio(
      json['audio_url'] as String, json['title'] as String,
      caption: json['caption'] as String,
      parseMode: _$enumDecodeNullable(_$ParseModeEnumMap, json['parse_mode']),
      performer: json['performer'] as String,
      audioDuration: json['audio_duration'] as int,
      replyMarkup: json['reply_markup'] == null
          ? null
          : InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      inputMessageContent: json['input_message_content'] == null
          ? null
          : InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>))
    ..type = _$enumDecodeNullable(_$InlineQueryResultTypeEnumMap, json['type'])
    ..id = json['id'] as String;
}

Map<String, dynamic> _$InlineQueryResultAudioToJson(
    InlineQueryResultAudio instance) {
  var val = <String, dynamic>{
    'type': _$InlineQueryResultTypeEnumMap[instance.type],
    'id': instance.id,
    'audio_url': instance.audioUrl,
    'title': instance.title,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('caption', instance.caption);
  writeNotNull('parse_mode', _$ParseModeEnumMap[instance.parseMode]);
  writeNotNull('performer', instance.performer);
  writeNotNull('audio_duration', instance.audioDuration);
  writeNotNull('reply_markup', instance.replyMarkup);
  writeNotNull('input_message_content', instance.inputMessageContent);
  return val;
}

InlineQueryResultVoice _$InlineQueryResultVoiceFromJson(
    Map<String, dynamic> json) {
  return InlineQueryResultVoice(
      json['voice_url'] as String, json['title'] as String,
      caption: json['caption'] as String,
      parseMode: _$enumDecodeNullable(_$ParseModeEnumMap, json['parse_mode']),
      voiceDuration: json['voice_duration'] as int,
      replyMarkup: json['reply_markup'] == null
          ? null
          : InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      inputMessageContent: json['input_message_content'] == null
          ? null
          : InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>))
    ..type = _$enumDecodeNullable(_$InlineQueryResultTypeEnumMap, json['type'])
    ..id = json['id'] as String;
}

Map<String, dynamic> _$InlineQueryResultVoiceToJson(
    InlineQueryResultVoice instance) {
  var val = <String, dynamic>{
    'type': _$InlineQueryResultTypeEnumMap[instance.type],
    'id': instance.id,
    'voice_url': instance.voiceUrl,
    'title': instance.title,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('caption', instance.caption);
  writeNotNull('parse_mode', _$ParseModeEnumMap[instance.parseMode]);
  writeNotNull('voice_duration', instance.voiceDuration);
  writeNotNull('reply_markup', instance.replyMarkup);
  writeNotNull('input_message_content', instance.inputMessageContent);
  return val;
}

InlineQueryResultDocument _$InlineQueryResultDocumentFromJson(
    Map<String, dynamic> json) {
  return InlineQueryResultDocument(
      json['title'] as String,
      json['document_url'] as String,
      _$enumDecodeNullable(_$DocumentMimeTypeEnumMap, json['mime_type']),
      caption: json['caption'] as String,
      parseMode: _$enumDecodeNullable(_$ParseModeEnumMap, json['parse_mode']),
      description: json['description'] as String,
      replyMarkup: json['reply_markup'] == null
          ? null
          : InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      inputMessageContent: json['input_message_content'] == null
          ? null
          : InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>),
      thumbUrl: json['thumb_url'] as String,
      thumbWidth: json['thumb_width'] as int,
      thumbHeight: json['thumb_height'] as int)
    ..type = _$enumDecodeNullable(_$InlineQueryResultTypeEnumMap, json['type'])
    ..id = json['id'] as String;
}

Map<String, dynamic> _$InlineQueryResultDocumentToJson(
    InlineQueryResultDocument instance) {
  var val = <String, dynamic>{
    'type': _$InlineQueryResultTypeEnumMap[instance.type],
    'id': instance.id,
    'title': instance.title,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('caption', instance.caption);
  writeNotNull('parse_mode', _$ParseModeEnumMap[instance.parseMode]);
  val['document_url'] = instance.documentUrl;
  val['mime_type'] = _$DocumentMimeTypeEnumMap[instance.mimeType];
  writeNotNull('description', instance.description);
  writeNotNull('reply_markup', instance.replyMarkup);
  writeNotNull('input_message_content', instance.inputMessageContent);
  writeNotNull('thumb_url', instance.thumbUrl);
  writeNotNull('thumb_width', instance.thumbWidth);
  writeNotNull('thumb_height', instance.thumbHeight);
  return val;
}

const _$DocumentMimeTypeEnumMap = <DocumentMimeType, dynamic>{
  DocumentMimeType.ApplicationPdf: 'application/pdf',
  DocumentMimeType.ApplicationZip: 'application/zip'
};

InlineQueryResultLocation _$InlineQueryResultLocationFromJson(
    Map<String, dynamic> json) {
  return InlineQueryResultLocation((json['latitude'] as num)?.toDouble(),
      (json['longitude'] as num)?.toDouble(), json['title'] as String,
      replyMarkup: json['reply_markup'] == null
          ? null
          : InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      inputMessageContent: json['input_message_content'] == null
          ? null
          : InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>),
      thumbUrl: json['thumb_url'] as String,
      thumbWidth: json['thumb_width'] as int,
      thumbHeight: json['thumb_height'] as int)
    ..type = _$enumDecodeNullable(_$InlineQueryResultTypeEnumMap, json['type'])
    ..id = json['id'] as String;
}

Map<String, dynamic> _$InlineQueryResultLocationToJson(
    InlineQueryResultLocation instance) {
  var val = <String, dynamic>{
    'type': _$InlineQueryResultTypeEnumMap[instance.type],
    'id': instance.id,
    'latitude': instance.latitude,
    'longitude': instance.longitude,
    'title': instance.title,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('reply_markup', instance.replyMarkup);
  writeNotNull('input_message_content', instance.inputMessageContent);
  writeNotNull('thumb_url', instance.thumbUrl);
  writeNotNull('thumb_width', instance.thumbWidth);
  writeNotNull('thumb_height', instance.thumbHeight);
  return val;
}

InlineQueryResultVenue _$InlineQueryResultVenueFromJson(
    Map<String, dynamic> json) {
  return InlineQueryResultVenue(
      (json['latitude'] as num)?.toDouble(),
      (json['longitude'] as num)?.toDouble(),
      json['title'] as String,
      json['address'] as String,
      foursquareId: json['foursquare_id'] as String,
      foursquareType: json['foursquare_type'] as String,
      replyMarkup: json['reply_markup'] == null
          ? null
          : InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      inputMessageContent: json['input_message_content'] == null
          ? null
          : InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>),
      thumbUrl: json['thumb_url'] as String,
      thumbWidth: json['thumb_width'] as int,
      thumbHeight: json['thumb_height'] as int)
    ..type = _$enumDecodeNullable(_$InlineQueryResultTypeEnumMap, json['type'])
    ..id = json['id'] as String;
}

Map<String, dynamic> _$InlineQueryResultVenueToJson(
    InlineQueryResultVenue instance) {
  var val = <String, dynamic>{
    'type': _$InlineQueryResultTypeEnumMap[instance.type],
    'id': instance.id,
    'latitude': instance.latitude,
    'longitude': instance.longitude,
    'title': instance.title,
    'address': instance.address,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('foursquare_id', instance.foursquareId);
  writeNotNull('foursquare_type', instance.foursquareType);
  writeNotNull('reply_markup', instance.replyMarkup);
  writeNotNull('input_message_content', instance.inputMessageContent);
  writeNotNull('thumb_url', instance.thumbUrl);
  writeNotNull('thumb_width', instance.thumbWidth);
  writeNotNull('thumb_height', instance.thumbHeight);
  return val;
}

InlineQueryResultContact _$InlineQueryResultContactFromJson(
    Map<String, dynamic> json) {
  return InlineQueryResultContact(
      json['phone_number'] as String, json['first_name'] as String,
      lastName: json['last_name'] as String,
      vCard: json['vcard'] as String,
      replyMarkup: json['reply_markup'] == null
          ? null
          : InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      inputMessageContent: json['input_message_content'] == null
          ? null
          : InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>),
      thumbUrl: json['thumb_url'] as String,
      thumbWidth: json['thumb_width'] as int,
      thumbHeight: json['thumb_height'] as int)
    ..type = _$enumDecodeNullable(_$InlineQueryResultTypeEnumMap, json['type'])
    ..id = json['id'] as String;
}

Map<String, dynamic> _$InlineQueryResultContactToJson(
    InlineQueryResultContact instance) {
  var val = <String, dynamic>{
    'type': _$InlineQueryResultTypeEnumMap[instance.type],
    'id': instance.id,
    'phone_number': instance.phoneNumber,
    'first_name': instance.firstName,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('last_name', instance.lastName);
  writeNotNull('vcard', instance.vCard);
  writeNotNull('reply_markup', instance.replyMarkup);
  writeNotNull('input_message_content', instance.inputMessageContent);
  writeNotNull('thumb_url', instance.thumbUrl);
  writeNotNull('thumb_width', instance.thumbWidth);
  writeNotNull('thumb_height', instance.thumbHeight);
  return val;
}

InlineQueryResultGame _$InlineQueryResultGameFromJson(
    Map<String, dynamic> json) {
  return InlineQueryResultGame(json['game_short_name'] as String,
      replyMarkup: json['reply_markup'] == null
          ? null
          : InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>))
    ..type = _$enumDecodeNullable(_$InlineQueryResultTypeEnumMap, json['type'])
    ..id = json['id'] as String;
}

Map<String, dynamic> _$InlineQueryResultGameToJson(
    InlineQueryResultGame instance) {
  var val = <String, dynamic>{
    'type': _$InlineQueryResultTypeEnumMap[instance.type],
    'id': instance.id,
    'game_short_name': instance.gameShortName,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('reply_markup', instance.replyMarkup);
  return val;
}

InlineQueryResultCachedPhoto _$InlineQueryResultCachedPhotoFromJson(
    Map<String, dynamic> json) {
  return InlineQueryResultCachedPhoto(json['photo_file_id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      caption: json['caption'] as String,
      parseMode: _$enumDecodeNullable(_$ParseModeEnumMap, json['parse_mode']),
      replyMarkup: json['reply_markup'] == null
          ? null
          : InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      inputMessageContent: json['input_message_content'] == null
          ? null
          : InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>))
    ..type = _$enumDecodeNullable(_$InlineQueryResultTypeEnumMap, json['type'])
    ..id = json['id'] as String;
}

Map<String, dynamic> _$InlineQueryResultCachedPhotoToJson(
    InlineQueryResultCachedPhoto instance) {
  var val = <String, dynamic>{
    'type': _$InlineQueryResultTypeEnumMap[instance.type],
    'id': instance.id,
    'photo_file_id': instance.photoFileId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('title', instance.title);
  writeNotNull('description', instance.description);
  writeNotNull('caption', instance.caption);
  writeNotNull('parse_mode', _$ParseModeEnumMap[instance.parseMode]);
  writeNotNull('reply_markup', instance.replyMarkup);
  writeNotNull('input_message_content', instance.inputMessageContent);
  return val;
}

InlineQueryResultCachedGif _$InlineQueryResultCachedGifFromJson(
    Map<String, dynamic> json) {
  return InlineQueryResultCachedGif(json['gif_file_id'] as String,
      title: json['title'] as String,
      caption: json['caption'] as String,
      parseMode: _$enumDecodeNullable(_$ParseModeEnumMap, json['parse_mode']),
      replyMarkup: json['reply_markup'] == null
          ? null
          : InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      inputMessageContent: json['input_message_content'] == null
          ? null
          : InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>))
    ..type = _$enumDecodeNullable(_$InlineQueryResultTypeEnumMap, json['type'])
    ..id = json['id'] as String;
}

Map<String, dynamic> _$InlineQueryResultCachedGifToJson(
    InlineQueryResultCachedGif instance) {
  var val = <String, dynamic>{
    'type': _$InlineQueryResultTypeEnumMap[instance.type],
    'id': instance.id,
    'gif_file_id': instance.gifFileId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('title', instance.title);
  writeNotNull('caption', instance.caption);
  writeNotNull('parse_mode', _$ParseModeEnumMap[instance.parseMode]);
  writeNotNull('reply_markup', instance.replyMarkup);
  writeNotNull('input_message_content', instance.inputMessageContent);
  return val;
}

InlineQueryResultCachedMpeg4Gif _$InlineQueryResultCachedMpeg4GifFromJson(
    Map<String, dynamic> json) {
  return InlineQueryResultCachedMpeg4Gif(json['mpeg4_file_id'] as String,
      title: json['title'] as String,
      caption: json['caption'] as String,
      parseMode: _$enumDecodeNullable(_$ParseModeEnumMap, json['parse_mode']),
      replyMarkup: json['reply_markup'] == null
          ? null
          : InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      inputMessageContent: json['input_message_content'] == null
          ? null
          : InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>))
    ..type = _$enumDecodeNullable(_$InlineQueryResultTypeEnumMap, json['type'])
    ..id = json['id'] as String;
}

Map<String, dynamic> _$InlineQueryResultCachedMpeg4GifToJson(
    InlineQueryResultCachedMpeg4Gif instance) {
  var val = <String, dynamic>{
    'type': _$InlineQueryResultTypeEnumMap[instance.type],
    'id': instance.id,
    'mpeg4_file_id': instance.mpeg4FileId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('title', instance.title);
  writeNotNull('caption', instance.caption);
  writeNotNull('parse_mode', _$ParseModeEnumMap[instance.parseMode]);
  writeNotNull('reply_markup', instance.replyMarkup);
  writeNotNull('input_message_content', instance.inputMessageContent);
  return val;
}

InlineQueryResultCachedSticker _$InlineQueryResultCachedStickerFromJson(
    Map<String, dynamic> json) {
  return InlineQueryResultCachedSticker(json['sticker_file_id'] as String,
      replyMarkup: json['reply_markup'] == null
          ? null
          : InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      inputMessageContent: json['input_message_content'] == null
          ? null
          : InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>))
    ..type = _$enumDecodeNullable(_$InlineQueryResultTypeEnumMap, json['type'])
    ..id = json['id'] as String;
}

Map<String, dynamic> _$InlineQueryResultCachedStickerToJson(
    InlineQueryResultCachedSticker instance) {
  var val = <String, dynamic>{
    'type': _$InlineQueryResultTypeEnumMap[instance.type],
    'id': instance.id,
    'sticker_file_id': instance.stickerFileId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('reply_markup', instance.replyMarkup);
  writeNotNull('input_message_content', instance.inputMessageContent);
  return val;
}

InlineQueryResultCachedDocument _$InlineQueryResultCachedDocumentFromJson(
    Map<String, dynamic> json) {
  return InlineQueryResultCachedDocument(
      json['document_file_id'] as String, json['title'] as String,
      description: json['description'] as String,
      caption: json['caption'] as String,
      parseMode: _$enumDecodeNullable(_$ParseModeEnumMap, json['parse_mode']),
      replyMarkup: json['reply_markup'] == null
          ? null
          : InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      inputMessageContent: json['input_message_content'] == null
          ? null
          : InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>))
    ..type = _$enumDecodeNullable(_$InlineQueryResultTypeEnumMap, json['type'])
    ..id = json['id'] as String;
}

Map<String, dynamic> _$InlineQueryResultCachedDocumentToJson(
    InlineQueryResultCachedDocument instance) {
  var val = <String, dynamic>{
    'type': _$InlineQueryResultTypeEnumMap[instance.type],
    'id': instance.id,
    'document_file_id': instance.documentFileId,
    'title': instance.title,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('description', instance.description);
  writeNotNull('caption', instance.caption);
  writeNotNull('parse_mode', _$ParseModeEnumMap[instance.parseMode]);
  writeNotNull('reply_markup', instance.replyMarkup);
  writeNotNull('input_message_content', instance.inputMessageContent);
  return val;
}

InlineQueryResultCachedVideo _$InlineQueryResultCachedVideoFromJson(
    Map<String, dynamic> json) {
  return InlineQueryResultCachedVideo(
      json['video_file_id'] as String, json['title'] as String,
      description: json['description'] as String,
      caption: json['caption'] as String,
      parseMode: _$enumDecodeNullable(_$ParseModeEnumMap, json['parse_mode']),
      replyMarkup: json['reply_markup'] == null
          ? null
          : InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      inputMessageContent: json['input_message_content'] == null
          ? null
          : InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>))
    ..type = _$enumDecodeNullable(_$InlineQueryResultTypeEnumMap, json['type'])
    ..id = json['id'] as String;
}

Map<String, dynamic> _$InlineQueryResultCachedVideoToJson(
    InlineQueryResultCachedVideo instance) {
  var val = <String, dynamic>{
    'type': _$InlineQueryResultTypeEnumMap[instance.type],
    'id': instance.id,
    'video_file_id': instance.videoFileId,
    'title': instance.title,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('description', instance.description);
  writeNotNull('caption', instance.caption);
  writeNotNull('parse_mode', _$ParseModeEnumMap[instance.parseMode]);
  writeNotNull('reply_markup', instance.replyMarkup);
  writeNotNull('input_message_content', instance.inputMessageContent);
  return val;
}

InlineQueryResultCachedVoice _$InlineQueryResultCachedVoiceFromJson(
    Map<String, dynamic> json) {
  return InlineQueryResultCachedVoice(
      json['voice_file_id'] as String, json['title'] as String,
      caption: json['caption'] as String,
      parseMode: _$enumDecodeNullable(_$ParseModeEnumMap, json['parse_mode']),
      replyMarkup: json['reply_markup'] == null
          ? null
          : InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      inputMessageContent: json['input_message_content'] == null
          ? null
          : InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>))
    ..type = _$enumDecodeNullable(_$InlineQueryResultTypeEnumMap, json['type'])
    ..id = json['id'] as String;
}

Map<String, dynamic> _$InlineQueryResultCachedVoiceToJson(
    InlineQueryResultCachedVoice instance) {
  var val = <String, dynamic>{
    'type': _$InlineQueryResultTypeEnumMap[instance.type],
    'id': instance.id,
    'voice_file_id': instance.voiceFileId,
    'title': instance.title,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('caption', instance.caption);
  writeNotNull('parse_mode', _$ParseModeEnumMap[instance.parseMode]);
  writeNotNull('reply_markup', instance.replyMarkup);
  writeNotNull('input_message_content', instance.inputMessageContent);
  return val;
}

InlineQueryResultCachedAudio _$InlineQueryResultCachedAudioFromJson(
    Map<String, dynamic> json) {
  return InlineQueryResultCachedAudio(json['audio_file_id'] as String,
      caption: json['caption'] as String,
      parseMode: _$enumDecodeNullable(_$ParseModeEnumMap, json['parse_mode']),
      replyMarkup: json['reply_markup'] == null
          ? null
          : InlineKeyboardMarkup.fromJson(
              json['reply_markup'] as Map<String, dynamic>),
      inputMessageContent: json['input_message_content'] == null
          ? null
          : InputMessageContent.fromJson(
              json['input_message_content'] as Map<String, dynamic>))
    ..type = _$enumDecodeNullable(_$InlineQueryResultTypeEnumMap, json['type'])
    ..id = json['id'] as String;
}

Map<String, dynamic> _$InlineQueryResultCachedAudioToJson(
    InlineQueryResultCachedAudio instance) {
  var val = <String, dynamic>{
    'type': _$InlineQueryResultTypeEnumMap[instance.type],
    'id': instance.id,
    'audio_file_id': instance.audioFileId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('caption', instance.caption);
  writeNotNull('parse_mode', _$ParseModeEnumMap[instance.parseMode]);
  writeNotNull('reply_markup', instance.replyMarkup);
  writeNotNull('input_message_content', instance.inputMessageContent);
  return val;
}

InputMessageContent _$InputMessageContentFromJson(Map<String, dynamic> json) {
  return InputMessageContent();
}

Map<String, dynamic> _$InputMessageContentToJson(
        InputMessageContent instance) =>
    <String, dynamic>{};

InputTextMessageContent _$InputTextMessageContentFromJson(
    Map<String, dynamic> json) {
  return InputTextMessageContent(json['message_text'] as String,
      parseMode: _$enumDecodeNullable(_$ParseModeEnumMap, json['parse_mode']),
      disableWebPagePreview: json['disable_web_page_preview'] as bool);
}

Map<String, dynamic> _$InputTextMessageContentToJson(
    InputTextMessageContent instance) {
  var val = <String, dynamic>{
    'message_text': instance.messageText,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('parse_mode', _$ParseModeEnumMap[instance.parseMode]);
  writeNotNull('disable_web_page_preview', instance.disableWebPagePreview);
  return val;
}

InputLocationMessageContent _$InputLocationMessageContentFromJson(
    Map<String, dynamic> json) {
  return InputLocationMessageContent((json['latitude'] as num)?.toDouble(),
      (json['longitude'] as num)?.toDouble());
}

Map<String, dynamic> _$InputLocationMessageContentToJson(
        InputLocationMessageContent instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude
    };

InputVenueMessageContent _$InputVenueMessageContentFromJson(
    Map<String, dynamic> json) {
  return InputVenueMessageContent(
      (json['latitude'] as num)?.toDouble(),
      (json['longitude'] as num)?.toDouble(),
      json['title'] as String,
      json['address'] as String,
      foursquareId: json['foursquare_id'] as String,
      foursquareType: json['foursquare_type'] as String);
}

Map<String, dynamic> _$InputVenueMessageContentToJson(
    InputVenueMessageContent instance) {
  var val = <String, dynamic>{
    'latitude': instance.latitude,
    'longitude': instance.longitude,
    'title': instance.title,
    'address': instance.address,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('foursquare_id', instance.foursquareId);
  writeNotNull('foursquare_type', instance.foursquareType);
  return val;
}

InputContactMessageContent _$InputContactMessageContentFromJson(
    Map<String, dynamic> json) {
  return InputContactMessageContent(
      json['phone_number'] as String, json['first_name'] as String,
      lastName: json['last_name'] as String, vCard: json['vcard'] as String);
}

Map<String, dynamic> _$InputContactMessageContentToJson(
    InputContactMessageContent instance) {
  var val = <String, dynamic>{
    'phone_number': instance.phoneNumber,
    'first_name': instance.firstName,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('last_name', instance.lastName);
  writeNotNull('vcard', instance.vCard);
  return val;
}

CallbackGame _$CallbackGameFromJson(Map<String, dynamic> json) {
  return CallbackGame();
}

Map<String, dynamic> _$CallbackGameToJson(CallbackGame instance) =>
    <String, dynamic>{};

Game _$GameFromJson(Map<String, dynamic> json) {
  return Game(
      json['title'] as String,
      json['description'] as String,
      (json['photo'] as List)
          ?.map((e) =>
              e == null ? null : PhotoSize.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      text: json['text'] as String,
      textEntities: (json['text_entities'] as List)
          ?.map((e) => e == null
              ? null
              : MessageEntity.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      animation: json['animation'] == null
          ? null
          : Animation.fromJson(json['animation'] as Map<String, dynamic>));
}

Map<String, dynamic> _$GameToJson(Game instance) {
  var val = <String, dynamic>{
    'title': instance.title,
    'description': instance.description,
    'photo': instance.photo,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('text', instance.text);
  writeNotNull('text_entities', instance.textEntities);
  writeNotNull('animation', instance.animation);
  return val;
}

Animation _$AnimationFromJson(Map<String, dynamic> json) {
  return Animation(json['file_id'] as String,
      thumb: json['thumb'] == null
          ? null
          : PhotoSize.fromJson(json['thumb'] as Map<String, dynamic>),
      fileName: json['file_name'] as String,
      mimeType: json['mime_type'] as String,
      fileSize: json['file_size'] as int);
}

Map<String, dynamic> _$AnimationToJson(Animation instance) {
  var val = <String, dynamic>{
    'file_id': instance.fileId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('thumb', instance.thumb);
  writeNotNull('file_name', instance.fileName);
  writeNotNull('mime_type', instance.mimeType);
  writeNotNull('file_size', instance.fileSize);
  return val;
}

GameHighScore _$GameHighScoreFromJson(Map<String, dynamic> json) {
  return GameHighScore(
      json['position'] as int,
      json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      json['score'] as int);
}

Map<String, dynamic> _$GameHighScoreToJson(GameHighScore instance) =>
    <String, dynamic>{
      'position': instance.position,
      'user': instance.user,
      'score': instance.score
    };

Invoice _$InvoiceFromJson(Map<String, dynamic> json) {
  return Invoice(
      json['title'] as String,
      json['description'] as String,
      json['start_parameter'] as String,
      json['currency'] as String,
      json['total_amount'] as int);
}

Map<String, dynamic> _$InvoiceToJson(Invoice instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'start_parameter': instance.startParameter,
      'currency': instance.currency,
      'total_amount': instance.totalAmount
    };

SuccessfulPayment _$SuccessfulPaymentFromJson(Map<String, dynamic> json) {
  return SuccessfulPayment(
      json['currency'] as String,
      json['total_amount'] as int,
      json['invoice_payload'] as String,
      json['telegram_payment_charge_id'] as String,
      json['provider_payment_charge_id'] as String,
      shippingOptionId: json['shipping_option_id'] as String,
      orderInfo: json['order_info'] == null
          ? null
          : OrderInfo.fromJson(json['order_info'] as Map<String, dynamic>));
}

Map<String, dynamic> _$SuccessfulPaymentToJson(SuccessfulPayment instance) {
  var val = <String, dynamic>{
    'currency': instance.currency,
    'total_amount': instance.totalAmount,
    'invoice_payload': instance.invoicePayload,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('shipping_option_id', instance.shippingOptionId);
  writeNotNull('order_info', instance.orderInfo);
  val['telegram_payment_charge_id'] = instance.telegramPaymentChargeId;
  val['provider_payment_charge_id'] = instance.providerPaymentChargeId;
  return val;
}

OrderInfo _$OrderInfoFromJson(Map<String, dynamic> json) {
  return OrderInfo(
      name: json['name'] as String,
      phoneNumber: json['phone_number'] as String,
      email: json['email'] as String,
      shippingAddress: json['shipping_address'] == null
          ? null
          : ShippingAddress.fromJson(
              json['shipping_address'] as Map<String, dynamic>));
}

Map<String, dynamic> _$OrderInfoToJson(OrderInfo instance) {
  var val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('phone_number', instance.phoneNumber);
  writeNotNull('email', instance.email);
  writeNotNull('shipping_address', instance.shippingAddress);
  return val;
}

ShippingOption _$ShippingOptionFromJson(Map<String, dynamic> json) {
  return ShippingOption(
      json['id'] as String,
      json['title'] as String,
      (json['prices'] as List)
          ?.map((e) => e == null
              ? null
              : LabeledPrice.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ShippingOptionToJson(ShippingOption instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'prices': instance.prices
    };

LabeledPrice _$LabeledPriceFromJson(Map<String, dynamic> json) {
  return LabeledPrice(json['label'] as String, json['amount'] as int);
}

Map<String, dynamic> _$LabeledPriceToJson(LabeledPrice instance) =>
    <String, dynamic>{'label': instance.label, 'amount': instance.amount};

ShippingAddress _$ShippingAddressFromJson(Map<String, dynamic> json) {
  return ShippingAddress(
      json['country_code'] as String,
      json['state'] as String,
      json['city'] as String,
      json['street_line1'] as String,
      json['street_line2'] as String,
      json['post_code'] as String);
}

Map<String, dynamic> _$ShippingAddressToJson(ShippingAddress instance) =>
    <String, dynamic>{
      'country_code': instance.countryCode,
      'state': instance.state,
      'city': instance.city,
      'street_line1': instance.streetLine1,
      'street_line2': instance.streetLine2,
      'post_code': instance.postCode
    };
