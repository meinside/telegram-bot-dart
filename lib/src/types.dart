/// Type definitions
///
/// https://core.telegram.org/bots/api#available-types

import 'package:uuid/uuid.dart';

import 'package:json_annotation/json_annotation.dart';

// for generating `./types.g.dart` file:
//
// $ pub run build_runner build
part 'types.g.dart';

/// ChatType enumeration
enum ChatType {
	@JsonValue('private')
	Private,	// 'private'

	@JsonValue('group')
	Group,	// 'group'

	@JsonValue('channel')
	Channel,	// 'channel'
}

/// ParseMode enumeration
enum ParseMode {
	@JsonValue('Markdown')
	Markdown,	// 'Markdown'

	@JsonValue('HTML')
	Html,	// 'HTML'
}

/// ChatAction enumeration
enum ChatAction {
	@JsonValue('typing')
	Typing,	// 'typing'

	@JsonValue('upload_photo')
	UploadPhoto,	// 'upload_photo'

	@JsonValue('record_video')
	RecordVideo,	// 'record_video'

	@JsonValue('upload_video')
	UploadVideo,	// 'upload_video'

	@JsonValue('record_audio')
	RecordAudio,	// 'record_audio'

	@JsonValue('upload_audio')
	UploadAudio,	// 'upload_audio'

	@JsonValue('upload_document')
	UploadDocument,	// 'upload_document'

	@JsonValue('find_location')
	FindLocation,	// 'find_location'

	@JsonValue('record_video_note')
	RecordVideoNote,	// 'record_video_note'

	@JsonValue('upload_video_note')
	UploadVideoNote,	// 'upload_video_note'
}

/// InlineQueryResultType enumeration
enum InlineQueryResultType {
	@JsonValue('article')
	Article,	// 'article'

	@JsonValue('photo')
	Photo,	// 'photo'

	@JsonValue('gif')
	Gif,	// 'gif'

	@JsonValue('mpeg4_gif')
	Mpeg4Gif,	// 'mpeg4_gif'

	@JsonValue('video')
	Video,	// 'video'

	@JsonValue('audio')
	Audio,	// 'audio'

	@JsonValue('voice')
	Voice,	// 'voice'

	@JsonValue('document')
	Document,	// 'document'

	@JsonValue('location')
	Location,	// 'location'

	@JsonValue('venue')
	Venue,	// 'venue'

	@JsonValue('contact')
	Contact,	// 'contact'

	@JsonValue('sticker')
	Sticker,	// 'sticker'

	@JsonValue('game')
	Game,	// 'game'
}

/// MessageEntityType is a type of MessageEntity
//
/// https://core.telegram.org/bots/api#messageentity
enum MessageEntityType {
	@JsonValue('mention')
	Mention,	// 'mention'

	@JsonValue('hashtag')
	Hashtag,	// 'hashtag'

	@JsonValue('cashtag')
	Cashtag,	// 'cashtag'

	@JsonValue('bot_command')
	BotCommand,	// 'bot_command'

	@JsonValue('url')
	Url,	// 'url'

	@JsonValue('email')
	Email,	// 'email'

	@JsonValue('phone_number')
	PhoneNumber,	// 'phone_number'

	@JsonValue('bold')
	Bold,	// 'bold'

	@JsonValue('italic')
	Italic,	// 'italic'

	@JsonValue('code')
	Code,	// 'code'

	@JsonValue('pre')
	Pre,	// 'pre'

	@JsonValue('text_link')
	TextLink,	// 'text_link'

	@JsonValue('text_mention')
	TextMention,	// 'text_mention'
}

/// ChatMemberStatus is a status of chat member
///
/// https://core.telegram.org/bots/api#chatmember
enum ChatMemberStatus {
	@JsonValue('creator')
	Creator,	// 'creator'

	@JsonValue('administrator')
	Administrator,	// 'administrator'

	@JsonValue('member')
	Member,	// 'member'

	@JsonValue('left')
	Left,	// 'left'

	@JsonValue('kicked')
	Kicked,	// 'kicked'
}

/// MaskPositionPoint is a point in MaskPosition
///
/// https://core.telegram.org/bots/api#maskposition
enum MaskPositionPoint {
	@JsonValue('forehead')
	Forehead,	// 'forehead'

	@JsonValue('eyes')
	Eyes,	// 'eyes'

	@JsonValue('mouth')
	Mouth,	// 'mouth'

	@JsonValue('chin')
	Chin,	// 'chin'
}

/// APIResponseParameters is parameters in API responses
///
/// https://core.telegram.org/bots/api#responseparameters
@JsonSerializable()
class APIResponseParameters {
	@JsonKey(name: 'migrate_to_chat_id', includeIfNull: false)
	int migrateToChatId;	// 'migrate_to_chat_id' (optional)

	@JsonKey(name: 'retry_after', includeIfNull: false)
	int retryAfter;	// 'retry_after' (optional)

	// constructor
	APIResponseParameters({this.migrateToChatId, this.retryAfter});

	factory APIResponseParameters.fromJson(Map<String, dynamic> json) => _$APIResponseParametersFromJson(json);

	Map<String, dynamic> toJson() => _$APIResponseParametersToJson(this);
}

/// APIResponse is an API response
@JsonSerializable()
class APIResponse {
	bool ok;	// 'ok'

	@JsonKey(name: 'error_code', includeIfNull: false)
	int errorCode;	// 'error_code' (optional)

	@JsonKey(includeIfNull: false)
	String description;	// 'description' (optional)

	@JsonKey(includeIfNull: false)
	APIResponseParameters parameters;	// 'parameters' (optional)

	// constructor
	APIResponse(this.ok, {this.description, this.parameters});

	factory APIResponse.fromJson(Map<String, dynamic> json) => _$APIResponseFromJson(json);

	Map<String, dynamic> toJson() => _$APIResponseToJson(this);
}

/// APIResponseWebhookInfo is an API response with result type: [WebhookInfo]
@JsonSerializable()
class APIResponseWebhookInfo extends APIResponse {
	@JsonKey(includeIfNull: false)
	WebhookInfo result;	// 'result' (optional)

	// constructor
	APIResponseWebhookInfo(bool ok, {
		String description,
		APIResponseParameters parameters,
		this.result,
	}) : super(ok, description: description, parameters: parameters);

	factory APIResponseWebhookInfo.fromJson(Map<String, dynamic> json) => _$APIResponseWebhookInfoFromJson(json);

	Map<String, dynamic> toJson() => _$APIResponseWebhookInfoToJson(this);
}

/// APIResponseUser is an API response with result type: [User]
@JsonSerializable()
class APIResponseUser extends APIResponse {
	@JsonKey(includeIfNull: false)
	User result;	// 'result' (optional)

	// constructor
	APIResponseUser(bool ok, {
		String description,
		APIResponseParameters parameters,
		this.result,
	}) : super(ok, description: description, parameters: parameters);

	factory APIResponseUser.fromJson(Map<String, dynamic> json) => _$APIResponseUserFromJson(json);

	Map<String, dynamic> toJson() => _$APIResponseUserToJson(this);
}

/// APIResponseMessage is an API response with result type: [Message]
@JsonSerializable()
class APIResponseMessage extends APIResponse {
	@JsonKey(includeIfNull: false)
	Message result;	// 'result' (optional)

	// constructor
	APIResponseMessage(bool ok, {
		String description,
		APIResponseParameters parameters,
		this.result,
	}) : super(ok, description: description, parameters: parameters);

	factory APIResponseMessage.fromJson(Map<String, dynamic> json) => _$APIResponseMessageFromJson(json);

	Map<String, dynamic> toJson() => _$APIResponseMessageToJson(this);
}

/// APIResponseMessages is an API response with result type: List<[Message]>
@JsonSerializable()
class APIResponseMessages extends APIResponse {
	@JsonKey(includeIfNull: false)
	List<Message> result;	// 'result' (optional)

	// constructor
	APIResponseMessages(bool ok, {
		String description,
		APIResponseParameters parameters,
		this.result,
	}) : super(ok, description: description, parameters: parameters);

	factory APIResponseMessages.fromJson(Map<String, dynamic> json) => _$APIResponseMessagesFromJson(json);

	Map<String, dynamic> toJson() => _$APIResponseMessagesToJson(this);
}

/// APIResponseUserProfilePhotos is an API response with result type: [UserProfilePhotos]
@JsonSerializable()
class APIResponseUserProfilePhotos extends APIResponse {
	@JsonKey(includeIfNull: false)
	UserProfilePhotos result;	// 'result' (optional)

	// constructor
	APIResponseUserProfilePhotos(bool ok, {
		String description,
		APIResponseParameters parameters,
		this.result,
	}) : super(ok, description: description, parameters: parameters);

	factory APIResponseUserProfilePhotos.fromJson(Map<String, dynamic> json) => _$APIResponseUserProfilePhotosFromJson(json);

	Map<String, dynamic> toJson() => _$APIResponseUserProfilePhotosToJson(this);
}

/// APIResponseFile is an API response with result type: [FileObject]
@JsonSerializable()
class APIResponseFile extends APIResponse {
	@JsonKey(includeIfNull: false)
	FileObject result;	// 'result' (optional)

	// constructor
	APIResponseFile(bool ok, {
		String description,
		APIResponseParameters parameters,
		this.result,
	}) : super(ok, description: description, parameters: parameters);

	factory APIResponseFile.fromJson(Map<String, dynamic> json) => _$APIResponseFileFromJson(json);

	Map<String, dynamic> toJson() => _$APIResponseFileToJson(this);
}

/// APIResponseUpdates is an API response with result type [Update]
@JsonSerializable()
class APIResponseUpdates extends APIResponse {
	List<Update> result;	// 'result'

	// constructor
	APIResponseUpdates(bool ok, {
		String description,
		APIResponseParameters parameters,
		this.result,
	}) : super(ok, description: description, parameters: parameters);

	factory APIResponseUpdates.fromJson(Map<String, dynamic> json) => _$APIResponseUpdatesFromJson(json);

	Map<String, dynamic> toJson() => _$APIResponseUpdatesToJson(this);
}

/// APIResponseChat is an API response with result type: [Chat]
@JsonSerializable()
class APIResponseChat extends APIResponse {
	@JsonKey(includeIfNull: false)
	Chat result;	// 'result' (optional)

	// constructor
	APIResponseChat(bool ok, {
		String description,
		APIResponseParameters parameters,
		this.result,
	}) : super(ok, description: description, parameters: parameters);

	factory APIResponseChat.fromJson(Map<String, dynamic> json) => _$APIResponseChatFromJson(json);

	Map<String, dynamic> toJson() => _$APIResponseChatToJson(this);
}

/// APIResponseChatAdministrators is an API response with result type: List<[ChatMember]>
@JsonSerializable()
class APIResponseChatAdministrators extends APIResponse {
	@JsonKey(includeIfNull: false)
	List<ChatMember> result;	// 'result' (optional)

	// constructor
	APIResponseChatAdministrators(bool ok, {
		String description,
		APIResponseParameters parameters,
		this.result,
	}) : super(ok, description: description, parameters: parameters);

	factory APIResponseChatAdministrators.fromJson(Map<String, dynamic> json) => _$APIResponseChatAdministratorsFromJson(json);

	Map<String, dynamic> toJson() => _$APIResponseChatAdministratorsToJson(this);
}

/// APIResponseChatMember is an API response with result type: [ChatMember]
@JsonSerializable()
class APIResponseChatMember extends APIResponse {
	@JsonKey(includeIfNull: false)
	ChatMember result;	// 'result' (optional)

	// constructor
	APIResponseChatMember(bool ok, {
		String description,
		APIResponseParameters parameters,
		this.result,
	}) : super(ok, description: description, parameters: parameters);

	factory APIResponseChatMember.fromJson(Map<String, dynamic> json) => _$APIResponseChatMemberFromJson(json);

	Map<String, dynamic> toJson() => _$APIResponseChatMemberToJson(this);
}

/// APIResponseInt is an API response with result type: int
@JsonSerializable()
class APIResponseInt extends APIResponse {
	@JsonKey(includeIfNull: false)
	int result;	// 'result' (optional)

	// constructor
	APIResponseInt(bool ok, {
		String description,
		APIResponseParameters parameters,
		this.result,
	}) : super(ok, description: description, parameters: parameters);

	factory APIResponseInt.fromJson(Map<String, dynamic> json) => _$APIResponseIntFromJson(json);

	Map<String, dynamic> toJson() => _$APIResponseIntToJson(this);
}

/// APIResponseString is an API response with result type: String
@JsonSerializable()
class APIResponseString extends APIResponse {
	@JsonKey(includeIfNull: false)
	String result;	// 'result' (optional)

	// constructor
	APIResponseString(bool ok, {
		String description,
		APIResponseParameters parameters,
		this.result,
	}) : super(ok, description: description, parameters: parameters);

	factory APIResponseString.fromJson(Map<String, dynamic> json) => _$APIResponseStringFromJson(json);

	Map<String, dynamic> toJson() => _$APIResponseStringToJson(this);
}

/// APIResponseGameHighScores is an API response with result type: List<[GameHighScore]>
@JsonSerializable()
class APIResponseGameHighScores extends APIResponse {
	@JsonKey(includeIfNull: false)
	List<GameHighScore> result;	// 'result' (optional)

	// constructor
	APIResponseGameHighScores(bool ok, {
		String description,
		APIResponseParameters parameters,
		this.result,
	}) : super(ok, description: description, parameters: parameters);

	factory APIResponseGameHighScores.fromJson(Map<String, dynamic> json) => _$APIResponseGameHighScoresFromJson(json);

	Map<String, dynamic> toJson() => _$APIResponseGameHighScoresToJson(this);
}

/// APIResponseStickerSet is an API response with result type: [StickerSet]
@JsonSerializable()
class APIResponseStickerSet extends APIResponse {
	@JsonKey(includeIfNull: false)
	StickerSet result;	// 'result' (optional)

	// constructor
	APIResponseStickerSet(bool ok, {
		String description,
		APIResponseParameters parameters,
		this.result,
	}) : super(ok, description: description, parameters: parameters);

	factory APIResponseStickerSet.fromJson(Map<String, dynamic> json) => _$APIResponseStickerSetFromJson(json);

	Map<String, dynamic> toJson() => _$APIResponseStickerSetToJson(this);
}

