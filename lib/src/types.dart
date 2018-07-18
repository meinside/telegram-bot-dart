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
	private,	// 'private'
	group,	// 'group'
	channel,	// 'channel'
}

/// ParseMode enumeration
enum ParseMode {
	Markdown,	// 'Markdown'
	HTML,	// 'HTML'
}

/// ChatAction enumeration
enum ChatAction {
	typing,	// 'typing'
	upload_photo,	// 'upload_photo'
	record_video,	// 'record_video'
	upload_video,	// 'upload_video'
	record_audio,	// 'record_audio'
	upload_audio,	// 'upload_audio'
	upload_document,	// 'upload_document'
	find_location,	// 'find_location'
	record_video_note,	// 'record_video_note'
	upload_video_note,	// 'upload_video_note'
}

/// InlineQueryResultType enumeration
enum InlineQueryResultType {
	article,	// 'article'
	photo,	// 'photo'
	gif,	// 'gif'
	mpeg4_gif,	// 'mpeg4_gif'
	video,	// 'video'
	audio,	// 'audio'
	voice,	// 'voice'
	document,	// 'document'
	location,	// 'location'
	venue,	// 'venue'
	contact,	// 'contact'
	sticker,	// 'sticker'
	game,	// 'game'
}

/// MessageEntityType is a type of MessageEntity
//
/// https://core.telegram.org/bots/api#messageentity
enum MessageEntityType {
	mention,	// 'mention'
	hashtag,	// 'hashtag'
	bot_command,	// 'bot_command'
	url,	// 'url'
	email,	// 'email'
	bold,	// 'bold'
	italic,	// 'italic'
	code,	// 'code'
	pre,	// 'pre'
	text_link,	// 'text_link'
	text_mention,	// 'text_mention'
}

/// ChatMemberStatus is a status of chat member
///
/// https://core.telegram.org/bots/api#chatmember
enum ChatMemberStatus {
	creator,	// 'creator'
	administrator,	// 'administrator'
	member,	// 'member'
	left,	// 'left'
	kicked,	// 'kicked'
}

/// MaskPositionPoint is a point in MaskPosition
///
/// https://core.telegram.org/bots/api#maskposition
enum MaskPositionPoint {
	forehead,	// 'forehead'
	eyes,	// 'eyes'
	mouth,	// 'mouth'
	chin,	// 'chin'
}

/// APIResponseParameters is parameters in API responses
///
/// https://core.telegram.org/bots/api#responseparameters
@JsonSerializable()
class APIResponseParameters extends Object with _$APIResponseParametersSerializerMixin {
	@JsonKey(name: 'migrate_to_chat_id', includeIfNull: false)
	int migrateToChatId;	// 'migrate_to_chat_id' (optional)

	@JsonKey(name: 'retry_after', includeIfNull: false)
	int retryAfter;	// 'retry_after' (optional)

	// constructor
	APIResponseParameters({this.migrateToChatId, this.retryAfter});

	factory APIResponseParameters.fromJson(Map<String, dynamic> json) => _$APIResponseParametersFromJson(json);
}

/// APIResponse is an API response
@JsonSerializable()
class APIResponse extends Object with _$APIResponseSerializerMixin {
	bool ok;	// 'ok'

	@JsonKey(includeIfNull: false)
	String description;	// 'description' (optional)

	@JsonKey(includeIfNull: false)
	APIResponseParameters parameters;	// 'parameters' (optional)

	// constructor
	APIResponse(this.ok, {this.description, this.parameters});

	// https://github.com/dart-lang/sdk/issues/15101
	APIResponse.workaround(this.ok, this.description, this.parameters);

	factory APIResponse.fromJson(Map<String, dynamic> json) => _$APIResponseFromJson(json);
}

/// APIResponseWebhookInfo is an API response with result type: [WebhookInfo]
@JsonSerializable()
class APIResponseWebhookInfo extends APIResponse with _$APIResponseWebhookInfoSerializerMixin {
	@JsonKey(includeIfNull: false)
	WebhookInfo result;	// 'result' (optional)

	// constructor
	APIResponseWebhookInfo(bool ok, {
		String description,
		APIResponseParameters parameters,
		this.result,
	}) : super.workaround(ok, description, parameters);	// https://github.com/dart-lang/sdk/issues/15101
	//}) : super(ok, description: description, parameters: parameters);

	factory APIResponseWebhookInfo.fromJson(Map<String, dynamic> json) => _$APIResponseWebhookInfoFromJson(json);
}

/// APIResponseUser is an API response with result type: [User]
@JsonSerializable()
class APIResponseUser extends APIResponse with _$APIResponseUserSerializerMixin {
	@JsonKey(includeIfNull: false)
	User result;	// 'result' (optional)

	// constructor
	APIResponseUser(bool ok, {
		String description,
		APIResponseParameters parameters,
		this.result,
	}) : super.workaround(ok, description, parameters);	// https://github.com/dart-lang/sdk/issues/15101
	//}) : super(ok, description: description, parameters: parameters);

	factory APIResponseUser.fromJson(Map<String, dynamic> json) => _$APIResponseUserFromJson(json);
}

/// APIResponseMessage is an API response with result type: [Message]
@JsonSerializable()
class APIResponseMessage extends APIResponse with _$APIResponseMessageSerializerMixin {
	@JsonKey(includeIfNull: false)
	Message result;	// 'result' (optional)

	// constructor
	APIResponseMessage(bool ok, {
		String description,
		APIResponseParameters parameters,
		this.result,
	}) : super.workaround(ok, description, parameters);	// https://github.com/dart-lang/sdk/issues/15101
	//}) : super(ok, description: description, parameters: parameters);

	factory APIResponseMessage.fromJson(Map<String, dynamic> json) => _$APIResponseMessageFromJson(json);
}

/// APIResponseMessages is an API response with result type: List<[Message]>
@JsonSerializable()
class APIResponseMessages extends APIResponse with _$APIResponseMessagesSerializerMixin {
	@JsonKey(includeIfNull: false)
	List<Message> result;	// 'result' (optional)

	// constructor
	APIResponseMessages(bool ok, {
		String description,
		APIResponseParameters parameters,
		this.result,
	}) : super.workaround(ok, description, parameters);	// https://github.com/dart-lang/sdk/issues/15101
	//}) : super(ok, description: description, parameters: parameters);