/// UpdateType is a type of updates (for allowed_updates)
///
/// https://core.telegram.org/bots/api#setwebhook
/// https://core.telegram.org/bots/api#update
enum UpdateType {
	@JsonValue('message')
	Message,

	@JsonValue('edited_message')
	EditedMessage,

	@JsonValue('channel_post')
	ChannelPost,

	@JsonValue('edited_channel_post')
	EditedChannelPost,

	@JsonValue('inline_query')
	InlineQuery,

	@JsonValue('chosen_inline_result')
	ChosenInlineResult,

	@JsonValue('callback_query')
	CallbackQuery,
}

/// WebhookInfo is a struct of webhook info
///
/// https://core.telegram.org/bots/api#webhookinfo
@JsonSerializable()
class WebhookInfo {
	String url;	// 'url'

	@JsonKey(name: 'has_custom_certificate')
	bool hasCustomCertificate;	// 'has_custom_certificate'

	@JsonKey(name: 'pending_update_count')
	int pendingUpdateCount;	// 'pending_update_count'

	@JsonKey(name: 'last_error_date', includeIfNull: false)
	int lastErrorDate;	// 'last_error_date' (optional)

	@JsonKey(name: 'last_error_message', includeIfNull: false)
	String lastErrorMessage;	// 'last_error_message' (optional)

	@JsonKey(name: 'max_connections', includeIfNull: false)
	int maxConnections;	// 'max_connections' (optional)

	@JsonKey(name: 'allowed_updates', includeIfNull: false)
	List<UpdateType> allowedUpdates;	// 'allowed_updates' (optional)

	// constructor
	WebhookInfo(this.url, this.hasCustomCertificate, this.pendingUpdateCount, {
		this.lastErrorDate,
		this.lastErrorMessage,
		this.maxConnections,
		this.allowedUpdates,
	});

	factory WebhookInfo.fromJson(Map<String, dynamic> json) => _$WebhookInfoFromJson(json);

	Map<String, dynamic> toJson() => _$WebhookInfoToJson(this);
}

/// Update is a struct of an update
///
/// https://core.telegram.org/bots/api#update
@JsonSerializable()
class Update {
	@JsonKey(name: 'update_id')
	int updateId;	// 'update_id'

	@JsonKey(includeIfNull: false)
	Message message;	// 'message' (optional)

	@JsonKey(name: 'edited_message', includeIfNull: false)
	Message editedMessage;	// 'edited_message' (optional)

	@JsonKey(name: 'channel_post', includeIfNull: false)
	Message channelPost;	// 'channel_post' (optional)

	@JsonKey(name: 'edited_channel_post', includeIfNull: false)
	Message editedChannelPost;	// 'edited_channel_post' (optional)

	@JsonKey(name: 'inline_query', includeIfNull: false)
	InlineQuery inlineQuery;	// 'inline_query' (optional)

	@JsonKey(name: 'chosen_inline_result', includeIfNull: false)
	ChosenInlineResult chosenInlineResult;	// 'chosen_inline_result' (optional)

	@JsonKey(name: 'callback_query', includeIfNull: false)
	CallbackQuery callbackQuery;	// 'callback_query' (optional)

	@JsonKey(name: 'shipping_query', includeIfNull: false)
	ShippingQuery shippingQuery;	// 'shipping_query' (optional)

	@JsonKey(name: 'pre_checkout_query', includeIfNull: false)
	PreCheckoutQuery preCheckoutQuery;	// 'pre_checkout_query' (optional)

	// constructor
	Update(this.updateId, {
		this.message,
		this.editedMessage,
		this.channelPost,
		this.editedChannelPost,
		this.inlineQuery,
		this.chosenInlineResult,
		this.callbackQuery,
		this.shippingQuery,
		this.preCheckoutQuery,
	});

	factory Update.fromJson(Map<String, dynamic> json) => _$UpdateFromJson(json);

	Map<String, dynamic> toJson() => _$UpdateToJson(this);
}

/// User is a struct of a user
///
/// https://core.telegram.org/bots/api#user
@JsonSerializable()
class User {
	int id;	// 'id'

	@JsonKey(name: 'is_bot')
	bool isBot;	// 'is_bot'

	@JsonKey(name: 'first_name')
	String firstName;	// 'first_name'

	@JsonKey(name: 'last_name', includeIfNull: false)
	String lastName;	// 'last_name' (optional)

	@JsonKey(includeIfNull: false)
	String username;	// 'username' (optional)

	@JsonKey(name: 'language_code', includeIfNull: false)
	String languageCode;	// 'language_code' (optional) // https://en.wikipedia.org/wiki/IETF_language_tag

	// constructor
	User(this.id, this.isBot, {
		this.lastName,
		this.username,
		this.languageCode,
	});

	/// generate an inline link for this User
	String inlineLink() {
		return "tg://user?id=${id}";
	}

	factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

	Map<String, dynamic> toJson() => _$UserToJson(this);
}

/// Chat is a struct of a chat
///
/// https://core.telegram.org/bots/api#chat
@JsonSerializable()
class Chat {
	int id;	// 'id'

	ChatType type;	// 'type'

	@JsonKey(includeIfNull: false)
	String title;	// 'title' (optional)

	@JsonKey(includeIfNull: false)
	String username;	// 'username' (optional)

	@JsonKey(name: 'first_name', includeIfNull: false)
	String firstName;	// 'first_name' (optional)

	@JsonKey(name: 'last_name', includeIfNull: false)
	String lastName;	// 'last_name' (optional)

	@JsonKey(name: 'all_members_are_administrators', includeIfNull: false)
	bool allMembersAreAdministrators;	// 'all_members_are_administrators' (optional)

	@JsonKey(includeIfNull: false)
	ChatPhoto photo;	// 'photo' (optional)

	@JsonKey(includeIfNull: false)
	String description;	// 'description' (optional)

	@JsonKey(name: 'invite_link', includeIfNull: false)
	String inviteLink;	// 'invite_link' (optional)

	@JsonKey(name: 'pinned_message', includeIfNull: false)
	Message pinnedMessage;	// 'pinned_message' (optional)

	@JsonKey(name: 'sticker_set_name', includeIfNull: false)
	String stickerSetName;	// 'sticker_set_name' (optional)

	@JsonKey(name: 'can_set_sticker_set', includeIfNull: false)
	bool canSetStickerSet;	// 'can_set_sticker_set' (optional)

	// constructor
	Chat(this.id, this.type, {
		this.title,
		this.username,
		this.firstName,
		this.lastName,
		this.allMembersAreAdministrators,
		this.photo,
		this.description,
		this.inviteLink,
		this.pinnedMessage,
		this.stickerSetName,
		this.canSetStickerSet,
	});

	factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);

	Map<String, dynamic> toJson() => _$ChatToJson(this);
}

/// InputMediaType is a type of InputMedia
enum InputMediaType {
	@JsonValue('animation')
	Animation,

	@JsonValue('document')
	Document,

	@JsonValue('audio')
	Audio,

	@JsonValue('photo')
	Photo,

	@JsonValue('video')
	Video,
}

/// InputMedia represents the content of a media message to be sent.
///
/// It is a base struct of [InputMediaAnimation], [InputMediaDocument], [InputMediaAudio], [InputMediaPhoto], and [InputMediaVideo].
///
/// https://core.telegram.org/bots/api#inputmedia
@JsonSerializable()
class InputMedia {
	InputMediaType type;	// 'type'

	// url or file_id
	String media;	// 'media'

	@JsonKey(ignore: true)
	InputFile mediaAttachment;	// actual attachment for `media`

	@JsonKey(ignore: true)
	String mediaAttachmentKey;	// parameter key for the attachment

	// constructors
	InputMedia(this.type, this.media);
	InputMedia.fromFilepath(this.type, String filepath) {
		mediaAttachmentKey = "media_attachment_filepath";
		media = "attach://${mediaAttachmentKey}";
		mediaAttachment = InputFile.fromFilepath(filepath);
	}
	InputMedia.fromBytes(this.type, List<int> bytes) {
		mediaAttachmentKey = "media_attachment_bytes";
		media = "attach://${mediaAttachmentKey}";
		mediaAttachment = InputFile.fromBytes(bytes);
	}

	factory InputMedia.fromJson(Map<String, dynamic> json) => _$InputMediaFromJson(json);

	Map<String, dynamic> toJson() => _$InputMediaToJson(this);
}

/// InputMediaAnimation is an animation type of [InputMedia].
///
/// https://core.telegram.org/bots/api#inputmediaanimation
@JsonSerializable()
class InputMediaAnimation extends InputMedia {
	@JsonKey(includeIfNull: false)
	String caption;	// 'caption' (optional)

	@JsonKey(name: 'parse_mode', includeIfNull: false)
	ParseMode parseMode;	// 'parse_mode' (optional)

	// constructors
	InputMediaAnimation(String media, {
		this.caption,
		this.parseMode,
	}): super(InputMediaType.Animation, media);
	InputMediaAnimation.fromFilepath(String filepath, {
		this.caption,
		this.parseMode,
	}): super.fromFilepath(InputMediaType.Animation, filepath);
	InputMediaAnimation.fromBytes(List<int> bytes, {
		this.caption,
		this.parseMode,
	}): super.fromBytes(InputMediaType.Animation, bytes);

	factory InputMediaAnimation.fromJson(Map<String, dynamic> json) => _$InputMediaAnimationFromJson(json);

	Map<String, dynamic> toJson() => _$InputMediaAnimationToJson(this);
}

/// InputMediaDocument is a document type of [InputMedia].
///
/// https://core.telegram.org/bots/api#inputmediadocument
@JsonSerializable()
class InputMediaDocument extends InputMedia {
	@JsonKey(includeIfNull: false)
	InputFile thumb;	// 'thumb' (optional)

	@JsonKey(includeIfNull: false)
	String caption;	// 'caption' (optional)

	@JsonKey(name: 'parse_mode', includeIfNull: false)
	ParseMode parseMode;	// 'parse_mode' (optional)

	// constructors
	InputMediaDocument(String media, {
		this.thumb,
		this.caption,
		this.parseMode,
	}): super(InputMediaType.Document, media);
	InputMediaDocument.fromFilepath(String filepath, {
		this.thumb,
		this.caption,
		this.parseMode,
	}): super.fromFilepath(InputMediaType.Document, filepath);
	InputMediaDocument.fromBytes(List<int> bytes, {
		this.thumb,
		this.caption,
		this.parseMode,
	}): super.fromBytes(InputMediaType.Document, bytes);

	factory InputMediaDocument.fromJson(Map<String, dynamic> json) => _$InputMediaDocumentFromJson(json);

	Map<String, dynamic> toJson() => _$InputMediaDocumentToJson(this);
}

/// InputMediaAudio is an audio type of [InputMedia].
///
/// https://core.telegram.org/bots/api#inputmediaaudio
@JsonSerializable()
class InputMediaAudio extends InputMedia {
	@JsonKey(includeIfNull: false)
	InputFile thumb;	// 'thumb' (optional)

	@JsonKey(includeIfNull: false)
	String caption;	// 'caption' (optional)

	@JsonKey(name: 'parse_mode', includeIfNull: false)
	ParseMode parseMode;	// 'parse_mode' (optional)

	@JsonKey(includeIfNull: false)
	int duration;	// 'duration' (optional)

	@JsonKey(includeIfNull: false)
	String performer;	// 'performer' (optional)

	@JsonKey(includeIfNull: false)
	String title;	// 'title' (optional)

	// constructors
	InputMediaAudio(String media, {
		this.thumb,
		this.caption,
		this.parseMode,
		this.duration,
		this.performer,
		this.title,
	}): super(InputMediaType.Audio, media);
	InputMediaAudio.fromFilepath(String filepath, {
		this.thumb,
		this.caption,
		this.parseMode,
		this.duration,
		this.performer,
		this.title,
	}): super.fromFilepath(InputMediaType.Audio, filepath);
	InputMediaAudio.fromBytes(List<int> bytes, {
		this.thumb,
		this.caption,
		this.parseMode,
		this.duration,
		this.performer,
		this.title,
	}): super.fromBytes(InputMediaType.Audio, bytes);

	factory InputMediaAudio.fromJson(Map<String, dynamic> json) => _$InputMediaAudioFromJson(json);

	Map<String, dynamic> toJson() => _$InputMediaAudioToJson(this);
}

/// InputMediaPhoto is a photo type of [InputMedia].
///
/// https://core.telegram.org/bots/api#inputmediaphoto
@JsonSerializable()
class InputMediaPhoto extends InputMedia {
	@JsonKey(includeIfNull: false)
	String caption;	// 'caption' (optional)

	@JsonKey(name: 'parse_mode', includeIfNull: false)
	ParseMode parseMode;	// 'parse_mode' (optional)

	// constructors
	InputMediaPhoto(String media, {
		this.caption,
		this.parseMode,
	}): super(InputMediaType.Photo, media);
	InputMediaPhoto.fromFilepath(String filepath, {
		this.caption,
		this.parseMode,
	}): super.fromFilepath(InputMediaType.Photo, filepath);
	InputMediaPhoto.fromBytes(List<int> bytes, {
		this.caption,
		this.parseMode,
	}): super.fromBytes(InputMediaType.Photo, bytes);

	factory InputMediaPhoto.fromJson(Map<String, dynamic> json) => _$InputMediaPhotoFromJson(json);

	Map<String, dynamic> toJson() => _$InputMediaPhotoToJson(this);
}

/// InputMediaVideo is a video type of [InputMedia].
///
/// https://core.telegram.org/bots/api#inputmediavideo
@JsonSerializable()
class InputMediaVideo extends InputMedia {
	@JsonKey(includeIfNull: false)
	InputFile thumb;	// 'thumb' (optional)

	@JsonKey(includeIfNull: false)
	String caption;	// 'caption' (optional)

	@JsonKey(name: 'parse_mode', includeIfNull: false)
	ParseMode parseMode;	// 'parse_mode' (optional)

	@JsonKey(includeIfNull: false)
	int width;	// 'width' (optional)

	@JsonKey(includeIfNull: false)
	int height;	// 'height' (optional)

	@JsonKey(includeIfNull: false)
	int duration;	// 'duration' (optional)