	factory APIResponseMessages.fromJson(Map<String, dynamic> json) => _$APIResponseMessagesFromJson(json);
}

/// APIResponseUserProfilePhotos is an API response with result type: [UserProfilePhotos]
@JsonSerializable()
class APIResponseUserProfilePhotos extends APIResponse with _$APIResponseUserProfilePhotosSerializerMixin {
	@JsonKey(includeIfNull: false)
	UserProfilePhotos result;	// 'result' (optional)

	// constructor
	APIResponseUserProfilePhotos(bool ok, {
		String description,
		APIResponseParameters parameters,
		this.result,
	}) : super.workaround(ok, description, parameters);	// https://github.com/dart-lang/sdk/issues/15101
	//}) : super(ok, description: description, parameters: parameters);

	factory APIResponseUserProfilePhotos.fromJson(Map<String, dynamic> json) => _$APIResponseUserProfilePhotosFromJson(json);
}

/// APIResponseFile is an API response with result type: [FileObject]
@JsonSerializable()
class APIResponseFile extends APIResponse with _$APIResponseFileSerializerMixin {
	@JsonKey(includeIfNull: false)
	FileObject result;	// 'result' (optional)

	// constructor
	APIResponseFile(bool ok, {
		String description,
		APIResponseParameters parameters,
		this.result,
	}) : super.workaround(ok, description, parameters);	// https://github.com/dart-lang/sdk/issues/15101
	//}) : super(ok, description: description, parameters: parameters);

	factory APIResponseFile.fromJson(Map<String, dynamic> json) => _$APIResponseFileFromJson(json);
}

/// APIResponseUpdates is an API response with result type [Update]
@JsonSerializable()
class APIResponseUpdates extends APIResponse with _$APIResponseUpdatesSerializerMixin {
	List<Update> result;	// 'result'

	// constructor
	APIResponseUpdates(bool ok, {
		String description,
		APIResponseParameters parameters,
		this.result,
	}) : super.workaround(ok, description, parameters);	// https://github.com/dart-lang/sdk/issues/15101
	//}) : super(ok, description: description, parameters: parameters);

	factory APIResponseUpdates.fromJson(Map<String, dynamic> json) => _$APIResponseUpdatesFromJson(json);
}

/// APIResponseChat is an API response with result type: [Chat]
@JsonSerializable()
class APIResponseChat extends APIResponse with _$APIResponseChatSerializerMixin {
	@JsonKey(includeIfNull: false)
	Chat result;	// 'result' (optional)

	// constructor
	APIResponseChat(bool ok, {
		String description,
		APIResponseParameters parameters,
		this.result,
	}) : super.workaround(ok, description, parameters);	// https://github.com/dart-lang/sdk/issues/15101
	//}) : super(ok, description: description, parameters: parameters);

	factory APIResponseChat.fromJson(Map<String, dynamic> json) => _$APIResponseChatFromJson(json);
}

/// APIResponseChatAdministrators is an API response with result type: List<[ChatMember]>
@JsonSerializable()
class APIResponseChatAdministrators extends APIResponse with _$APIResponseChatAdministratorsSerializerMixin {
	@JsonKey(includeIfNull: false)
	List<ChatMember> result;	// 'result' (optional)

	// constructor
	APIResponseChatAdministrators(bool ok, {
		String description,
		APIResponseParameters parameters,
		this.result,
	}) : super.workaround(ok, description, parameters);	// https://github.com/dart-lang/sdk/issues/15101
	//}) : super(ok, description: description, parameters: parameters);

	factory APIResponseChatAdministrators.fromJson(Map<String, dynamic> json) => _$APIResponseChatAdministratorsFromJson(json);
}

/// APIResponseChatMember is an API response with result type: [ChatMember]
@JsonSerializable()
class APIResponseChatMember extends APIResponse with _$APIResponseChatMemberSerializerMixin {
	@JsonKey(includeIfNull: false)
	ChatMember result;	// 'result' (optional)

	// constructor
	APIResponseChatMember(bool ok, {
		String description,
		APIResponseParameters parameters,
		this.result,
	}) : super.workaround(ok, description, parameters);	// https://github.com/dart-lang/sdk/issues/15101
	//}) : super(ok, description: description, parameters: parameters);

	factory APIResponseChatMember.fromJson(Map<String, dynamic> json) => _$APIResponseChatMemberFromJson(json);
}

/// APIResponseInt is an API response with result type: int
@JsonSerializable()
class APIResponseInt extends APIResponse with _$APIResponseIntSerializerMixin {
	@JsonKey(includeIfNull: false)
	int result;	// 'result' (optional)

	// constructor
	APIResponseInt(bool ok, {
		String description,
		APIResponseParameters parameters,
		this.result,
	}) : super.workaround(ok, description, parameters);	// https://github.com/dart-lang/sdk/issues/15101
	//}) : super(ok, description: description, parameters: parameters);

	factory APIResponseInt.fromJson(Map<String, dynamic> json) => _$APIResponseIntFromJson(json);
}

/// APIResponseString is an API response with result type: String
@JsonSerializable()
class APIResponseString extends APIResponse with _$APIResponseStringSerializerMixin {
	@JsonKey(includeIfNull: false)
	String result;	// 'result' (optional)

	// constructor
	APIResponseString(bool ok, {
		String description,
		APIResponseParameters parameters,
		this.result,
	}) : super.workaround(ok, description, parameters);	// https://github.com/dart-lang/sdk/issues/15101
	//}) : super(ok, description: description, parameters: parameters);

	factory APIResponseString.fromJson(Map<String, dynamic> json) => _$APIResponseStringFromJson(json);
}

/// APIResponseGameHighScores is an API response with result type: List<[GameHighScore]>
@JsonSerializable()
class APIResponseGameHighScores extends APIResponse with _$APIResponseGameHighScoresSerializerMixin {
	@JsonKey(includeIfNull: false)
	List<GameHighScore> result;	// 'result' (optional)

	// constructor
	APIResponseGameHighScores(bool ok, {
		String description,
		APIResponseParameters parameters,
		this.result,
	}) : super.workaround(ok, description, parameters);	// https://github.com/dart-lang/sdk/issues/15101
	//}) : super(ok, description: description, parameters: parameters);