	@JsonKey(name: 'supports_streaming', includeIfNull: false)
	bool supportsStreaming;

	// constructors
	InputMediaVideo(String media, {
		this.thumb,
		this.caption,
		this.parseMode,
		this.width,
		this.height,
		this.duration,
		this.supportsStreaming,
	}): super(InputMediaType.Video, media);
	InputMediaVideo.fromFilepath(String filepath, {
		this.thumb,
		this.caption,
		this.parseMode,
		this.width,
		this.height,
		this.duration,
		this.supportsStreaming,
	}): super.fromFilepath(InputMediaType.Video, filepath);
	InputMediaVideo.fromBytes(List<int> bytes, {
		this.thumb,
		this.caption,
		this.parseMode,
		this.width,
		this.height,
		this.duration,
		this.supportsStreaming,
	}): super.fromBytes(InputMediaType.Video, bytes);

	factory InputMediaVideo.fromJson(Map<String, dynamic> json) => _$InputMediaVideoFromJson(json);

	Map<String, dynamic> toJson() => _$InputMediaVideoToJson(this);
}

/// InputFile represents contents of a file to be uploaded.
///
/// https://core.telegram.org/bots/api#inputfile
@JsonSerializable()
class InputFile {
	String filepath;

	String url;

	List<int> bytes;

	@JsonKey(name: 'file_id')
	String fileId;

	// constructor
	InputFile({
		this.filepath,
		this.url,
		this.bytes,
		this.fileId,
	});

	/// generate an [InputFile] from given [filepath].
	static InputFile fromFilepath(String filepath) {
		return new InputFile(filepath: filepath);
	}

	/// generate an [InputFile] from given [url].
	static InputFile fromUrl(String url) {
		return new InputFile(url: url);
	}

	/// generate an [InputFile] from given [bytes]
	static InputFile fromBytes(List<int> bytes) {
		return new InputFile(bytes: bytes);
	}

	/// generate an [InputFile] from given [fileId]
	static InputFile fromFileId(String fileId) {
		return new InputFile(fileId: fileId);
	}

	@override
	String toString() {
		if (url != null) {
			return url;
		} else if (fileId != null) {
			return fileId;
		}

		return "InputFile{filepath: ${filepath}, url: ${url}, bytes: ${bytes}, fileId: ${fileId}}";
	}

	factory InputFile.fromJson(Map<String, dynamic> json) => _$InputFileFromJson(json);

	Map<String, dynamic> toJson() => _$InputFileToJson(this);
}

/// Audio is a struct for an audio file
///
/// https://core.telegram.org/bots/api#audio
@JsonSerializable()
class Audio {
	@JsonKey(name: 'file_id')
	String fileId;	// 'file_id'

	int duration;	// 'duration'

	@JsonKey(includeIfNull: false)
	String performer;	// 'performer' (optional)

	@JsonKey(includeIfNull: false)
	String title;	// 'title' (optional)

	@JsonKey(name: 'mime_type', includeIfNull: false)
	String mimeType;	// 'mime_type' (optional)

	@JsonKey(name: 'file_size', includeIfNull: false)
	int fileSize;	// 'file_size' (optional)

	@JsonKey(includeIfNull: false)
	PhotoSize thumb;	// 'thumb' (optional)

	// constructor
	Audio(this.fileId, this.duration, {
		this.performer,
		this.title,
		this.mimeType,
		this.fileSize,
		this.thumb,
	});

	factory Audio.fromJson(Map<String, dynamic> json) => _$AudioFromJson(json);

	Map<String, dynamic> toJson() => _$AudioToJson(this);
}

/// MessageEntity is a struct of a message entity
///
/// https://core.telegram.org/bots/api#messageentity
@JsonSerializable()
class MessageEntity {
	MessageEntityType type;	// 'type'

	int offset;	// 'offset'

	int length;	// 'length'

	@JsonKey(includeIfNull: false)
	String url;	// 'url' (optional) - for type == 'text_link' only

	@JsonKey(includeIfNull: false)
	User user;	// 'user' (optional) - for type == 'text_mention' only

	// constructor
	MessageEntity(this.type, this.offset, this.length, {
		this.url,
		this.user,
	});

	factory MessageEntity.fromJson(Map<String, dynamic> json) => _$MessageEntityFromJson(json);

	Map<String, dynamic> toJson() => _$MessageEntityToJson(this);
}

/// PhotoSize is a struct of a photo's size
///
/// https://core.telegram.org/bots/api#photosize
@JsonSerializable()
class PhotoSize {
	@JsonKey(name: 'file_id')
	String fileId;	// 'file_id'

	int width;	// 'width'

	int height;	// 'height'

	@JsonKey(name: 'file_size', includeIfNull: false)
	int fileSize;	// 'file_size' (optional)

	// constructor
	PhotoSize(this.fileId, this.width, this.height, {
		this.fileSize,
	});

	factory PhotoSize.fromJson(Map<String, dynamic> json) => _$PhotoSizeFromJson(json);

	Map<String, dynamic> toJson() => _$PhotoSizeToJson(this);
}

/// Document is a struct for an ordinary file
///
/// https://core.telegram.org/bots/api#document
@JsonSerializable()
class Document {
	@JsonKey(name: 'file_id')
	String fileId;	// 'file_id'

	@JsonKey(includeIfNull: false)
	PhotoSize thumb;	// 'thumb' (optional)

	@JsonKey(name: 'file_name', includeIfNull: false)
	String fileName;	// 'file_name' (optional)

	@JsonKey(name: 'mime_type', includeIfNull: false)
	String mimeType;	// 'mime_type' (optional)

	@JsonKey(name: 'file_size', includeIfNull: false)
	int fileSize;	// 'file_size' (optional)

	// constructor
	Document(this.fileId, {
		this.thumb,
		this.fileName,
		this.mimeType,
		this.fileSize,
	});

	factory Document.fromJson(Map<String, dynamic> json) => _$DocumentFromJson(json);

	Map<String, dynamic> toJson() => _$DocumentToJson(this);
}

/// Sticker is a struct of a sticker
///
/// https://core.telegram.org/bots/api#sticker
@JsonSerializable()
class Sticker {
	@JsonKey(name: 'file_id')
	String fileId;	// 'file_id'

	int width;	// 'width'

	int height;	// 'height'

	@JsonKey(includeIfNull: false)
	PhotoSize thumb;	// 'thumb' (optional)

	@JsonKey(includeIfNull: false)
	String emoji;	// 'emoji' (optional)

	@JsonKey(name: 'set_name', includeIfNull: false)
	String setName;	// 'set_name' (optional)

	@JsonKey(name: 'mask_position', includeIfNull: false)
	MaskPosition maskPosition;	// 'mask_position' (optional)

	@JsonKey(name: 'file_size', includeIfNull: false)
	int fileSize;	// 'file_size' (optional)

	// constructor
	Sticker(this.fileId, this.width, this.height, {
		this.thumb,
		this.emoji,
		this.setName,
		this.maskPosition,
		this.fileSize,
	});

	factory Sticker.fromJson(Map<String, dynamic> json) => _$StickerFromJson(json);

	Map<String, dynamic> toJson() => _$StickerToJson(this);
}

/// StickerSet is a struct of a sticker set
///
/// https://core.telegram.org/bots/api#stickerset
@JsonSerializable()
class StickerSet {
	String name;	// 'name'

	String title;	// 'title'

	@JsonKey(name: 'contains_masks')
	bool containsMasks;	// 'contains_masks'

	List<Sticker> stickers;	// 'stickers'

	// constructor
	StickerSet(this.name, this.title, this.containsMasks, this.stickers);

	factory StickerSet.fromJson(Map<String, dynamic> json) => _$StickerSetFromJson(json);

	Map<String, dynamic> toJson() => _$StickerSetToJson(this);
}

/// MaskPosition is a struct for a mask position
///
/// https://core.telegram.org/bots/api#maskposition
@JsonSerializable()
class MaskPosition {
	MaskPositionPoint point;	// 'point'

	@JsonKey(name: 'x_shift')
	double xShift;	// 'x_shift'

	@JsonKey(name: 'y_shift')
	double yShift;	// 'y_shift'

	double scale;	// 'scale'

	// constructor
	MaskPosition(this.point, this.xShift, this.yShift, this.scale);

	factory MaskPosition.fromJson(Map<String, dynamic> json) => _$MaskPositionFromJson(json);

	Map<String, dynamic> toJson() => _$MaskPositionToJson(this);
}

/// Video is a struct for a video file
///
/// https://core.telegram.org/bots/api#video
@JsonSerializable()
class Video {
	@JsonKey(name: 'file_id')
	String fileId;	// 'file_id'

	int width;	// 'width'

	int height;	// 'height'

	int duration;	// 'duration'

	@JsonKey(includeIfNull: false)
	PhotoSize thumb;	// 'thumb' (optional)

	@JsonKey(name: 'mime_type', includeIfNull: false)
	String mimeType;	// 'mime_type' (optional)

	@JsonKey(name: 'file_size', includeIfNull: false)
	int fileSize;	// 'file_size' (optional)

	// constructor
	Video(this.fileId, this.width, this.height, this.duration, {
		this.thumb,
		this.mimeType,
		this.fileSize,
	});

	factory Video.fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);

	Map<String, dynamic> toJson() => _$VideoToJson(this);
}

/// Voice is a struct for a voice file
///
/// https://core.telegram.org/bots/api#voice
@JsonSerializable()
class Voice {
	@JsonKey(name: 'file_id')
	String fileId;	// 'file_id'

	int duration;	// 'duration'

	@JsonKey(name: 'mime_type', includeIfNull: false)
	String mimeType;	// 'mime_type' (optional)

	@JsonKey(name: 'file_size', includeIfNull: false)
	int fileSize;	// 'file_size' (optional)

	// constructor
	Voice(this.fileId, this.duration, {
		this.mimeType,
		this.fileSize,
	});

	factory Voice.fromJson(Map<String, dynamic> json) => _$VoiceFromJson(json);

	Map<String, dynamic> toJson() => _$VoiceToJson(this);
}

/// VideoNote is a struct for a video note
///
/// https://core.telegram.org/bots/api#videonote
@JsonSerializable()
class VideoNote {
	@JsonKey(name: 'file_id')
	String fileId;	// 'file_id'

	int length;	// 'length'

	int duration;	// 'duration'

	@JsonKey(includeIfNull: false)
	PhotoSize thumb;	// 'thumb' (optional)

	@JsonKey(name: 'file_size', includeIfNull: false)
	int fileSize;	// 'file_size' (optional)

	// constructor
	VideoNote(this.fileId, this.length, this.duration, {
		this.thumb,
		this.fileSize,
	});

	factory VideoNote.fromJson(Map<String, dynamic> json) => _$VideoNoteFromJson(json);

	Map<String, dynamic> toJson() => _$VideoNoteToJson(this);
}

/// Contact is a struct for a contact info
///
/// https://core.telegram.org/bots/api#contact
@JsonSerializable()
class Contact {
	@JsonKey(name: 'phone_number')
	String phoneNumber;	// 'phone_number'

	@JsonKey(name: 'first_name')
	String firstName;	// 'first_name'

	@JsonKey(name: 'last_name', includeIfNull: false)
	String lastName;	// 'last_name' (optional)

	@JsonKey(name: 'user_id', includeIfNull: false)
	int userId;	// 'user_id' (optional)

	@JsonKey(name: 'vcard', includeIfNull: false)
	String vCard;	// 'vcard' (optional)	- https://en.wikipedia.org/wiki/VCard

	// constructor
	Contact(this.phoneNumber, this.firstName, {
		this.lastName,
		this.userId,
		this.vCard,
	});

	factory Contact.fromJson(Map<String, dynamic> json) => _$ContactFromJson(json);

	Map<String, dynamic> toJson() => _$ContactToJson(this);
}

/// Location is a struct for a location
///
/// https://core.telegram.org/bots/api#location
@JsonSerializable()
class Location {
	double longitude;	// 'longitude'

	double latitude;	// 'latitude'

	// constructor
	Location(this.longitude, this.latitude);

	factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);

	Map<String, dynamic> toJson() => _$LocationToJson(this);
}

/// Venue is a struct of a venue
///
/// https://core.telegram.org/bots/api#venue
@JsonSerializable()
class Venue {
	Location location;	// 'location'

	String title;	// 'title'

	String address;	// 'address'

	@JsonKey(name: 'foursquare_id', includeIfNull: false)
	String foursquareId;	// 'foursquare_id' (optional)

	@JsonKey(name: 'foursquare_type', includeIfNull: false)
	String foursquareType;	// 'foursquare_type' (optional)

	// constructor
	Venue(this.location, this.title, this.address, {
		this.foursquareId,
		this.foursquareType,
	});

	factory Venue.fromJson(Map<String, dynamic> json) => _$VenueFromJson(json);

	Map<String, dynamic> toJson() => _$VenueToJson(this);
}

/// UserProfilePhotos is a struct for user profile photos
///
/// https://core.telegram.org/bots/api#userprofilephotos
@JsonSerializable()
class UserProfilePhotos {
	@JsonKey(name: 'total_count')
	int totalCount;	// 'total_count'

	List<List<PhotoSize>> photos;	// 'photos'

	// constructor
	UserProfilePhotos(this.totalCount, this.photos);

	factory UserProfilePhotos.fromJson(Map<String, dynamic> json) => _$UserProfilePhotosFromJson(json);

	Map<String, dynamic> toJson() => _$UserProfilePhotosToJson(this);
}

/// FileObject is a struct for a file
///
/// https://core.telegram.org/bots/api#file
@JsonSerializable()
class FileObject {
	@JsonKey(name: 'file_id')
	String fileId;	// 'file_id'

	@JsonKey(name: 'file_size', includeIfNull: false)
	int fileSize;	// 'file_size' (optional)

	@JsonKey(name: 'file_path', includeIfNull: false)
	String filePath;	// 'file_path' (optional)

	// constructor
	FileObject(this.fileId, {
		this.fileSize,
		this.filePath,
	});

	factory FileObject.fromJson(Map<String, dynamic> json) => _$FileObjectFromJson(json);

	Map<String, dynamic> toJson() => _$FileObjectToJson(this);
}

/// ReplyMarkup is a base struct of [InlineKeyboardMarkup], [ReplyKeyboardMarkup], [ReplyKeyboardRemove], and [ForceReply].
@JsonSerializable()
class ReplyMarkup {
	// constructor
	ReplyMarkup();