	factory APIResponseGameHighScores.fromJson(Map<String, dynamic> json) => _$APIResponseGameHighScoresFromJson(json);
}

/// APIResponseStickerSet is an API response with result type: [StickerSet]
@JsonSerializable()
class APIResponseStickerSet extends APIResponse with _$APIResponseStickerSetSerializerMixin {
	@JsonKey(includeIfNull: false)
	StickerSet result;	// 'result' (optional)

	// constructor
	APIResponseStickerSet(bool ok, {
		String description,
		APIResponseParameters parameters,
		this.result,
	}) : super.workaround(ok, description, parameters);	// https://github.com/dart-lang/sdk/issues/15101
	//}) : super(ok, description: description, parameters: parameters);

	factory APIResponseStickerSet.fromJson(Map<String, dynamic> json) => _$APIResponseStickerSetFromJson(json);
}

/// UpdateType is a type of updates (for allowed_updates)
///
/// https://core.telegram.org/bots/api#setwebhook
/// https://core.telegram.org/bots/api#update
enum UpdateType {
	message,
	edited_message,
	channel_post,
	edited_channel_post,
	inline_query,
	chosen_inline_result,
	callback_query,
}

/// WebhookInfo is a struct of webhook info
///
/// https://core.telegram.org/bots/api#webhookinfo
@JsonSerializable()
class WebhookInfo extends Object with _$WebhookInfoSerializerMixin {
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
}

/// Update is a struct of an update
///
/// https://core.telegram.org/bots/api#update
@JsonSerializable()
class Update extends Object with _$UpdateSerializerMixin {
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
}

/// User is a struct of a user
///
/// https://core.telegram.org/bots/api#user
@JsonSerializable()
class User extends Object with _$UserSerializerMixin {
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
}

/// Chat is a struct of a chat
///
/// https://core.telegram.org/bots/api#chat
@JsonSerializable()
class Chat extends Object with _$ChatSerializerMixin {
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
}

/// InputMediaType is a type of InputMedia
enum InputMediaType {
	photo,
	video,
}

/// InputMedia represents the content of a media message to be sent.
///
/// https://core.telegram.org/bots/api#inputmedia
@JsonSerializable()
class InputMedia extends Object with _$InputMediaSerializerMixin {
	InputMediaType type;	// 'type'

	String media;	// 'media'

	@JsonKey(includeIfNull: false)
	String caption;	// 'caption' (optional)

	@JsonKey(name: 'parse_mode', includeIfNull: false)
	ParseMode parseMode;	// 'parse_mode' (optional)

	@JsonKey(includeIfNull: false)
	int width;	// 'width' (optional) - video only

	@JsonKey(includeIfNull: false)
	int height;	// 'height' (optional) - video only

	@JsonKey(includeIfNull: false)
	int duration;	// 'duration' (optional) - video only

	@JsonKey(name: 'supports_streaming', includeIfNull: false)
	bool supportsStreaming;	// 'supports_streaming' (optional) - video only

	// constructor
	InputMedia(this.type, this.media, {
		this.caption,
		this.parseMode,
		this.width,
		this.height,
		this.duration,
		this.supportsStreaming,
	});

	factory InputMedia.fromJson(Map<String, dynamic> json) => _$InputMediaFromJson(json);
}

/// InputFile represents contents of a file to be uploaded.
///
/// https://core.telegram.org/bots/api#inputfile
@JsonSerializable()
class InputFile extends Object with _$InputFileSerializerMixin {
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
	static InputFile createFromFilepath(String filepath) {
		return new InputFile(filepath: filepath);
	}

	/// generate an [InputFile] from given [url].
	static InputFile createFromUrl(String url) {
		return new InputFile(url: url);
	}

	/// generate an [InputFile] from given [bytes]
	static InputFile createFromBytes(List<int> bytes) {
		return new InputFile(bytes: bytes);
	}

	/// generate an [InputFile] from given [fileId]
	static InputFile createFromFileId(String fileId) {
		return new InputFile(fileId: fileId);
	}

	factory InputFile.fromJson(Map<String, dynamic> json) => _$InputFileFromJson(json);
}

/// Audio is a struct for an audio file
///
/// https://core.telegram.org/bots/api#audio
@JsonSerializable()
class Audio extends Object with _$AudioSerializerMixin {
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

	// constructor
	Audio(this.fileId, this.duration, {
		this.performer,
		this.title,
		this.mimeType,
		this.fileSize,
	});

	factory Audio.fromJson(Map<String, dynamic> json) => _$AudioFromJson(json);
}

/// MessageEntity is a struct of a message entity
///
/// https://core.telegram.org/bots/api#messageentity
@JsonSerializable()
class MessageEntity extends Object with _$MessageEntitySerializerMixin {
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
}

/// PhotoSize is a struct of a photo's size
///
/// https://core.telegram.org/bots/api#photosize
@JsonSerializable()
class PhotoSize extends Object with _$PhotoSizeSerializerMixin {
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
}

/// Document is a struct for an ordinary file
///
/// https://core.telegram.org/bots/api#document
@JsonSerializable()
class Document extends Object with _$DocumentSerializerMixin {
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
}

/// Sticker is a struct of a sticker
///
/// https://core.telegram.org/bots/api#sticker
@JsonSerializable()
class Sticker extends Object with _$StickerSerializerMixin {
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
}

/// StickerSet is a struct of a sticker set
///
/// https://core.telegram.org/bots/api#stickerset
@JsonSerializable()
class StickerSet extends Object with _$StickerSetSerializerMixin {
	String name;	// 'name'

	String title;	// 'title'

	@JsonKey(name: 'contains_masks')
	bool containsMasks;	// 'contains_masks'

	List<Sticker> stickers;	// 'stickers'

	// constructor
	StickerSet(this.name, this.title, this.containsMasks, this.stickers);

	factory StickerSet.fromJson(Map<String, dynamic> json) => _$StickerSetFromJson(json);
}

/// MaskPosition is a struct for a mask position
///
/// https://core.telegram.org/bots/api#maskposition
@JsonSerializable()
class MaskPosition extends Object with _$MaskPositionSerializerMixin {
	MaskPositionPoint point;	// 'point'

	@JsonKey(name: 'x_shift')
	double xShift;	// 'x_shift'

	@JsonKey(name: 'y_shift')
	double yShift;	// 'y_shift'