	factory ReplyMarkup.fromJson(Map<String, dynamic> json) => _$ReplyMarkupFromJson(json);

	Map<String, dynamic> toJson() => _$ReplyMarkupToJson(this);
}

/// ReplyKeyboardMarkup is a struct for reply keyboard markups
///
/// https://core.telegram.org/bots/api#replykeyboardmarkup
@JsonSerializable()
class ReplyKeyboardMarkup extends ReplyMarkup {
	List<List<KeyboardButton>> keyboard;	// 'keyboard'

	@JsonKey(name: 'resize_keyboard', includeIfNull: false)
	bool resizeKeyboard;	// 'resize_keyboard' (optional)

	@JsonKey(name: 'one_time_keyboard', includeIfNull: false)
	bool oneTimeKeyboard;	// 'one_time_keyboard' (optional)

	@JsonKey(includeIfNull: false)
	bool selective;	// 'selective' (optional)

	// constructor
	ReplyKeyboardMarkup(this.keyboard, {
		this.resizeKeyboard,
		this.oneTimeKeyboard,
		this.selective,
	});

	factory ReplyKeyboardMarkup.fromJson(Map<String, dynamic> json) => _$ReplyKeyboardMarkupFromJson(json);

	Map<String, dynamic> toJson() => _$ReplyKeyboardMarkupToJson(this);
}

/// KeyboardButton is a struct of a keyboard button
///
/// https://core.telegram.org/bots/api#keyboardbutton
@JsonSerializable()
class KeyboardButton {
	String text;	// 'text'

	@JsonKey(name: 'request_contact', includeIfNull: false)
	bool requestContact;	// 'request_contact' (optional)

	@JsonKey(name: 'request_location', includeIfNull: false)
	bool requestLocation;	// 'request_location' (optional)

	// constructor
	KeyboardButton(this.text, {
		this.requestContact,
		this.requestLocation,
	});

	// helper function for generating an array of KeyboardButton
	List<KeyboardButton> create(List<String> texts) {
		List<KeyboardButton> buttons = new List<KeyboardButton>();
		texts.forEach((text) {
			buttons.add(new KeyboardButton(text));
		});
		return buttons;
	}

	factory KeyboardButton.fromJson(Map<String, dynamic> json) => _$KeyboardButtonFromJson(json);

	Map<String, dynamic> toJson() => _$KeyboardButtonToJson(this);
}

/// ReplyKeyboardRemove is a struct for ReplyKeyboardRemove
///
/// https://core.telegram.org/bots/api#replykeyboardremove
@JsonSerializable()
class ReplyKeyboardRemove extends ReplyMarkup {
	@JsonKey(name: 'remove_keyboard')
	bool removeKeyboard;	// 'remove_keyboard'

	@JsonKey(includeIfNull: false)
	bool selective;	// 'selective' (optional)

	// constructor
	ReplyKeyboardRemove(this.removeKeyboard, {
		this.selective,
	});

	factory ReplyKeyboardRemove.fromJson(Map<String, dynamic> json) => _$ReplyKeyboardRemoveFromJson(json);

	Map<String, dynamic> toJson() => _$ReplyKeyboardRemoveToJson(this);
}

/// InlineKeyboardMarkup is a struct for InlineKeyboardMarkup
///
/// https://core.telegram.org/bots/api#inlinekeyboardmarkup
@JsonSerializable()
class InlineKeyboardMarkup extends ReplyMarkup {
	@JsonKey(name: 'inline_keyboard')
	List<List<InlineKeyboardButton>> inlineKeyboard;	// 'inline_keyboard'

	// constructor
	InlineKeyboardMarkup(this.inlineKeyboard);

	factory InlineKeyboardMarkup.fromJson(Map<String, dynamic> json) => _$InlineKeyboardMarkupFromJson(json);

	Map<String, dynamic> toJson() => _$InlineKeyboardMarkupToJson(this);
}

/// InlineKeyboardButton is a struct for InlineKeyboardButtons
///
/// https://core.telegram.org/bots/api#inlinekeyboardbutton
@JsonSerializable()
class InlineKeyboardButton {
	String text;	// 'text'

	@JsonKey(includeIfNull: false)
	String url;	// 'url' (optional)

	@JsonKey(name: 'callback_data', includeIfNull: false)
	String callbackData;	// 'callback_data' (optional)

	@JsonKey(name: 'switch_inline_query', includeIfNull: false)
	String switchInlineQuery;	// 'switch_inline_query' (optional)

	@JsonKey(name: 'switch_inline_query_current_chat', includeIfNull: false)
	String switchInlineQueryCurrentChat;	// 'switch_inline_query_current_chat' (optional)

	@JsonKey(name: 'callback_game', includeIfNull: false)
	CallbackGame callbackGame;	// 'callback_game' (optional)

	@JsonKey(includeIfNull: false)
	bool pay;	// 'pay' (optional)

	// constructor
	InlineKeyboardButton(this.text, {
		this.url,
		this.callbackData,
		this.switchInlineQuery,
		this.switchInlineQueryCurrentChat,
		this.callbackGame,
		this.pay,
	});

	// helper function for generating an array of InlineKeyboardButton with urls
	List<InlineKeyboardButton> createWithUrls(Map<String, String> values) {
		List<InlineKeyboardButton> buttons = new List<InlineKeyboardButton>();
		values.forEach((text, url) {
			buttons.add(new InlineKeyboardButton(text, url: url));
		});
		return buttons;
	}

	// helper function for generating an array of InlineKeyboardButton with callback data
	List<InlineKeyboardButton> createWithCallbackData(Map<String, String> values) {
		return createAsColumnsWithCallbackData(values);
	}

	// helper function for generating an array of InlineKeyboardButtons (as columns) with callback data
	List<InlineKeyboardButton> createAsColumnsWithCallbackData(Map<String, String> values) {
		List<InlineKeyboardButton> buttons = new List<InlineKeyboardButton>();
		values.forEach((text, callbackData) {
			buttons.add(new InlineKeyboardButton(text, callbackData: callbackData));
		});
		return buttons;
	}

	// helper function for generating an array of InlineKeyboardButtons (as rows) with callback data
	List<List<InlineKeyboardButton>> createAsRowsWithCallbackData(Map<String, String> values) {
		List<List<InlineKeyboardButton>> buttons = new List<List<InlineKeyboardButton>>();
		values.forEach((text, callbackData) {
			buttons.add([
				new InlineKeyboardButton(text, callbackData: callbackData)
			]);
		});
		return buttons;
	}

	// helper function for generating an array of InlineKeyboardButton with switch inline query
	List<InlineKeyboardButton> createWithSwitchInlineQuery(Map<String, String> values) {
		List<InlineKeyboardButton> buttons = new List<InlineKeyboardButton>();
		values.forEach((text, swithInlineQuery) {
			buttons.add(new InlineKeyboardButton(text, switchInlineQuery: switchInlineQuery));
		});
		return buttons;
	}

	factory InlineKeyboardButton.fromJson(Map<String, dynamic> json) => _$InlineKeyboardButtonFromJson(json);

	Map<String, dynamic> toJson() => _$InlineKeyboardButtonToJson(this);
}

/// CallbackQuery is a struct for a callback query
///
/// https://core.telegram.org/bots/api#callbackquery
@JsonSerializable()
class CallbackQuery {
	String id;	// 'id'

	User from;	// 'from'

	@JsonKey(includeIfNull: false)
	Message message;	// 'message' (optional)

	@JsonKey(name: 'inline_message_id', includeIfNull: false)
	String inlineMessageId;	// 'inline_message_id' (optional)

	@JsonKey(name: 'chat_instance', includeIfNull: false)
	String chatInstance;	// 'chat_instance'

	@JsonKey(includeIfNull: false)
	String data;	// 'data' (optional)

	@JsonKey(name: 'game_short_name', includeIfNull: false)
	String gameShortName;	// 'game_short_name' (optional)

	// constructor
	CallbackQuery(this.id, this.from, this.chatInstance, {
		this.message,
		this.inlineMessageId,
		this.data,
		this.gameShortName,
	});

	factory CallbackQuery.fromJson(Map<String, dynamic> json) => _$CallbackQueryFromJson(json);

	Map<String, dynamic> toJson() => _$CallbackQueryToJson(this);
}

/// ShippingQuery is a struct for a shipping query
///
/// https://core.telegram.org/bots/api#shippingquery
@JsonSerializable()
class ShippingQuery {
	String id;	// 'id'

	User from;	// 'from'

	@JsonKey(name: 'invoice_payload')
	String invoicePayload;	// 'invoice_payload'

	@JsonKey(name: 'shipping_address')
	ShippingAddress shippingAddress;	// 'shipping_address'

	// constructor
	ShippingQuery(this.id, this.from, this.invoicePayload, this.shippingAddress);

	factory ShippingQuery.fromJson(Map<String, dynamic> json) => _$ShippingQueryFromJson(json);

	Map<String, dynamic> toJson() => _$ShippingQueryToJson(this);
}

/// PreCheckoutQuery is a struct for a precheckout query
///
/// https://core.telegram.org/bots/api#precheckoutquery
@JsonSerializable()
class PreCheckoutQuery {
	String id;	// 'id'

	User from;	// 'from'

	String currency;	// 'currency'

	@JsonKey(name: 'total_amount')
	int totalAmount;	// 'total_amount'

	@JsonKey(name: 'invoice_payload')
	String invoicePayload;	// 'invoice_payload'

	@JsonKey(name: 'shipping_option_id', includeIfNull: false)
	String shippingOptionId;	// 'shipping_option_id' (optional)

	@JsonKey(name: 'order_info', includeIfNull: false)
	OrderInfo orderInfo;	// 'order_info' (optional)

	// constructor
	PreCheckoutQuery(this.id, this.from, this.currency, this.totalAmount, this.invoicePayload, {
		this.shippingOptionId,
		this.orderInfo,
	});

	factory PreCheckoutQuery.fromJson(Map<String, dynamic> json) => _$PreCheckoutQueryFromJson(json);

	Map<String, dynamic> toJson() => _$PreCheckoutQueryToJson(this);
}

/// ForceReply is a struct for force-reply
///
/// https://core.telegram.org/bots/api#forcereply
@JsonSerializable()
class ForceReply extends ReplyMarkup {
	@JsonKey(name: 'force_reply')
	bool forceReply;	// 'force_reply'

	@JsonKey(includeIfNull: false)
	bool selective;	// 'selective' (optional)

	// constructor
	ForceReply(this.forceReply, {this.selective});

	factory ForceReply.fromJson(Map<String, dynamic> json) => _$ForceReplyFromJson(json);

	Map<String, dynamic> toJson() => _$ForceReplyToJson(this);
}

/// ChatPhoto is a struct for a chat photo
///
/// https://core.telegram.org/bots/api#chatphoto
@JsonSerializable()
class ChatPhoto {
	@JsonKey(name: 'small_file_id')
	String smallFileId;	// 'small_file_id'

	@JsonKey(name: 'big_file_id')
	String bigFileId;	// 'big_file_id'

	// constructor
	ChatPhoto(this.smallFileId, this.bigFileId);

	factory ChatPhoto.fromJson(Map<String, dynamic> json) => _$ChatPhotoFromJson(json);

	Map<String, dynamic> toJson() => _$ChatPhotoToJson(this);
}

/// ChatMember is a struct of a chat member
///
/// https://core.telegram.org/bots/api#chatmember
@JsonSerializable()
class ChatMember {
	User user;	// 'user'

	ChatMemberStatus status;	// 'status'

	@JsonKey(name: 'until_date', includeIfNull: false)
	int untilDate;	// 'until_date' (optional)

	@JsonKey(name: 'can_be_edited', includeIfNull: false)
	bool canBeEdited;	// 'can_be_edited' (optional)

	@JsonKey(name: 'can_change_info', includeIfNull: false)
	bool canChangeInfo;	// 'can_change_info' (optional)

	@JsonKey(name: 'can_post_messages', includeIfNull: false)
	bool canPostMessages;	// 'can_post_messages' (optional)

	@JsonKey(name: 'can_edit_messages', includeIfNull: false)
	bool canEditMessages;	// 'can_edit_messages' (optional)

	@JsonKey(name: 'can_delete_messages', includeIfNull: false)
	bool canDeleteMessages;	// 'can_delete_messages' (optional)

	@JsonKey(name: 'can_invite_users', includeIfNull: false)
	bool canInviteUsers;	// 'can_invite_users' (optional)

	@JsonKey(name: 'can_restrict_members', includeIfNull: false)
	bool canRestrictMembers;	// 'can_restrict_members' (optional)

	@JsonKey(name: 'can_pin_messages', includeIfNull: false)
	bool canPinMessages;	// 'can_pin_messages' (optional)

	@JsonKey(name: 'can_promote_members', includeIfNull: false)
	bool canPromoteMembers;	// 'can_promote_members' (optional)

	@JsonKey(name: 'can_send_messages', includeIfNull: false)
	bool canSendMessages;	// 'can_send_messages' (optional)

	@JsonKey(name: 'can_send_media_messages', includeIfNull: false)
	bool canSendMediaMessages;	// 'can_send_media_messages' (optional)

	@JsonKey(name: 'can_send_other_messages', includeIfNull: false)
	bool canSendOtherMessages;	// 'can_send_other_messages' (optional)

	@JsonKey(name: 'can_add_web_page_previews', includeIfNull: false)
	bool canAddWebPagePreviews;	// 'can_add_web_page_previews' (optional)

	// constructor
	ChatMember(this.user, this.status, {
		this.untilDate,
		this.canBeEdited,
		this.canChangeInfo,
		this.canPostMessages,
		this.canEditMessages,
		this.canDeleteMessages,
		this.canInviteUsers,
		this.canRestrictMembers,
		this.canPinMessages,
		this.canPromoteMembers,
		this.canSendMessages,
		this.canSendMediaMessages,
		this.canSendOtherMessages,
		this.canAddWebPagePreviews,
	});

	factory ChatMember.fromJson(Map<String, dynamic> json) => _$ChatMemberFromJson(json);

	Map<String, dynamic> toJson() => _$ChatMemberToJson(this);
}

/// Message is a struct of a message
///
/// https://core.telegram.org/bots/api#message
@JsonSerializable()
class Message {
	@JsonKey(name: 'message_id')
	int messageId;	// 'message_id'

	@JsonKey(includeIfNull: false)
	User from;	// 'from' (optional)

	int date;	// 'date'

	Chat chat;	// 'chat'

	@JsonKey(name: 'forward_from', includeIfNull: false)
	User forwardFrom;	// 'forward_from' (optional)

	@JsonKey(name: 'forward_from_chat', includeIfNull: false)
	Chat forwardFromChat;	// 'forward_from_chat' (optional)

	@JsonKey(name: 'forward_from_message_id', includeIfNull: false)
	int forwardFromMessageId;	// 'forward_from_message_id' (optional)

	@JsonKey(name: 'forward_signature', includeIfNull: false)
	String forwardSignature;	// 'forward_signature' (optional)

	@JsonKey(name: 'forward_date', includeIfNull: false)
	int forwardDate;	// 'forward_date' (optional)

	@JsonKey(name: 'reply_to_message', includeIfNull: false)
	Message replyToMessage;	// 'reply_to_message' (optional)

	@JsonKey(name: 'edit_date', includeIfNull: false)
	int editDate;	// 'edit_date' (optional)

	@JsonKey(name: 'author_signature', includeIfNull: false)
	String authorSignature;	// 'author_signature' (optional)

	@JsonKey(includeIfNull: false)
	String text;	// 'text' (optional)

	@JsonKey(includeIfNull: false)
	List<MessageEntity> entities;	// 'entities' (optional)

	@JsonKey(name: 'caption_entities', includeIfNull: false)
	List<MessageEntity> captionEntities;	// 'caption_entities' (optional)

	@JsonKey(includeIfNull: false)
	Audio audio;	// 'audio' (optional)

	@JsonKey(includeIfNull: false)
	Document document;	// 'document' (optional)

	@JsonKey(includeIfNull: false)
	Animation animation;	// 'animation' (optional)

	@JsonKey(includeIfNull: false)
	Game game;	// 'game' (optional)

	@JsonKey(includeIfNull: false)
	List<PhotoSize> photo;	// 'photo' (optional)

	@JsonKey(includeIfNull: false)
	Sticker sticker;	// 'sticker' (optional)

	@JsonKey(includeIfNull: false)
	Video video;	// 'video' (optional)

	@JsonKey(includeIfNull: false)
	Voice voice;	// 'voice' (optional)

	@JsonKey(name: 'video_note', includeIfNull: false)
	VideoNote videoNote;	// 'video_note' (optional)

	@JsonKey(includeIfNull: false)
	String caption;	// 'caption' (optional)

	@JsonKey(includeIfNull: false)
	Contact contact;	// 'contact' (optional)

	@JsonKey(includeIfNull: false)
	Location location;	// 'location' (optional)

	@JsonKey(includeIfNull: false)
	Venue venue;	// 'venue' (optional)

	@JsonKey(name: 'new_chat_members', includeIfNull: false)
	List<User> newChatMembers;	// 'new_chat_members' (optional)

	@JsonKey(name: 'left_chat_member', includeIfNull: false)
	User leftChatMember;	// 'left_chat_member' (optional)

	@JsonKey(name: 'new_chat_title', includeIfNull: false)
	String newChatTitle;	// 'new_chat_title' (optional)

	@JsonKey(name: 'new_chat_photo', includeIfNull: false)
	List<PhotoSize> newChatPhoto;	// 'new_chat_photo' (optional)

	@JsonKey(name: 'delete_chat_photo', includeIfNull: false)
	bool deleteChatPhoto;	// 'delete_chat_photo' (optional)

	@JsonKey(name: 'group_chat_created', includeIfNull: false)
	bool groupChatCreated;	// 'group_chat_created' (optional)

	@JsonKey(name: 'supergroup_chat_created', includeIfNull: false)
	bool supergroupChatCreated;	// 'supergroup_chat_created' (optional)

	@JsonKey(name: 'channel_chat_created', includeIfNull: false)
	bool channelChatCreated;	// 'channel_chat_created' (optional)

	@JsonKey(name: 'migrate_to_chat_id', includeIfNull: false)
	int migrateToChatId;	// 'migrate_to_chat_id' (optional)

	@JsonKey(name: 'migrate_from_chat_id', includeIfNull: false)
	int migrateFromChatId;	// 'migrate_from_chat_id' (optional)

	@JsonKey(name: 'pinned_message', includeIfNull: false)
	Message pinnedMessage;	// 'pinned_message' (optional)

	@JsonKey(includeIfNull: false)
	Invoice invoice;	// 'invoice' (optional)

	@JsonKey(name: 'successful_payment', includeIfNull: false)
	SuccessfulPayment successfulPayment;	// 'successful_payment' (optional)

	@JsonKey(name: 'connected_website', includeIfNull: false)
	String connectedWebsite;	// 'connected_website' (optional)

	// constructor
	Message(this.messageId, this.date, this.chat, {
		this.from,
		this.forwardFrom,
		this.forwardFromChat,
		this.forwardFromMessageId,
		this.forwardSignature,
		this.forwardDate,
		this.replyToMessage,
		this.editDate,
		this.authorSignature,
		this.text,
		this.entities,
		this.captionEntities,
		this.audio,
		this.document,
		this.game,
		this.photo,
		this.sticker,
		this.video,
		this.voice,
		this.videoNote,
		this.caption,
		this.contact,
		this.location,
		this.venue,
		this.newChatMembers,
		this.leftChatMember,
		this.newChatTitle,
		this.newChatPhoto,
		this.deleteChatPhoto,
		this.groupChatCreated,
		this.supergroupChatCreated,
		this.channelChatCreated,
		this.migrateToChatId,
		this.migrateFromChatId,
		this.pinnedMessage,
		this.invoice,
		this.successfulPayment,
		this.connectedWebsite,
	});

	// return a photo with the largest file size.
	PhotoSize largestPhoto() {
		if (photo == null) {
			return null;
		}

		int maxIndex = 0;
		for (int i=0; i<photo.length; i++) {
			if (photo[i].fileSize > photo[maxIndex].fileSize) {
				maxIndex = i;
			}
		}
		return photo[maxIndex];
	}

	factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);

	Map<String, dynamic> toJson() => _$MessageToJson(this);
}

/// InlineQuery is a struct of an inline query
///
/// https://core.telegram.org/bots/api#inlinequery
@JsonSerializable()
class InlineQuery {
	String id;	// 'id'

	User from;	// 'from'

	@JsonKey(includeIfNull: false)
	Location location;	// 'location' (optional)

	String query;	// 'query'

	String offset;	// 'offset'
	
	// constructor
	InlineQuery(this.id, this.from, this.query, this.offset, {
		this.location,
	});

	factory InlineQuery.fromJson(Map<String, dynamic> json) => _$InlineQueryFromJson(json);

	Map<String, dynamic> toJson() => _$InlineQueryToJson(this);
}

/// ChosenInlineResult is a struct for a chosen inline result
///
/// https://core.telegram.org/bots/api#choseninlineresult
@JsonSerializable()
class ChosenInlineResult {
	@JsonKey(name: 'result_id')
	String resultId;	// 'result_id'

	User from;	// 'from'

	@JsonKey(includeIfNull: false)
	Location location;	// 'location' (optional)

	@JsonKey(name: 'inline_message_id', includeIfNull: false)
	String inlineMessageId;	// 'inline_message_id' (optional)

	String query;	// 'query'

	// constructor
	ChosenInlineResult(this.resultId, this.from, this.query, {
		this.location,
		this.inlineMessageId,
	});

	factory ChosenInlineResult.fromJson(Map<String, dynamic> json) => _$ChosenInlineResultFromJson(json);

	Map<String, dynamic> toJson() => _$ChosenInlineResultToJson(this);
}

/// VideoMimeType is a video mime type for an inline query
enum VideoMimeType {
	@JsonValue('text/html')
	TextHtml,	// 'text/html'

	@JsonValue('video/mp4')
	VideoMp4,	// 'video/mp4'
}

/// DocumentMimeType is a document mime type for an inline query
enum DocumentMimeType {
	@JsonValue('application/pdf')
	ApplicationPdf,	// 'application/pdf'

	@JsonValue('application/zip')
	ApplicationZip,	// 'application/zip'
}

/// InlineQueryResult is a struct for inline query results
///
/// https://core.telegram.org/bots/api#inlinequeryresult
@JsonSerializable()
class InlineQueryResult {
	InlineQueryResultType type;	// 'type'

	String id;	// 'id'

	// constructor
	InlineQueryResult(this.type, this.id);

	/// Generate a random UUID according to RFC-4122
	///
	/// https://pub.dartlang.org/packages/uuid
	static String generateUuid() {
		return new Uuid().v4();
	}

	factory InlineQueryResult.fromJson(Map<String, dynamic> json) => _$InlineQueryResultFromJson(json);

	Map<String, dynamic> toJson() => _$InlineQueryResultToJson(this);
}

/// InlineQueryResultArticle is a struct for InlineQueryResultArticle
///
/// https://core.telegram.org/bots/api#inlinequeryresultarticle
@JsonSerializable()
class InlineQueryResultArticle extends InlineQueryResult {
	String title;	// 'title'

	@JsonKey(name: 'input_message_content')
	InputMessageContent inputMessageContent;	// 'input_message_content'

	@JsonKey(name: 'reply_markup', includeIfNull: false)
	InlineKeyboardMarkup replyMarkup;	// 'reply_markup' (optional)

	@JsonKey(includeIfNull: false)
	String url;	// 'url' (optional)

	@JsonKey(name: 'hide_url', includeIfNull: false)
	bool hideUrl;	// 'hide_url' (optional)

	@JsonKey(includeIfNull: false)
	String description;	// 'description' (optional)

	@JsonKey(name: 'thumb_url', includeIfNull: false)
	String thumbUrl;	// 'thumb_url' (optional)

	@JsonKey(name: 'thumb_width', includeIfNull: false)
	int thumbWidth;	// 'thumb_width' (optional)

	@JsonKey(name: 'thumb_height', includeIfNull: false)
	int thumbHeight;	// 'thumb_height' (optional)

	// constructor
	InlineQueryResultArticle(this.title, this.inputMessageContent, {
		this.url,
		this.hideUrl,
		this.description,
		this.thumbUrl,
		this.thumbWidth,
		this.thumbHeight,
	}) : super(InlineQueryResultType.Article, InlineQueryResult.generateUuid());

	// helper function
	static InlineQueryResultArticle create(String title, String messageText, String description) {
		InlineQueryResultArticle article = new InlineQueryResultArticle(
				title,
				new InputTextMessageContent(messageText),
				description: description);

		return article;
	}

	factory InlineQueryResultArticle.fromJson(Map<String, dynamic> json) => _$InlineQueryResultArticleFromJson(json);

	Map<String, dynamic> toJson() => _$InlineQueryResultArticleToJson(this);
}

/// InlineQueryResultPhoto is a struct for InlineQueryResultPhoto
///
/// Photo must be in jpeg format, < 5MB.
///
/// https://core.telegram.org/bots/api#inlinequeryresultphoto
@JsonSerializable()
class InlineQueryResultPhoto extends InlineQueryResult {
	@JsonKey(name: 'photo_url')
	String photoUrl;	// 'photo_url'

	@JsonKey(name: 'photo_width', includeIfNull: false)
	int photoWidth;	// 'photo_width' (optional)

	@JsonKey(name: 'photo_height', includeIfNull: false)
	int photoHeight;	// 'photo_height' (optional)

	@JsonKey(name: 'thumb_url')
	String thumbUrl;	// 'thumb_url'

	@JsonKey(includeIfNull: false)
	String title;	// 'title' (optional)

	@JsonKey(includeIfNull: false)
	String description;	// 'description' (optional)

	@JsonKey(includeIfNull: false)
	String caption;	// 'caption' (optional)

	@JsonKey(name: 'parse_mode', includeIfNull: false)
	ParseMode parseMode;	// 'parse_mode' (optional)

	@JsonKey(name: 'reply_markup', includeIfNull: false)
	InlineKeyboardMarkup replyMarkup;	// 'reply_markup' (optional)

	@JsonKey(name: 'input_message_content', includeIfNull: false)
	InputMessageContent inputMessageContent;	// 'input_message_content' (optional)

	// constructor
	InlineQueryResultPhoto(this.photoUrl, this.thumbUrl, {
		this.photoWidth,
		this.photoHeight,
		this.title,
		this.description,
		this.caption,
		this.parseMode,
		this.replyMarkup,
		this.inputMessageContent,
	}) : super(InlineQueryResultType.Photo, InlineQueryResult.generateUuid());

	// helper function
	static InlineQueryResultPhoto create(String photoUrl, String thumbUrl) {
		return new InlineQueryResultPhoto(photoUrl, thumbUrl);
	}

	factory InlineQueryResultPhoto.fromJson(Map<String, dynamic> json) => _$InlineQueryResultPhotoFromJson(json);

	Map<String, dynamic> toJson() => _$InlineQueryResultPhotoToJson(this);
}

/// InlineQueryResultGif is a struct for InlineQueryResultGif
///
/// Gif must be in gif format, < 1MB.
///
/// https://core.telegram.org/bots/api#inlinequeryresultgif
@JsonSerializable()
class InlineQueryResultGif extends InlineQueryResult {
	@JsonKey(name: 'gif_url')
	String gifUrl;	// 'gif_url'

	@JsonKey(name: 'gif_width', includeIfNull: false)
	int gifWidth;	// 'gif_width' (optional)

	@JsonKey(name: 'gif_height', includeIfNull: false)
	int gifHeight;	// 'gif_height' (optional)

	@JsonKey(name: 'gif_duration', includeIfNull: false)
	int gifDuration;	// 'gif_duration' (optional)

	@JsonKey(name: 'thumb_url')
	String thumbUrl;	// 'thumb_url'

	@JsonKey(includeIfNull: false)
	String title;	// 'title' (optional)

	@JsonKey(includeIfNull: false)
	String caption;	// 'caption' (optional)

	@JsonKey(name: 'parse_mode', includeIfNull: false)
	ParseMode parseMode;	// 'parse_mode' (optional)