	double scale;	// 'scale'

	// constructor
	MaskPosition(this.point, this.xShift, this.yShift, this.scale);

	factory MaskPosition.fromJson(Map<String, dynamic> json) => _$MaskPositionFromJson(json);
}

/// Video is a struct for a video file
///
/// https://core.telegram.org/bots/api#video
@JsonSerializable()
class Video extends Object with _$VideoSerializerMixin {
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
}

/// Voice is a struct for a voice file
///
/// https://core.telegram.org/bots/api#voice
@JsonSerializable()
class Voice extends Object with _$VoiceSerializerMixin {
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
}

/// VideoNote is a struct for a video note
///
/// https://core.telegram.org/bots/api#videonote
@JsonSerializable()
class VideoNote extends Object with _$VideoNoteSerializerMixin {
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
}

/// Contact is a struct for a contact info
///
/// https://core.telegram.org/bots/api#contact
@JsonSerializable()
class Contact extends Object with _$ContactSerializerMixin {
	@JsonKey(name: 'phone_number')
	String phoneNumber;	// 'phone_number'

	@JsonKey(name: 'first_name')
	String firstName;	// 'first_name'

	@JsonKey(name: 'last_name', includeIfNull: false)
	String lastName;	// 'last_name' (optional)

	@JsonKey(name: 'user_id', includeIfNull: false)
	int userId;	// 'user_id' (optional)

	// constructor
	Contact(this.phoneNumber, this.firstName, {
		this.lastName,
		this.userId,
	});

	factory Contact.fromJson(Map<String, dynamic> json) => _$ContactFromJson(json);
}

/// Location is a struct for a location
///
/// https://core.telegram.org/bots/api#location
@JsonSerializable()
class Location extends Object with _$LocationSerializerMixin {
	double longitude;	// 'longitude'

	double latitude;	// 'latitude'

	// constructor
	Location(this.longitude, this.latitude);

	factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
}

/// Venue is a struct of a venue
///
/// https://core.telegram.org/bots/api#venue
@JsonSerializable()
class Venue extends Object with _$VenueSerializerMixin {
	Location location;	// 'location'

	String title;	// 'title'

	String address;	// 'address'

	@JsonKey(name: 'foursquare_id', includeIfNull: false)
	String foursquareId;	// 'foursquare_id' (optional)

	// constructor
	Venue(this.location, this.title, this.address, {
		this.foursquareId,
	});

	factory Venue.fromJson(Map<String, dynamic> json) => _$VenueFromJson(json);
}

/// UserProfilePhotos is a struct for user profile photos
///
/// https://core.telegram.org/bots/api#userprofilephotos
@JsonSerializable()
class UserProfilePhotos extends Object with _$UserProfilePhotosSerializerMixin {
	@JsonKey(name: 'total_count')
	int totalCount;	// 'total_count'

	List<List<PhotoSize>> photos;	// 'photos'

	// constructor
	UserProfilePhotos(this.totalCount, this.photos);

	factory UserProfilePhotos.fromJson(Map<String, dynamic> json) => _$UserProfilePhotosFromJson(json);
}

/// FileObject is a struct for a file
///
/// https://core.telegram.org/bots/api#file
@JsonSerializable()
class FileObject extends Object with _$FileObjectSerializerMixin {
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
}

/// ReplyMarkup is a base struct of [InlineKeyboardMarkup], [ReplyKeyboardMarkup], [ReplyKeyboardRemove], and [ForceReply].
@JsonSerializable()
class ReplyMarkup extends Object with _$ReplyMarkupSerializerMixin {
	// constructor
	ReplyMarkup();

	factory ReplyMarkup.fromJson(Map<String, dynamic> json) => _$ReplyMarkupFromJson(json);
}

/// ReplyKeyboardMarkup is a struct for reply keyboard markups
///
/// https://core.telegram.org/bots/api#replykeyboardmarkup
@JsonSerializable()
class ReplyKeyboardMarkup extends ReplyMarkup with _$ReplyKeyboardMarkupSerializerMixin {
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
}

/// KeyboardButton is a struct of a keyboard button
///
/// https://core.telegram.org/bots/api#keyboardbutton
@JsonSerializable()
class KeyboardButton extends Object with _$KeyboardButtonSerializerMixin {
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
}

/// ReplyKeyboardRemove is a struct for ReplyKeyboardRemove
///
/// https://core.telegram.org/bots/api#replykeyboardremove
@JsonSerializable()
class ReplyKeyboardRemove extends ReplyMarkup with _$ReplyKeyboardRemoveSerializerMixin {
	@JsonKey(name: 'remove_keyboard')
	bool removeKeyboard;	// 'remove_keyboard'

	@JsonKey(includeIfNull: false)
	bool selective;	// 'selective' (optional)

	// constructor
	ReplyKeyboardRemove(this.removeKeyboard, {
		this.selective,
	});

	factory ReplyKeyboardRemove.fromJson(Map<String, dynamic> json) => _$ReplyKeyboardRemoveFromJson(json);
}

/// InlineKeyboardMarkup is a struct for InlineKeyboardMarkup
///
/// https://core.telegram.org/bots/api#inlinekeyboardmarkup
@JsonSerializable()
class InlineKeyboardMarkup extends ReplyMarkup with _$InlineKeyboardMarkupSerializerMixin {
	@JsonKey(name: 'inline_keyboard')
	List<List<InlineKeyboardButton>> inlineKeyboard;	// 'inline_keyboard'

	// constructor
	InlineKeyboardMarkup(this.inlineKeyboard);

	factory InlineKeyboardMarkup.fromJson(Map<String, dynamic> json) => _$InlineKeyboardMarkupFromJson(json);
}

/// InlineKeyboardButton is a struct for InlineKeyboardButtons
///
/// https://core.telegram.org/bots/api#inlinekeyboardbutton
@JsonSerializable()
class InlineKeyboardButton extends Object with _$InlineKeyboardButtonSerializerMixin {
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
}

/// CallbackQuery is a struct for a callback query
///
/// https://core.telegram.org/bots/api#callbackquery
@JsonSerializable()
class CallbackQuery extends Object with _$CallbackQuerySerializerMixin {
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
}

/// ShippingQuery is a struct for a shipping query
///
/// https://core.telegram.org/bots/api#shippingquery
@JsonSerializable()
class ShippingQuery extends Object with _$ShippingQuerySerializerMixin {
	String id;	// 'id'