	@JsonKey(name: 'reply_markup', includeIfNull: false)
	InlineKeyboardMarkup replyMarkup;	// 'reply_markup' (optional)

	@JsonKey(name: 'input_message_content', includeIfNull: false)
	InputMessageContent inputMessageContent;	// 'input_message_content' (optional)

	// constructor
	InlineQueryResultGif(this.gifUrl, this.thumbUrl, {
		this.gifWidth,
		this.gifHeight,
		this.gifDuration,
		this.title,
		this.caption,
		this.parseMode,
		this.replyMarkup,
		this.inputMessageContent,
	}) : super(InlineQueryResultType.Gif, InlineQueryResult.generateUuid());

	// helper function
	static InlineQueryResultGif create(String gifUrl, String thumbUrl) {
		return new InlineQueryResultGif(gifUrl, thumbUrl);
	}

	factory InlineQueryResultGif.fromJson(Map<String, dynamic> json) => _$InlineQueryResultGifFromJson(json);

	Map<String, dynamic> toJson() => _$InlineQueryResultGifToJson(this);
}

/// InlineQueryResultMpeg4Gif is a struct for InlineQueryResultMpeg4Gif
///
/// Mpeg4 must be in H.264/MPEG-4 AVC video(wihout sound) format, < 1MB.
///
/// https://core.telegram.org/bots/api#inlinequeryresultmpeg4gif
@JsonSerializable()
class InlineQueryResultMpeg4Gif extends InlineQueryResult {
	@JsonKey(name: 'mpeg4_url')
	String mpeg4Url;	// 'mpeg4_url'

	@JsonKey(name: 'mpeg4_width', includeIfNull: false)
	int mpeg4Width;	// 'mpeg4_width' (optional)

	@JsonKey(name: 'mpeg4_height', includeIfNull: false)
	int mpeg4Height;	// 'mpeg4_height' (optional)

	@JsonKey(name: 'mpeg4_duration', includeIfNull: false)
	int mpeg4Duration;	// 'mpeg4_duration' (optional)

	@JsonKey(name: 'thumb_url')
	String thumbUrl;	// 'thumb_url'

	@JsonKey(includeIfNull: false)
	String title;	// 'title' (optional)

	@JsonKey(includeIfNull: false)
	String caption;	// 'caption' (optional)

	@JsonKey(name: 'parse_mode', includeIfNull: false)
	ParseMode parseMode;	// 'parse_mode' (optional)

	@JsonKey(name: 'reply_markup', includeIfNull: false)
	InlineKeyboardMarkup replyMarkup;	// 'reply_markup' (optional)

	@JsonKey(name: 'input_message_content', includeIfNull: false)
	InputMessageContent inputMessageContent;	// 'input_message_content' (optional)

	// constructor
	InlineQueryResultMpeg4Gif(this.mpeg4Url, this.thumbUrl, {
		this.mpeg4Width,
		this.mpeg4Height,
		this.mpeg4Duration,
		this.title,
		this.caption,
		this.parseMode,
		this.replyMarkup,
		this.inputMessageContent,
	}) : super(InlineQueryResultType.Mpeg4Gif, InlineQueryResult.generateUuid());

	// helper function
	static InlineQueryResultMpeg4Gif create(String mpeg4Url, String thumbUrl) {
		return new InlineQueryResultMpeg4Gif(mpeg4Url, thumbUrl);
	}

	factory InlineQueryResultMpeg4Gif.fromJson(Map<String, dynamic> json) => _$InlineQueryResultMpeg4GifFromJson(json);

	Map<String, dynamic> toJson() => _$InlineQueryResultMpeg4GifToJson(this);
}

/// InlineQueryResultVideo is a struct of InlineQueryResultVideo
///
/// https://core.telegram.org/bots/api#inlinequeryresultvideo
@JsonSerializable()
class InlineQueryResultVideo extends InlineQueryResult {
	@JsonKey(name: 'video_url')
	String videoUrl;	// 'video_url'

	@JsonKey(name: 'mime_type')
	VideoMimeType mimeType;	// 'mime_type'

	@JsonKey(name: 'thumb_url')
	String thumbUrl;	// 'thumb_url'

	String title;	// 'title'

	@JsonKey(includeIfNull: false)
	String caption;	// 'caption' (optional)

	@JsonKey(name: 'parse_mode', includeIfNull: false)
	ParseMode parseMode;	// 'parse_mode' (optional)

	@JsonKey(name: 'video_width', includeIfNull: false)
	int videoWidth;	// 'video_width' (optional)

	@JsonKey(name: 'video_height', includeIfNull: false)
	int videoHeight;	// 'video_height' (optional)

	@JsonKey(name: 'video_duration', includeIfNull: false)
	int videoDuration;	// 'video_duration' (optional)

	@JsonKey(includeIfNull: false)
	String description;	// 'description' (optional)

	@JsonKey(name: 'reply_markup', includeIfNull: false)
	InlineKeyboardMarkup replyMarkup;	// 'reply_markup' (optional)

	@JsonKey(name: 'input_message_content', includeIfNull: false)
	InputMessageContent inputMessageContent ; // 'input_message_content' (optional)

	// constructor
	InlineQueryResultVideo(this.videoUrl, this.mimeType, this.thumbUrl, this.title, {
		this.caption,
		this.parseMode,
		this.videoWidth,
		this.videoHeight,
		this.videoDuration,
		this.description,
		this.replyMarkup,
		this.inputMessageContent,
	}) : super(InlineQueryResultType.Video, InlineQueryResult.generateUuid());

	// helper function
	static InlineQueryResultVideo create(String videoUrl, VideoMimeType mimeType, String thumbUrl, String title) {
		return new InlineQueryResultVideo(videoUrl, mimeType, thumbUrl, title);
	}

	factory InlineQueryResultVideo.fromJson(Map<String, dynamic> json) => _$InlineQueryResultVideoFromJson(json);

	Map<String, dynamic> toJson() => _$InlineQueryResultVideoToJson(this);
}

/// InlineQueryResultAudio is a struct of InlineQueryResultAudio
///
/// https://core.telegram.org/bots/api#inlinequeryresultaudio
@JsonSerializable()
class InlineQueryResultAudio extends InlineQueryResult {
	@JsonKey(name: 'audio_url')
	String audioUrl;	// 'audio_url'

	String title;	// 'title'

	@JsonKey(includeIfNull: false)
	String caption;	// 'caption' (optional)

	@JsonKey(name: 'parse_mode', includeIfNull: false)
	ParseMode parseMode;	// 'parse_mode' (optional)

	@JsonKey(includeIfNull: false)
	String performer;	// 'performer' (optional)

	@JsonKey(name: 'audio_duration', includeIfNull: false)
	int audioDuration;	// 'audio_duration' (optional)

	@JsonKey(name: 'reply_markup', includeIfNull: false)
	InlineKeyboardMarkup replyMarkup;	// 'reply_markup' (optional)

	@JsonKey(name: 'input_message_content', includeIfNull: false)
	InputMessageContent inputMessageContent;	// 'input_message_content' (optional)

	// constructor
	InlineQueryResultAudio(this.audioUrl, this.title, {
		this.caption,
		this.parseMode,
		this.performer,
		this.audioDuration,
		this.replyMarkup,
		this.inputMessageContent,
	}) : super(InlineQueryResultType.Audio, InlineQueryResult.generateUuid());

	// helper function
	static InlineQueryResultAudio create(String audioUrl, String title) {
		return new InlineQueryResultAudio(audioUrl, title);
	}

	factory InlineQueryResultAudio.fromJson(Map<String, dynamic> json) => _$InlineQueryResultAudioFromJson(json);

	Map<String, dynamic> toJson() => _$InlineQueryResultAudioToJson(this);
}

/// InlineQueryResultVoice is a struct of InlineQueryResultVoice
///
/// https://core.telegram.org/bots/api#inlinequeryresultvoice
@JsonSerializable()
class InlineQueryResultVoice extends InlineQueryResult {
	@JsonKey(name: 'voice_url')
	String voiceUrl;	// 'voice_url'

	String title;	// 'title'

	@JsonKey(includeIfNull: false)
	String caption;	// 'caption' (optional)

	@JsonKey(name: 'parse_mode', includeIfNull: false)
	ParseMode parseMode;	// 'parse_mode' (optioinal)

	@JsonKey(name: 'voice_duration', includeIfNull: false)
	int voiceDuration;	// 'voice_duration' (optional)

	@JsonKey(name: 'reply_markup', includeIfNull: false)
	InlineKeyboardMarkup replyMarkup;	// 'reply_markup' (optional)

	@JsonKey(name: 'input_message_content', includeIfNull: false)
	InputMessageContent inputMessageContent;	// 'input_message_content' (optional)

	// constructor
	InlineQueryResultVoice(this.voiceUrl, this.title, {
		this.caption,
		this.parseMode,
		this.voiceDuration,
		this.replyMarkup,
		this.inputMessageContent,
	}) : super(InlineQueryResultType.Voice, InlineQueryResult.generateUuid());

	// helper function
	static InlineQueryResultVoice create(String voiceUrl, String title) {
		return new InlineQueryResultVoice(voiceUrl, title);
	}

	factory InlineQueryResultVoice.fromJson(Map<String, dynamic> json) => _$InlineQueryResultVoiceFromJson(json);

	Map<String, dynamic> toJson() => _$InlineQueryResultVoiceToJson(this);
}

/// InlineQueryResultDocument is a struct of InlineQueryResultDocument
///
/// https://core.telegram.org/bots/api#inlinequeryresultdocument
@JsonSerializable()
class InlineQueryResultDocument extends InlineQueryResult {
	String title;	// 'title'

	@JsonKey(includeIfNull: false)
	String caption;	// 'caption' (optional)

	@JsonKey(name: 'parse_mode', includeIfNull: false)
	ParseMode parseMode;	// 'parse_mode' (optioinal)

	@JsonKey(name: 'document_url')
	String documentUrl;	// 'document_url'

	@JsonKey(name: 'mime_type')
	DocumentMimeType mimeType;	// 'mime_type'

	@JsonKey(includeIfNull: false)
	String description;	// 'description' (optional)

	@JsonKey(name: 'reply_markup', includeIfNull: false)
	InlineKeyboardMarkup replyMarkup;	// 'reply_markup' (optional)

	@JsonKey(name: 'input_message_content', includeIfNull: false)
	InputMessageContent inputMessageContent;	// 'input_message_content' (optional)

	@JsonKey(name: 'thumb_url', includeIfNull: false)
	String thumbUrl;	// 'thumb_url' (optional)

	@JsonKey(name: 'thumb_width', includeIfNull: false)
	int thumbWidth;	// 'thumb_width' (optional)

	@JsonKey(name: 'thumb_height', includeIfNull: false)
	int thumbHeight;	// 'thumb_height' (optional)

	// constructor
	InlineQueryResultDocument(this.title, this.documentUrl, this.mimeType, {
		this.caption,
		this.parseMode,
		this.description,
		this.replyMarkup,
		this.inputMessageContent,
		this.thumbUrl,
		this.thumbWidth,
		this.thumbHeight,
	}) : super(InlineQueryResultType.Document, InlineQueryResult.generateUuid());

	// helper function
	static InlineQueryResultDocument create(String title, String documentUrl, DocumentMimeType mimeType) {
		return new InlineQueryResultDocument(title, documentUrl, mimeType);
	}

	factory InlineQueryResultDocument.fromJson(Map<String, dynamic> json) => _$InlineQueryResultDocumentFromJson(json);

	Map<String, dynamic> toJson() => _$InlineQueryResultDocumentToJson(this);
}

/// InlineQueryResultLocation is a struct of InlineQueryResultLocation
///
/// https://core.telegram.org/bots/api#inlinequeryresultlocation
@JsonSerializable()
class InlineQueryResultLocation extends InlineQueryResult {
	double latitude;	// 'latitude'

	double longitude;	// 'longitude'

	String title;	// 'title'

	@JsonKey(name: 'reply_markup', includeIfNull: false)
	InlineKeyboardMarkup replyMarkup;	// 'reply_markup' (optional)

	@JsonKey(name: 'input_message_content', includeIfNull: false)
	InputMessageContent inputMessageContent;	// 'input_message_content' (optional)

	@JsonKey(name: 'thumb_url', includeIfNull: false)
	String thumbUrl;	// 'thumb_url' (optional)

	@JsonKey(name: 'thumb_width', includeIfNull: false)
	int thumbWidth;	// 'thumb_width' (optional)

	@JsonKey(name: 'thumb_height', includeIfNull: false)
	int thumbHeight;	// 'thumb_height' (optional)

	// constructor
	InlineQueryResultLocation(this.latitude, this.longitude, this.title, {
		this.replyMarkup,
		this.inputMessageContent,
		this.thumbUrl,
		this.thumbWidth,
		this.thumbHeight,
	}) : super(InlineQueryResultType.Location, InlineQueryResult.generateUuid());

	// helper function
	static InlineQueryResultLocation create(double latitude, double longitude, String title) {
		return new InlineQueryResultLocation(latitude, longitude, title);
	}

	factory InlineQueryResultLocation.fromJson(Map<String, dynamic> json) => _$InlineQueryResultLocationFromJson(json);

	Map<String, dynamic> toJson() => _$InlineQueryResultLocationToJson(this);
}

/// InlineQueryResultVenue is a struct of InlineQueryResultVenue
///
/// https://core.telegram.org/bots/api#inlinequeryresultvenue
@JsonSerializable()
class InlineQueryResultVenue extends InlineQueryResult {
	double latitude;	// 'latitude'

	double longitude;	// 'longitude'

	String title;	// 'title'

	String address;	// 'address'

	@JsonKey(name: 'foursquare_id', includeIfNull: false)
	String foursquareId;	// 'foursquare_id' (optional)

	@JsonKey(name: 'foursquare_type', includeIfNull: false)
	String foursquareType;	// 'foursquare_type' (optional)

	@JsonKey(name: 'reply_markup', includeIfNull: false)
	InlineKeyboardMarkup replyMarkup;	// 'reply_markup' (optional)

	@JsonKey(name: 'input_message_content', includeIfNull: false)
	InputMessageContent inputMessageContent;	// 'input_message_content' (optional)

	@JsonKey(name: 'thumb_url', includeIfNull: false)
	String thumbUrl;	// 'thumb_url' (optional)

	@JsonKey(name: 'thumb_width', includeIfNull: false)
	int thumbWidth;	// 'thumb_width' (optional)

	@JsonKey(name: 'thumb_height', includeIfNull: false)
	int thumbHeight;	// 'thumb_height' (optional)

	// constructor
	InlineQueryResultVenue(this.latitude, this.longitude, this.title, this.address, {
		this.foursquareId,
		this.foursquareType,
		this.replyMarkup,
		this.inputMessageContent,
		this.thumbUrl,
		this.thumbWidth,
		this.thumbHeight,
	}) : super(InlineQueryResultType.Venue, InlineQueryResult.generateUuid());

	// helper function
	static InlineQueryResultVenue create(double latitude, double longitude, String title, String address) {
		return new InlineQueryResultVenue(latitude, longitude, title, address);
	}

	factory InlineQueryResultVenue.fromJson(Map<String, dynamic> json) => _$InlineQueryResultVenueFromJson(json);

	Map<String, dynamic> toJson() => _$InlineQueryResultVenueToJson(this);
}

/// InlineQueryResultContact is a struct of InlineQueryResultContact
///
/// https://core.telegram.org/bots/api#inlinequeryresultcontact
@JsonSerializable()
class InlineQueryResultContact extends InlineQueryResult {
	@JsonKey(name: 'phone_number')
	String phoneNumber;	// 'phone_number'

	@JsonKey(name: 'first_name')
	String firstName;	// 'first_name'

	@JsonKey(name: 'last_name', includeIfNull: false)
	String lastName;	// 'last_name' (optional)

	@JsonKey(name: 'vcard', includeIfNull: false)
	String vCard;	// 'vcard' (optional)	- https://en.wikipedia.org/wiki/VCard

	@JsonKey(name: 'reply_markup', includeIfNull: false)
	InlineKeyboardMarkup replyMarkup;	// 'reply_markup' (optional)

	@JsonKey(name: 'input_message_content', includeIfNull: false)
	InputMessageContent inputMessageContent;	// 'input_message_content' (optional)

	@JsonKey(name: 'thumb_url', includeIfNull: false)
	String thumbUrl;	// 'thumb_url' (optional)

	@JsonKey(name: 'thumb_width', includeIfNull: false)
	int thumbWidth;	// 'thumb_width' (optional)

	@JsonKey(name: 'thumb_height', includeIfNull: false)
	int thumbHeight;	// 'thumb_height' (optional)

	// constructor
	InlineQueryResultContact(this.phoneNumber, this.firstName, {
		this.lastName,
		this.vCard,
		this.replyMarkup,
		this.inputMessageContent,
		this.thumbUrl,
		this.thumbWidth,
		this.thumbHeight,
	}) : super(InlineQueryResultType.Contact, InlineQueryResult.generateUuid());

	// helper function
	static InlineQueryResultContact create(String phoneNumber, String firstName) {
		return new InlineQueryResultContact(phoneNumber, firstName);
	}

	factory InlineQueryResultContact.fromJson(Map<String, dynamic> json) => _$InlineQueryResultContactFromJson(json);

	Map<String, dynamic> toJson() => _$InlineQueryResultContactToJson(this);
}

/// InlineQueryResultGame is a struct of InlineQueryResultGame
///
/// https://core.telegram.org/bots/api#inlinequeryresultgame
@JsonSerializable()
class InlineQueryResultGame extends InlineQueryResult {
	@JsonKey(name: 'game_short_name')
	String gameShortName;	// 'game_short_name'

	@JsonKey(name: 'reply_markup', includeIfNull: false)
	InlineKeyboardMarkup replyMarkup;	// 'reply_markup' (optional)

	// constructor
	InlineQueryResultGame(this.gameShortName, {
		this.replyMarkup,
	}) : super(InlineQueryResultType.Game, InlineQueryResult.generateUuid());

	// helper function
	static InlineQueryResultGame create(String gameShortName) {
		return new InlineQueryResultGame(gameShortName);
	}

	factory InlineQueryResultGame.fromJson(Map<String, dynamic> json) => _$InlineQueryResultGameFromJson(json);

	Map<String, dynamic> toJson() => _$InlineQueryResultGameToJson(this);
}

/// InlineQueryResultCachedPhoto is a struct of InlineQueryResultCachedPhoto
///
/// https://core.telegram.org/bots/api#inlinequeryresultcachedphoto
@JsonSerializable()
class InlineQueryResultCachedPhoto extends InlineQueryResult {
	@JsonKey(name: 'photo_file_id')
	String photoFileId;	// 'photo_file_id'

	@JsonKey(includeIfNull: false)
	String title;	// 'title' (optional)

	@JsonKey(includeIfNull: false)
	String description;	// 'description' (optional)

	@JsonKey(includeIfNull: false)
	String caption;	// 'caption' (optional)

	@JsonKey(name: 'parse_mode', includeIfNull: false)
	ParseMode parseMode;	// 'parse_mode' (optional)

	@JsonKey(name: 'reply_markup', includeIfNull: false)
	InlineKeyboardMarkup replyMarkup;	// 'reply_markup' (optional)

	@JsonKey(name: 'input_message_content', includeIfNull: false)
	InputMessageContent inputMessageContent;	// 'input_message_content' (optional)

	// constructor
	InlineQueryResultCachedPhoto(this.photoFileId, {
		this.title,
		this.description,
		this.caption,
		this.parseMode,
		this.replyMarkup,
		this.inputMessageContent,
	}) : super(InlineQueryResultType.Photo, InlineQueryResult.generateUuid());

	// helper function
	static InlineQueryResultCachedPhoto create(String photoFileId) {
		return new InlineQueryResultCachedPhoto(photoFileId);
	}

	factory InlineQueryResultCachedPhoto.fromJson(Map<String, dynamic> json) => _$InlineQueryResultCachedPhotoFromJson(json);

	Map<String, dynamic> toJson() => _$InlineQueryResultCachedPhotoToJson(this);
}

/// InlineQueryResultCachedGif is a struct of InlineQueryResultCachedGif
///
/// https://core.telegram.org/bots/api#inlinequeryresultcachedgif
@JsonSerializable()
class InlineQueryResultCachedGif extends InlineQueryResult {
	@JsonKey(name: 'gif_file_id')
	String gifFileId;	// 'gif_file_id'

	@JsonKey(includeIfNull: false)
	String title;	// 'title' (optional)

	@JsonKey(includeIfNull: false)
	String caption;	// 'caption' (optional)

	@JsonKey(name: 'parse_mode', includeIfNull: false)
	ParseMode parseMode;	// 'parse_mode' (optional)

	@JsonKey(name: 'reply_markup', includeIfNull: false)
	InlineKeyboardMarkup replyMarkup;	// 'reply_markup' (optional)

	@JsonKey(name: 'input_message_content', includeIfNull: false)
	InputMessageContent inputMessageContent;	// 'input_message_content' (optional)

	// constructor
	InlineQueryResultCachedGif(this.gifFileId, {
		this.title,
		this.caption,
		this.parseMode,
		this.replyMarkup,
		this.inputMessageContent,
	}) : super(InlineQueryResultType.Gif, InlineQueryResult.generateUuid());

	// helper function
	static InlineQueryResultCachedGif create(String gifFileId) {
		return new InlineQueryResultCachedGif(gifFileId);
	}

	factory InlineQueryResultCachedGif.fromJson(Map<String, dynamic> json) => _$InlineQueryResultCachedGifFromJson(json);

	Map<String, dynamic> toJson() => _$InlineQueryResultCachedGifToJson(this);
}

/// InlineQueryResultCachedMpeg4Gif is a struct of InlineQueryResultCachedMpeg4Gif
///
/// https://core.telegram.org/bots/api#inlinequeryresultcachedmpeg4gif
@JsonSerializable()
class InlineQueryResultCachedMpeg4Gif extends InlineQueryResult {
	@JsonKey(name: 'mpeg4_file_id')
	String mpeg4FileId;	// 'mpeg4_file_id'

	@JsonKey(includeIfNull: false)
	String title;	// 'title' (optional)

	@JsonKey(includeIfNull: false)
	String caption;	// 'caption' (optional)

	@JsonKey(name: 'parse_mode', includeIfNull: false)
	ParseMode parseMode;	// 'parse_mode' (optional)

	@JsonKey(name: 'reply_markup', includeIfNull: false)
	InlineKeyboardMarkup replyMarkup;	// 'reply_markup' (optional)

	@JsonKey(name: 'input_message_content', includeIfNull: false)
	InputMessageContent inputMessageContent;	// 'input_message_content' (optional)

	// constructor
	InlineQueryResultCachedMpeg4Gif(this.mpeg4FileId, {
		this.title,
		this.caption,
		this.parseMode,
		this.replyMarkup,
		this.inputMessageContent,
	}) : super(InlineQueryResultType.Mpeg4Gif, InlineQueryResult.generateUuid());

	// helper function
	static InlineQueryResultCachedMpeg4Gif create(String mpeg4FileId) {
		return new InlineQueryResultCachedMpeg4Gif(mpeg4FileId);
	}

	factory InlineQueryResultCachedMpeg4Gif.fromJson(Map<String, dynamic> json) => _$InlineQueryResultCachedMpeg4GifFromJson(json);

	Map<String, dynamic> toJson() => _$InlineQueryResultCachedMpeg4GifToJson(this);
}

/// InlineQueryResultCachedSticker is a struct of InlineQueryResultCachedSticker
///
/// https://core.telegram.org/bots/api#inlinequeryresultcachedsticker
@JsonSerializable()
class InlineQueryResultCachedSticker extends InlineQueryResult {
	@JsonKey(name: 'sticker_file_id')
	String stickerFileId;	// 'sticker_file_id'

	@JsonKey(name: 'reply_markup', includeIfNull: false)
	InlineKeyboardMarkup replyMarkup;	// 'reply_markup' (optional)

	@JsonKey(name: 'input_message_content', includeIfNull: false)
	InputMessageContent inputMessageContent;	// 'input_message_content' (optional)

	// constructor
	InlineQueryResultCachedSticker(this.stickerFileId, {
		this.replyMarkup,
		this.inputMessageContent,
	}) : super(InlineQueryResultType.Sticker, InlineQueryResult.generateUuid());

	// helper function
	static InlineQueryResultCachedSticker create(String stickerFileId) {
		return new InlineQueryResultCachedSticker(stickerFileId);
	}

	factory InlineQueryResultCachedSticker.fromJson(Map<String, dynamic> json) => _$InlineQueryResultCachedStickerFromJson(json);

	Map<String, dynamic> toJson() => _$InlineQueryResultCachedStickerToJson(this);
}

/// InlineQueryResultCachedDocument is a struct of InlineQueryResultCachedDocument
///
/// https://core.telegram.org/bots/api#inlinequeryresultcacheddocument
@JsonSerializable()
class InlineQueryResultCachedDocument extends InlineQueryResult {
	@JsonKey(name: 'document_file_id')
	String documentFileId;	// 'document_file_id'

	String title;	// 'title'

	@JsonKey(includeIfNull: false)
	String description;	// 'description' (optional)

	@JsonKey(includeIfNull: false)
	String caption;	// 'caption' (optional)

	@JsonKey(name: 'parse_mode', includeIfNull: false)
	ParseMode parseMode;	// 'parse_mode' (optional)

	@JsonKey(name: 'reply_markup', includeIfNull: false)
	InlineKeyboardMarkup replyMarkup;	// 'reply_markup' (optional)

	@JsonKey(name: 'input_message_content', includeIfNull: false)
	InputMessageContent inputMessageContent;	// 'input_message_content' (optional)

	// constructor
	InlineQueryResultCachedDocument(this.documentFileId, this.title, {
		this.description,
		this.caption,
		this.parseMode,
		this.replyMarkup,
		this.inputMessageContent,
	}) : super(InlineQueryResultType.Document, InlineQueryResult.generateUuid());

	// helper function
	static InlineQueryResultCachedDocument create(String documentFileId, String title) {
		return new InlineQueryResultCachedDocument(documentFileId, title);
	}

	factory InlineQueryResultCachedDocument.fromJson(Map<String, dynamic> json) => _$InlineQueryResultCachedDocumentFromJson(json);

	Map<String, dynamic> toJson() => _$InlineQueryResultCachedDocumentToJson(this);
}

/// InlineQueryResultCachedVideo is a struct of InlineQueryResultCachedVideo
///
/// https://core.telegram.org/bots/api#inlinequeryresultcachedvideo
@JsonSerializable()
class InlineQueryResultCachedVideo extends InlineQueryResult {
	@JsonKey(name: 'video_file_id')
	String videoFileId;	// 'video_file_id'

	String title;	// 'title'

	@JsonKey(includeIfNull: false)
	String description;	// 'description' (optional)

	@JsonKey(includeIfNull: false)
	String caption;	// 'caption' (optional)

	@JsonKey(name: 'parse_mode', includeIfNull: false)
	ParseMode parseMode;	// 'parse_mode' (optional)

	@JsonKey(name: 'reply_markup', includeIfNull: false)
	InlineKeyboardMarkup replyMarkup;	// 'reply_markup' (optional)

	@JsonKey(name: 'input_message_content', includeIfNull: false)
	InputMessageContent inputMessageContent;	// 'input_message_content' (optional)

	// constructor
	InlineQueryResultCachedVideo(this.videoFileId, this.title, {
		this.description,
		this.caption,
		this.parseMode,
		this.replyMarkup,
		this.inputMessageContent,
	}) : super(InlineQueryResultType.Video, InlineQueryResult.generateUuid());

	// helper function
	static InlineQueryResultCachedVideo create(String videoFileId, String title) {
		return new InlineQueryResultCachedVideo(videoFileId, title);
	}

	factory InlineQueryResultCachedVideo.fromJson(Map<String, dynamic> json) => _$InlineQueryResultCachedVideoFromJson(json);

	Map<String, dynamic> toJson() => _$InlineQueryResultCachedVideoToJson(this);
}

/// InlineQueryResultCachedVoice is a struct of InlineQueryResultCachedVoice
///
/// https://core.telegram.org/bots/api#inlinequeryresultcachedvoice
@JsonSerializable()
class InlineQueryResultCachedVoice extends InlineQueryResult {
	@JsonKey(name: 'voice_file_id')
	String voiceFileId;	// 'voice_file_id'