	User from;	// 'from'

	@JsonKey(name: 'invoice_payload')
	String invoicePayload;	// 'invoice_payload'

	@JsonKey(name: 'shipping_address')
	ShippingAddress shippingAddress;	// 'shipping_address'

	// constructor
	ShippingQuery(this.id, this.from, this.invoicePayload, this.shippingAddress);

	factory ShippingQuery.fromJson(Map<String, dynamic> json) => _$ShippingQueryFromJson(json);
}

/// PreCheckoutQuery is a struct for a precheckout query
///
/// https://core.telegram.org/bots/api#precheckoutquery
@JsonSerializable()
class PreCheckoutQuery extends Object with _$PreCheckoutQuerySerializerMixin {
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
}

/// ForceReply is a struct for force-reply
///
/// https://core.telegram.org/bots/api#forcereply
@JsonSerializable()
class ForceReply extends ReplyMarkup with _$ForceReplySerializerMixin {
	@JsonKey(name: 'force_reply')
	bool forceReply;	// 'force_reply'

	@JsonKey(includeIfNull: false)
	bool selective;	// 'selective' (optional)

	// constructor
	ForceReply(this.forceReply, {this.selective});

	factory ForceReply.fromJson(Map<String, dynamic> json) => _$ForceReplyFromJson(json);
}

/// ChatPhoto is a struct for a chat photo
///
/// https://core.telegram.org/bots/api#chatphoto
@JsonSerializable()
class ChatPhoto extends Object with _$ChatPhotoSerializerMixin {
	@JsonKey(name: 'small_file_id')
	String smallFileId;	// 'small_file_id'

	@JsonKey(name: 'big_file_id')
	String bigFileId;	// 'big_file_id'

	// constructor
	ChatPhoto(this.smallFileId, this.bigFileId);

	factory ChatPhoto.fromJson(Map<String, dynamic> json) => _$ChatPhotoFromJson(json);
}

/// ChatMember is a struct of a chat member
///
/// https://core.telegram.org/bots/api#chatmember
@JsonSerializable()
class ChatMember extends Object with _$ChatMemberSerializerMixin {
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
}

/// Message is a struct of a message
///
/// https://core.telegram.org/bots/api#message
@JsonSerializable()
class Message extends Object with _$MessageSerializerMixin {
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

	factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);

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
}

/// InlineQuery is a struct of an inline query
///
/// https://core.telegram.org/bots/api#inlinequery
@JsonSerializable()
class InlineQuery extends Object with _$InlineQuerySerializerMixin {
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
}

/// ChosenInlineResult is a struct for a chosen inline result
///
/// https://core.telegram.org/bots/api#choseninlineresult
@JsonSerializable()
class ChosenInlineResult extends Object with _$ChosenInlineResultSerializerMixin {
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
}

/// VideoMimeType is a video mime type for an inline query
enum VideoMimeType {
	text_html,	// 'text/html'
	video_mp4,	// 'video/mp4'
}

/// DocumentMimeType is a document mime type for an inline query
enum DocumentMimeType {
	application_pdf,	// 'application/pdf'
	application_zip,	// 'application/zip'
}

/// InlineQueryResult is a struct for inline query results
///
/// https://core.telegram.org/bots/api#inlinequeryresult
@JsonSerializable()
class InlineQueryResult extends Object with _$InlineQueryResultSerializerMixin {
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
}

/// InlineQueryResultArticle is a struct for InlineQueryResultArticle
///
/// https://core.telegram.org/bots/api#inlinequeryresultarticle
@JsonSerializable()
class InlineQueryResultArticle extends InlineQueryResult with _$InlineQueryResultArticleSerializerMixin {
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
	}) : super(InlineQueryResultType.article, InlineQueryResult.generateUuid());

	// helper function
	static InlineQueryResultArticle create(String title, String messageText, String description) {
		InlineQueryResultArticle article = new InlineQueryResultArticle(
				title,
				new InputTextMessageContent(messageText),
				description: description);

		return article;
	}

	factory InlineQueryResultArticle.fromJson(Map<String, dynamic> json) => _$InlineQueryResultArticleFromJson(json);
}

/// InlineQueryResultPhoto is a struct for InlineQueryResultPhoto
///
/// Photo must be in jpeg format, < 5MB.
///
/// https://core.telegram.org/bots/api#inlinequeryresultphoto
@JsonSerializable()
class InlineQueryResultPhoto extends InlineQueryResult with _$InlineQueryResultPhotoSerializerMixin {
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
	}) : super(InlineQueryResultType.photo, InlineQueryResult.generateUuid());

	// helper function
	static InlineQueryResultPhoto create(String photoUrl, String thumbUrl) {
		return new InlineQueryResultPhoto(photoUrl, thumbUrl);
	}

	factory InlineQueryResultPhoto.fromJson(Map<String, dynamic> json) => _$InlineQueryResultPhotoFromJson(json);
}

/// InlineQueryResultGif is a struct for InlineQueryResultGif
///
/// Gif must be in gif format, < 1MB.
///
/// https://core.telegram.org/bots/api#inlinequeryresultgif
@JsonSerializable()
class InlineQueryResultGif extends InlineQueryResult with _$InlineQueryResultGifSerializerMixin {
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
	}) : super(InlineQueryResultType.gif, InlineQueryResult.generateUuid());

	// helper function
	static InlineQueryResultGif create(String gifUrl, String thumbUrl) {
		return new InlineQueryResultGif(gifUrl, thumbUrl);
	}

	factory InlineQueryResultGif.fromJson(Map<String, dynamic> json) => _$InlineQueryResultGifFromJson(json);
}

/// InlineQueryResultMpeg4Gif is a struct for InlineQueryResultMpeg4Gif
///
/// Mpeg4 must be in H.264/MPEG-4 AVC video(wihout sound) format, < 1MB.
///
/// https://core.telegram.org/bots/api#inlinequeryresultmpeg4gif
@JsonSerializable()
class InlineQueryResultMpeg4Gif extends InlineQueryResult with _$InlineQueryResultMpeg4GifSerializerMixin {
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
	}) : super(InlineQueryResultType.mpeg4_gif, InlineQueryResult.generateUuid());

	// helper function
	static InlineQueryResultMpeg4Gif create(String mpeg4Url, String thumbUrl) {
		return new InlineQueryResultMpeg4Gif(mpeg4Url, thumbUrl);
	}

	factory InlineQueryResultMpeg4Gif.fromJson(Map<String, dynamic> json) => _$InlineQueryResultMpeg4GifFromJson(json);
}