	String title;	// 'title'

	@JsonKey(includeIfNull: false)
	String caption;	// 'caption' (optional)

	@JsonKey(name: 'parse_mode', includeIfNull: false)
	ParseMode parseMode;	// 'parse_mode' (optional)

	@JsonKey(name: 'reply_markup', includeIfNull: false)
	InlineKeyboardMarkup replyMarkup;	// 'reply_markup' (optional)

	@JsonKey(name: 'input_message_content', includeIfNull: false)
	InputMessageContent inputMessageContent;	// 'input_message_content' (optional)

	// constructor
	InlineQueryResultCachedVoice(this.voiceFileId, this.title, {
		this.caption,
		this.parseMode,
		this.replyMarkup,
		this.inputMessageContent,
	}) : super(InlineQueryResultType.Voice, InlineQueryResult.generateUuid());

	// helper function
	static InlineQueryResultCachedVoice create(String voiceFileId, String title) {
		return new InlineQueryResultCachedVoice(voiceFileId, title);
	}

	factory InlineQueryResultCachedVoice.fromJson(Map<String, dynamic> json) => _$InlineQueryResultCachedVoiceFromJson(json);

	Map<String, dynamic> toJson() => _$InlineQueryResultCachedVoiceToJson(this);
}

/// InlineQueryResultCachedAudio is a struct of InlineQueryResultCachedAudio
///
/// https://core.telegram.org/bots/api#inlinequeryresultcachedaudio
@JsonSerializable()
class InlineQueryResultCachedAudio extends InlineQueryResult {
	@JsonKey(name: 'audio_file_id')
	String audioFileId;	// 'audio_file_id'

	@JsonKey(includeIfNull: false)
	String caption;	// 'caption' (optional)

	@JsonKey(name: 'parse_mode', includeIfNull: false)
	ParseMode parseMode;	// 'parse_mode' (optional)

	@JsonKey(name: 'reply_markup', includeIfNull: false)
	InlineKeyboardMarkup replyMarkup;	// 'reply_markup' (optional)

	@JsonKey(name: 'input_message_content', includeIfNull: false)
	InputMessageContent inputMessageContent;	// 'input_message_content' (optional)

	// constructor
	InlineQueryResultCachedAudio(this.audioFileId, {
		this.caption,
		this.parseMode,
		this.replyMarkup,
		this.inputMessageContent,
	}) : super(InlineQueryResultType.Audio, InlineQueryResult.generateUuid());

	// helper function
	static InlineQueryResultCachedAudio create(String audioFileId) {
		return new InlineQueryResultCachedAudio(audioFileId);
	}

	factory InlineQueryResultCachedAudio.fromJson(Map<String, dynamic> json) => _$InlineQueryResultCachedAudioFromJson(json);

	Map<String, dynamic> toJson() => _$InlineQueryResultCachedAudioToJson(this);
}

/// InputMessageContent is a generic type of input message content types
///
/// https://core.telegram.org/bots/api#inputmessagecontent
@JsonSerializable()
class InputMessageContent {
	InputMessageContent();

	factory InputMessageContent.fromJson(Map<String, dynamic> json) => _$InputMessageContentFromJson(json);

	Map<String, dynamic> toJson() => _$InputMessageContentToJson(this);
}

/// InputTextMessageContent is a struct of InputTextMessageContent
///
/// https://core.telegram.org/bots/api#inputtextmessagecontent
@JsonSerializable()
class InputTextMessageContent extends InputMessageContent {
	@JsonKey(name: 'message_text')
	String messageText;	// 'message_text'

	@JsonKey(name: 'parse_mode', includeIfNull: false)
	ParseMode parseMode;	// 'parse_mode' (optional)

	@JsonKey(name: 'disable_web_page_preview', includeIfNull: false)
	bool disableWebPagePreview;	// 'disable_web_page_preview' (optional)

	// constructor
	InputTextMessageContent(this.messageText, {
		this.parseMode,
		this.disableWebPagePreview,
	});

	factory InputTextMessageContent.fromJson(Map<String, dynamic> json) => _$InputTextMessageContentFromJson(json);

	Map<String, dynamic> toJson() => _$InputTextMessageContentToJson(this);
}

/// InputLocationMessageContent is a struct of InputLocationMessageContent
///
/// https://core.telegram.org/bots/api#inputlocationmessagecontent
@JsonSerializable()
class InputLocationMessageContent extends InputMessageContent {
	double latitude;	// 'latitude'

	double longitude;	// 'longitude'

	// constructor
	InputLocationMessageContent(this.latitude, this.longitude);

	factory InputLocationMessageContent.fromJson(Map<String, dynamic> json) => _$InputLocationMessageContentFromJson(json);

	Map<String, dynamic> toJson() => _$InputLocationMessageContentToJson(this);
}

/// InputVenueMessageContent is a struct of InputVenueMessageContent
///
/// https://core.telegram.org/bots/api#inputvenuemessagecontent
@JsonSerializable()
class InputVenueMessageContent extends InputMessageContent {
	double latitude;	// 'latitude'

	double longitude;	// 'longitude'

	String title;	// 'title'

	String address;	// 'address'

	@JsonKey(name: 'foursquare_id', includeIfNull: false)
	String foursquareId;	// 'foursquare_id' (optional)

	@JsonKey(name: 'foursquare_type', includeIfNull: false)
	String foursquareType;	// 'foursquare_type' (optional)

	// constructor
	InputVenueMessageContent(this.latitude, this.longitude, this.title, this.address, {
		this.foursquareId,
		this.foursquareType,
	});

	factory InputVenueMessageContent.fromJson(Map<String, dynamic> json) => _$InputVenueMessageContentFromJson(json);

	Map<String, dynamic> toJson() => _$InputVenueMessageContentToJson(this);
}

/// InputContactMessageContent is a struct of InputContactMessageContent
///
/// https://core.telegram.org/bots/api#inputcontactmessagecontent
@JsonSerializable()
class InputContactMessageContent extends InputMessageContent {
	@JsonKey(name: 'phone_number')
	String phoneNumber;	// 'phone_number'

	@JsonKey(name: 'first_name')
	String firstName;	// 'first_name'

	@JsonKey(name: 'last_name', includeIfNull: false)
	String lastName;	// 'last_name' (optional)

	@JsonKey(name: 'vcard', includeIfNull: false)
	String vCard;	// 'vcard' (optional)	- https://en.wikipedia.org/wiki/VCard

	// constructor
	InputContactMessageContent(this.phoneNumber, this.firstName, {
		this.lastName,
		this.vCard,
	});

	factory InputContactMessageContent.fromJson(Map<String, dynamic> json) => _$InputContactMessageContentFromJson(json);

	Map<String, dynamic> toJson() => _$InputContactMessageContentToJson(this);
}

/// CallbackGame is for callback of games
///
/// https://core.telegram.org/bots/api#callbackgame
@JsonSerializable()
class CallbackGame {
	// constructor
	CallbackGame();

	factory CallbackGame.fromJson(Map<String, dynamic> json) => _$CallbackGameFromJson(json);

	Map<String, dynamic> toJson() => _$CallbackGameToJson(this);
}

/// Game is a struct of Game
///
/// https://core.telegram.org/bots/api#game
@JsonSerializable()
class Game {
	String title;	// 'title'

	String description;	// 'description'

	List<PhotoSize> photo;	// 'photo'

	@JsonKey(includeIfNull: false)
	String text;	// 'text' (optional)

	@JsonKey(name: 'text_entities', includeIfNull: false)
	List<MessageEntity> textEntities;	// 'text_entities' (optional)

	@JsonKey(includeIfNull: false)
	Animation animation;	// 'animation' (optional)

	// constructor
	Game(this.title, this.description, this.photo, {
		this.text,
		this.textEntities,
		this.animation,
	});

	factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);

	Map<String, dynamic> toJson() => _$GameToJson(this);
}

/// Animation is a struct of Animation
///
/// https://core.telegram.org/bots/api#animation
@JsonSerializable()
class Animation {
	@JsonKey(name: 'file_id')
	String fileId;	// 'file_id'

	@JsonKey(includeIfNull: false)
	PhotoSize thumb;	// 'thumb' (optional)

	@JsonKey(name: 'file_name', includeIfNull: false)
	String fileName;	// 'file_name' (optional)

	@JsonKey(name: 'mime_type', includeIfNull: false)
	String mimeType;	// 'mime_type' (optional)

	@JsonKey(name: 'file_size', includeIfNull: false)
	int fileSize;	// 'file_size' (optional)

	// constructor
	Animation(this.fileId, {
		this.thumb,
		this.fileName,
		this.mimeType,
		this.fileSize,
	});

	factory Animation.fromJson(Map<String, dynamic> json) => _$AnimationFromJson(json);

	Map<String, dynamic> toJson() => _$AnimationToJson(this);
}

/// GameHighScore is a struct of GameHighScore
///
/// https://core.telegram.org/bots/api#gamehighscore
@JsonSerializable()
class GameHighScore {
	int position;	// 'position'

	User user;	// 'user'

	int score;	// 'score'
	
	// constructor
	GameHighScore(this.position, this.user, this.score);

	factory GameHighScore.fromJson(Map<String, dynamic> json) => _$GameHighScoreFromJson(json);

	Map<String, dynamic> toJson() => _$GameHighScoreToJson(this);
}

/// Invoice is a struct of Invoice
///
/// https://core.telegram.org/bots/api#invoice
@JsonSerializable()
class Invoice {
	String title;	// 'title'

	String description;	// 'description'

	@JsonKey(name: 'start_parameter')
	String startParameter;	// 'start_parameter'

	String currency;	// 'currency' - https://core.telegram.org/bots/payments#supported-currencies

	@JsonKey(name: 'total_amount')
	int totalAmount;	// 'total_amount' - https://core.telegram.org/bots/payments/currencies.json
	
	// constructor
	Invoice(this.title, this.description, this.startParameter, this.currency, this.totalAmount);

	factory Invoice.fromJson(Map<String, dynamic> json) => _$InvoiceFromJson(json);

	Map<String, dynamic> toJson() => _$InvoiceToJson(this);
}

/// SuccessfulPayment is a struct of successful payments
///
/// https://core.telegram.org/bots/api#successfulpayment
@JsonSerializable()
class SuccessfulPayment {
	String currency;	// 'currency'

	@JsonKey(name: 'total_amount')
	int totalAmount;	// 'total_amount'

	@JsonKey(name: 'invoice_payload')
	String invoicePayload;	// 'invoice_payload'

	@JsonKey(name: 'shipping_option_id', includeIfNull: false)
	String shippingOptionId;	// 'shipping_option_id' (optional)

	@JsonKey(name: 'order_info', includeIfNull: false)
	OrderInfo orderInfo;	// 'order_info' (optional)

	@JsonKey(name: 'telegram_payment_charge_id')
	String telegramPaymentChargeId;	// 'telegram_payment_charge_id'

	@JsonKey(name: 'provider_payment_charge_id')
	String providerPaymentChargeId;	// 'provider_payment_charge_id'

	// constructor
	SuccessfulPayment(this.currency, this.totalAmount, this.invoicePayload, this.telegramPaymentChargeId, this.providerPaymentChargeId, {
		this.shippingOptionId,
		this.orderInfo,
	});

	factory SuccessfulPayment.fromJson(Map<String, dynamic> json) => _$SuccessfulPaymentFromJson(json);

	Map<String, dynamic> toJson() => _$SuccessfulPaymentToJson(this);
}

/// OrderInfo is a struct of order info
///
/// https://core.telegram.org/bots/api#orderinfo
@JsonSerializable()
class OrderInfo {
	@JsonKey(includeIfNull: false)
	String name;	// 'name' (optional)

	@JsonKey(name: 'phone_number', includeIfNull: false)
	String phoneNumber;	// 'phone_number' (optional)

	@JsonKey(includeIfNull: false)
	String email;	// 'email' (optional)

	@JsonKey(name: 'shipping_address', includeIfNull: false)
	ShippingAddress shippingAddress;	// 'shipping_address' (optional)

	// constructor
	OrderInfo({
		this.name,
		this.phoneNumber,
		this.email,
		this.shippingAddress,
	});

	factory OrderInfo.fromJson(Map<String, dynamic> json) => _$OrderInfoFromJson(json);

	Map<String, dynamic> toJson() => _$OrderInfoToJson(this);
}

/// ShippingOption is a struct of an option of the shipping
///
/// https://core.telegram.org/bots/api#shippingoption
@JsonSerializable()
class ShippingOption {
	String id;	// 'id'

	String title;	// 'title'

	List<LabeledPrice> prices;	// 'prices'

	// constructor
	ShippingOption(this.id, this.title, this.prices);

	factory ShippingOption.fromJson(Map<String, dynamic> json) => _$ShippingOptionFromJson(json);

	Map<String, dynamic> toJson() => _$ShippingOptionToJson(this);
}

/// LabeledPrice is a struct of labeled prices
///
/// https://core.telegram.org/bots/api#labeledprice
@JsonSerializable()
class LabeledPrice {
	String label;	// 'label'

	int amount;	// 'amount'

	// constructor
	LabeledPrice(this.label, this.amount);

	factory LabeledPrice.fromJson(Map<String, dynamic> json) => _$LabeledPriceFromJson(json);

	Map<String, dynamic> toJson() => _$LabeledPriceToJson(this);
}

/// ShippingAddress is a struct of shipping address
///
/// https://core.telegram.org/bots/api#shippingaddress
@JsonSerializable()
class ShippingAddress {
	@JsonKey(name: 'country_code')
	String countryCode;	// 'country_code'

	String state;	// 'state'

	String city;	// 'city'

	@JsonKey(name: 'street_line1')
	String streetLine1;	// 'street_line1'

	@JsonKey(name: 'street_line2')
	String streetLine2;	// 'street_line2'

	@JsonKey(name: 'post_code')
	String postCode;	// 'post_code'

	// constructor
	ShippingAddress(this.countryCode, this.state, this.city, this.streetLine1, this.streetLine2, this.postCode);

	factory ShippingAddress.fromJson(Map<String, dynamic> json) => _$ShippingAddressFromJson(json);

	Map<String, dynamic> toJson() => _$ShippingAddressToJson(this);
}