/// InlineQueryResultVideo is a struct of InlineQueryResultVideo
///
/// https://core.telegram.org/bots/api#inlinequeryresultvideo
@JsonSerializable()
class InlineQueryResultVideo extends InlineQueryResult with _$InlineQueryResultVideoSerializerMixin {
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
	}) : super(InlineQueryResultType.video, InlineQueryResult.generateUuid());

	// helper function
	static InlineQueryResultVideo create(String videoUrl, VideoMimeType mimeType, String thumbUrl, String title) {
		return new InlineQueryResultVideo(videoUrl, mimeType, thumbUrl, title);
	}

	factory InlineQueryResultVideo.fromJson(Map<String, dynamic> json) => _$InlineQueryResultVideoFromJson(json);
}

/// InlineQueryResultAudio is a struct of InlineQueryResultAudio
///
/// https://core.telegram.org/bots/api#inlinequeryresultaudio
@JsonSerializable()
class InlineQueryResultAudio extends InlineQueryResult with _$InlineQueryResultAudioSerializerMixin {
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
	}) : super(InlineQueryResultType.audio, InlineQueryResult.generateUuid());

	// helper function
	static InlineQueryResultAudio create(String audioUrl, String title) {
		return new InlineQueryResultAudio(audioUrl, title);
	}

	factory InlineQueryResultAudio.fromJson(Map<String, dynamic> json) => _$InlineQueryResultAudioFromJson(json);
}

/// InlineQueryResultVoice is a struct of InlineQueryResultVoice
///
/// https://core.telegram.org/bots/api#inlinequeryresultvoice
@JsonSerializable()
class InlineQueryResultVoice extends InlineQueryResult with _$InlineQueryResultVoiceSerializerMixin {
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
	}) : super(InlineQueryResultType.voice, InlineQueryResult.generateUuid());

	// helper function
	static InlineQueryResultVoice create(String voiceUrl, String title) {
		return new InlineQueryResultVoice(voiceUrl, title);
	}

	factory InlineQueryResultVoice.fromJson(Map<String, dynamic> json) => _$InlineQueryResultVoiceFromJson(json);
}

/// InlineQueryResultDocument is a struct of InlineQueryResultDocument
///
/// https://core.telegram.org/bots/api#inlinequeryresultdocument
@JsonSerializable()
class InlineQueryResultDocument extends InlineQueryResult with _$InlineQueryResultDocumentSerializerMixin {
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
	}) : super(InlineQueryResultType.document, InlineQueryResult.generateUuid());

	// helper function
	static InlineQueryResultDocument create(String title, String documentUrl, DocumentMimeType mimeType) {
		return new InlineQueryResultDocument(title, documentUrl, mimeType);
	}

	factory InlineQueryResultDocument.fromJson(Map<String, dynamic> json) => _$InlineQueryResultDocumentFromJson(json);
}

/// InlineQueryResultLocation is a struct of InlineQueryResultLocation
///
/// https://core.telegram.org/bots/api#inlinequeryresultlocation
@JsonSerializable()
class InlineQueryResultLocation extends InlineQueryResult with _$InlineQueryResultLocationSerializerMixin {
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
	}) : super(InlineQueryResultType.location, InlineQueryResult.generateUuid());

	// helper function
	static InlineQueryResultLocation create(double latitude, double longitude, String title) {
		return new InlineQueryResultLocation(latitude, longitude, title);
	}

	factory InlineQueryResultLocation.fromJson(Map<String, dynamic> json) => _$InlineQueryResultLocationFromJson(json);
}

/// InlineQueryResultVenue is a struct of InlineQueryResultVenue
///
/// https://core.telegram.org/bots/api#inlinequeryresultvenue
@JsonSerializable()
class InlineQueryResultVenue extends InlineQueryResult with _$InlineQueryResultVenueSerializerMixin {
	double latitude;	// 'latitude'

	double longitude;	// 'longitude'

	String title;	// 'title'

	String address;	// 'address'

	@JsonKey(name: 'foursquare_id', includeIfNull: false)
	String foursquareId;	// 'foursquare_id' (optional)

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
		this.replyMarkup,
		this.inputMessageContent,
		this.thumbUrl,
		this.thumbWidth,
		this.thumbHeight,
	}) : super(InlineQueryResultType.venue, InlineQueryResult.generateUuid());

	// helper function
	static InlineQueryResultVenue create(double latitude, double longitude, String title, String address) {
		return new InlineQueryResultVenue(latitude, longitude, title, address);
	}

	factory InlineQueryResultVenue.fromJson(Map<String, dynamic> json) => _$InlineQueryResultVenueFromJson(json);
}

/// InlineQueryResultContact is a struct of InlineQueryResultContact
///
/// https://core.telegram.org/bots/api#inlinequeryresultcontact
@JsonSerializable()
class InlineQueryResultContact extends InlineQueryResult with _$InlineQueryResultContactSerializerMixin {
	@JsonKey(name: 'phone_number')
	String phoneNumber;	// 'phone_number'

	@JsonKey(name: 'first_name')
	String firstName;	// 'first_name'

	@JsonKey(name: 'last_name', includeIfNull: false)
	String lastName;	// 'last_name' (optional)

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
		this.replyMarkup,
		this.inputMessageContent,
		this.thumbUrl,
		this.thumbWidth,
		this.thumbHeight,
	}) : super(InlineQueryResultType.contact, InlineQueryResult.generateUuid());

	// helper function
	static InlineQueryResultContact create(String phoneNumber, String firstName) {
		return new InlineQueryResultContact(phoneNumber, firstName);
	}

	factory InlineQueryResultContact.fromJson(Map<String, dynamic> json) => _$InlineQueryResultContactFromJson(json);
}

/// InlineQueryResultGame is a struct of InlineQueryResultGame
///
/// https://core.telegram.org/bots/api#inlinequeryresultgame
@JsonSerializable()
class InlineQueryResultGame extends InlineQueryResult with _$InlineQueryResultGameSerializerMixin {
	@JsonKey(name: 'game_short_name')
	String gameShortName;	// 'game_short_name'

	@JsonKey(name: 'reply_markup', includeIfNull: false)
	InlineKeyboardMarkup replyMarkup;	// 'reply_markup' (optional)

	// constructor
	InlineQueryResultGame(this.gameShortName, {
		this.replyMarkup,
	}) : super(InlineQueryResultType.game, InlineQueryResult.generateUuid());

	// helper function
	static InlineQueryResultGame create(String gameShortName) {
		return new InlineQueryResultGame(gameShortName);
	}

	factory InlineQueryResultGame.fromJson(Map<String, dynamic> json) => _$InlineQueryResultGameFromJson(json);
}

/// InlineQueryResultCachedPhoto is a struct of InlineQueryResultCachedPhoto
///
/// https://core.telegram.org/bots/api#inlinequeryresultcachedphoto
@JsonSerializable()
class InlineQueryResultCachedPhoto extends InlineQueryResult with _$InlineQueryResultCachedPhotoSerializerMixin {
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
	}) : super(InlineQueryResultType.photo, InlineQueryResult.generateUuid());

	// helper function
	static InlineQueryResultCachedPhoto create(String photoFileId) {
		return new InlineQueryResultCachedPhoto(photoFileId);
	}

	factory InlineQueryResultCachedPhoto.fromJson(Map<String, dynamic> json) => _$InlineQueryResultCachedPhotoFromJson(json);
}

/// InlineQueryResultCachedGif is a struct of InlineQueryResultCachedGif
///
/// https://core.telegram.org/bots/api#inlinequeryresultcachedgif
@JsonSerializable()
class InlineQueryResultCachedGif extends InlineQueryResult with _$InlineQueryResultCachedGifSerializerMixin {
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
	}) : super(InlineQueryResultType.gif, InlineQueryResult.generateUuid());

	// helper function
	static InlineQueryResultCachedGif create(String gifFileId) {
		return new InlineQueryResultCachedGif(gifFileId);
	}

	factory InlineQueryResultCachedGif.fromJson(Map<String, dynamic> json) => _$InlineQueryResultCachedGifFromJson(json);
}

/// InlineQueryResultCachedMpeg4Gif is a struct of InlineQueryResultCachedMpeg4Gif
///
/// https://core.telegram.org/bots/api#inlinequeryresultcachedmpeg4gif
@JsonSerializable()
class InlineQueryResultCachedMpeg4Gif extends InlineQueryResult with _$InlineQueryResultCachedMpeg4GifSerializerMixin {
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
	}) : super(InlineQueryResultType.mpeg4_gif, InlineQueryResult.generateUuid());

	// helper function
	static InlineQueryResultCachedMpeg4Gif create(String mpeg4FileId) {
		return new InlineQueryResultCachedMpeg4Gif(mpeg4FileId);
	}

	factory InlineQueryResultCachedMpeg4Gif.fromJson(Map<String, dynamic> json) => _$InlineQueryResultCachedMpeg4GifFromJson(json);
}

/// InlineQueryResultCachedSticker is a struct of InlineQueryResultCachedSticker
///
/// https://core.telegram.org/bots/api#inlinequeryresultcachedsticker
@JsonSerializable()
class InlineQueryResultCachedSticker extends InlineQueryResult with _$InlineQueryResultCachedStickerSerializerMixin {
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
	}) : super(InlineQueryResultType.sticker, InlineQueryResult.generateUuid());

	// helper function
	static InlineQueryResultCachedSticker create(String stickerFileId) {
		return new InlineQueryResultCachedSticker(stickerFileId);
	}

	factory InlineQueryResultCachedSticker.fromJson(Map<String, dynamic> json) => _$InlineQueryResultCachedStickerFromJson(json);
}

/// InlineQueryResultCachedDocument is a struct of InlineQueryResultCachedDocument
///
/// https://core.telegram.org/bots/api#inlinequeryresultcacheddocument
@JsonSerializable()
class InlineQueryResultCachedDocument extends InlineQueryResult with _$InlineQueryResultCachedDocumentSerializerMixin {
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
	}) : super(InlineQueryResultType.document, InlineQueryResult.generateUuid());

	// helper function
	static InlineQueryResultCachedDocument create(String documentFileId, String title) {
		return new InlineQueryResultCachedDocument(documentFileId, title);
	}

	factory InlineQueryResultCachedDocument.fromJson(Map<String, dynamic> json) => _$InlineQueryResultCachedDocumentFromJson(json);
}

/// InlineQueryResultCachedVideo is a struct of InlineQueryResultCachedVideo
///
/// https://core.telegram.org/bots/api#inlinequeryresultcachedvideo
@JsonSerializable()
class InlineQueryResultCachedVideo extends InlineQueryResult with _$InlineQueryResultCachedVideoSerializerMixin {
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
	}) : super(InlineQueryResultType.video, InlineQueryResult.generateUuid());

	// helper function
	static InlineQueryResultCachedVideo create(String videoFileId, String title) {
		return new InlineQueryResultCachedVideo(videoFileId, title);
	}

	factory InlineQueryResultCachedVideo.fromJson(Map<String, dynamic> json) => _$InlineQueryResultCachedVideoFromJson(json);
}

/// InlineQueryResultCachedVoice is a struct of InlineQueryResultCachedVoice
///
/// https://core.telegram.org/bots/api#inlinequeryresultcachedvoice
@JsonSerializable()
class InlineQueryResultCachedVoice extends InlineQueryResult with _$InlineQueryResultCachedVoiceSerializerMixin {
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
	}) : super(InlineQueryResultType.voice, InlineQueryResult.generateUuid());

	// helper function
	static InlineQueryResultCachedVoice create(String voiceFileId, String title) {
		return new InlineQueryResultCachedVoice(voiceFileId, title);
	}

	factory InlineQueryResultCachedVoice.fromJson(Map<String, dynamic> json) => _$InlineQueryResultCachedVoiceFromJson(json);
}

/// InlineQueryResultCachedAudio is a struct of InlineQueryResultCachedAudio
///
/// https://core.telegram.org/bots/api#inlinequeryresultcachedaudio
@JsonSerializable()
class InlineQueryResultCachedAudio extends InlineQueryResult with _$InlineQueryResultCachedAudioSerializerMixin {
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
	}) : super(InlineQueryResultType.audio, InlineQueryResult.generateUuid());

	// helper function
	static InlineQueryResultCachedAudio create(String audioFileId) {
		return new InlineQueryResultCachedAudio(audioFileId);
	}

	factory InlineQueryResultCachedAudio.fromJson(Map<String, dynamic> json) => _$InlineQueryResultCachedAudioFromJson(json);
}

/// InputMessageContent is a generic type of input message content types
///
/// https://core.telegram.org/bots/api#inputmessagecontent
@JsonSerializable()
class InputMessageContent extends Object with _$InputMessageContentSerializerMixin {
	InputMessageContent();

	factory InputMessageContent.fromJson(Map<String, dynamic> json) => _$InputMessageContentFromJson(json);
}

/// InputTextMessageContent is a struct of InputTextMessageContent
///
/// https://core.telegram.org/bots/api#inputtextmessagecontent
@JsonSerializable()
class InputTextMessageContent extends InputMessageContent with _$InputTextMessageContentSerializerMixin {
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
}

/// InputLocationMessageContent is a struct of InputLocationMessageContent
///
/// https://core.telegram.org/bots/api#inputlocationmessagecontent
@JsonSerializable()
class InputLocationMessageContent extends InputMessageContent with _$InputLocationMessageContentSerializerMixin {
	double latitude;	// 'latitude'

	double longitude;	// 'longitude'

	// constructor
	InputLocationMessageContent(this.latitude, this.longitude);

	factory InputLocationMessageContent.fromJson(Map<String, dynamic> json) => _$InputLocationMessageContentFromJson(json);
}

/// InputVenueMessageContent is a struct of InputVenueMessageContent
///
/// https://core.telegram.org/bots/api#inputvenuemessagecontent
@JsonSerializable()
class InputVenueMessageContent extends InputMessageContent with _$InputVenueMessageContentSerializerMixin {
	double latitude;	// 'latitude'

	double longitude;	// 'longitude'

	String title;	// 'title'

	String address;	// 'address'

	@JsonKey(name: 'foursquare_id', includeIfNull: false)
	String foursquareId;	// 'foursquare_id' (optional)

	// constructor
	InputVenueMessageContent(this.latitude, this.longitude, this.title, this.address, {
		this.foursquareId,
	});

	factory InputVenueMessageContent.fromJson(Map<String, dynamic> json) => _$InputVenueMessageContentFromJson(json);
}

/// InputContactMessageContent is a struct of InputContactMessageContent
///
/// https://core.telegram.org/bots/api#inputcontactmessagecontent
@JsonSerializable()
class InputContactMessageContent extends InputMessageContent with _$InputContactMessageContentSerializerMixin {
	@JsonKey(name: 'phone_number')
	String phoneNumber;	// 'phone_number'

	@JsonKey(name: 'first_name')
	String firstName;	// 'first_name'

	@JsonKey(name: 'last_name', includeIfNull: false)
	String lastName;	// 'last_name' (optional)

	// constructor
	InputContactMessageContent(this.phoneNumber, this.firstName, {
		this.lastName,
	});

	factory InputContactMessageContent.fromJson(Map<String, dynamic> json) => _$InputContactMessageContentFromJson(json);
}

/// CallbackGame is for callback of games
///
/// https://core.telegram.org/bots/api#callbackgame
@JsonSerializable()
class CallbackGame extends Object with _$CallbackGameSerializerMixin {
	// constructor
	CallbackGame();

	factory CallbackGame.fromJson(Map<String, dynamic> json) => _$CallbackGameFromJson(json);
}

/// Game is a struct of Game
///
/// https://core.telegram.org/bots/api#game
@JsonSerializable()
class Game extends Object with _$GameSerializerMixin {
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
}

/// Animation is a struct of Animation
///
/// https://core.telegram.org/bots/api#animation
@JsonSerializable()
class Animation extends Object with _$AnimationSerializerMixin {
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
}

/// GameHighScore is a struct of GameHighScore
///
/// https://core.telegram.org/bots/api#gamehighscore
@JsonSerializable()
class GameHighScore extends Object with _$GameHighScoreSerializerMixin {
	int position;	// 'position'

	User user;	// 'user'

	int score;	// 'score'
	
	// constructor
	GameHighScore(this.position, this.user, this.score);

	factory GameHighScore.fromJson(Map<String, dynamic> json) => _$GameHighScoreFromJson(json);
}

/// Invoice is a struct of Invoice
///
/// https://core.telegram.org/bots/api#invoice
@JsonSerializable()
class Invoice extends Object with _$InvoiceSerializerMixin {
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
}

/// SuccessfulPayment is a struct of successful payments
///
/// https://core.telegram.org/bots/api#successfulpayment
@JsonSerializable()
class SuccessfulPayment extends Object with _$SuccessfulPaymentSerializerMixin {
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
}

/// OrderInfo is a struct of order info
///
/// https://core.telegram.org/bots/api#orderinfo
@JsonSerializable()
class OrderInfo extends Object with _$OrderInfoSerializerMixin {
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
}

/// ShippingOption is a struct of an option of the shipping
///
/// https://core.telegram.org/bots/api#shippingoption
@JsonSerializable()
class ShippingOption extends Object with _$ShippingOptionSerializerMixin {
	String id;	// 'id'

	String title;	// 'title'

	List<LabeledPrice> prices;	// 'prices'

	// constructor
	ShippingOption(this.id, this.title, this.prices);

	factory ShippingOption.fromJson(Map<String, dynamic> json) => _$ShippingOptionFromJson(json);
}

/// LabeledPrice is a struct of labeled prices
///
/// https://core.telegram.org/bots/api#labeledprice
@JsonSerializable()
class LabeledPrice extends Object with _$LabeledPriceSerializerMixin {
	String label;	// 'label'

	int amount;	// 'amount'

	// constructor
	LabeledPrice(this.label, this.amount);

	factory LabeledPrice.fromJson(Map<String, dynamic> json) => _$LabeledPriceFromJson(json);
}

/// ShippingAddress is a struct of shipping address
///
/// https://core.telegram.org/bots/api#shippingaddress
@JsonSerializable()
class ShippingAddress extends Object with _$ShippingAddressSerializerMixin {
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
}
