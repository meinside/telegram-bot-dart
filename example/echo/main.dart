// example/echo/main.dart
//
// A sample bot which echoes back all received messages.

import '../../lib/telegram.dart';

import 'dart:convert';

// NOTE: Edit this value to yours.
const String _tokenForTesting = "1234567890:put_your_token_here";

// NOTE: Set this to 'true' for verbose messages.
const bool _isVerbose = false;

const String _imageFilepath = "./we_will_be_back_soon.png";

String _jsonToString(Object json) {
  return jsonEncode(json);
}

main() async {
  Bot bot = Bot.create(_tokenForTesting);
  bot.verbose = _isVerbose;

  var me = await bot.getMe();
  if (me.ok) {
    print("Starting bot: @${me.result.username} ...");

    // polling updates
    await for (Update update in bot.monitorUpdates(interval: 3)) {
      print("> @${update.message.from.username}"
          " sent a message: '${_jsonToString(update.message)}'");

      // NOTE: functions are called asynchronously here, so echoed messages may not be in order.
      var message = update.message;
      if (message.text != null) {
        // text message
        print(">> received text: '${message.text}'");

        try {
          // send 'typing...'
          bot.sendChatAction(message.chat.id, ChatAction.Typing).then((APIResponseBool response) {
            if (!response.ok) {
              print("** sendChatAction failed: ${response.description}");
            }

            // echo received message back (synchronously)
            bot.sendMessage(message.chat.id, message.text,
                replyToMessageId: message.messageId).then((APIResponseMessage response) {
              if (response.ok) {
                print("<< echoed back: '${message.text}'");
              } else {
                print("** sendMessage failed: ${response.description}");
              }
            });
          });
        } catch (e, stackTrace) {
          print("** exception while sendMessage: ${e}\n${stackTrace}");
        }
      } else if (message.photo != null) {
        // photo
        print(">> received photo: ${_jsonToString(message.photo)}");

        try {
          // send 'uploading photo...'
          bot.sendChatAction(message.chat.id, ChatAction.UploadPhoto).then((APIResponseBool response) {
            if (!response.ok) {
              print("** sendChatAction failed: ${response.description}");
            }

            // echo received photo back
            bot.sendPhoto(message.chat.id,
                InputFile.fromFileId(message.largestPhoto().fileId),
                replyToMessageId: message.messageId).then((APIResponseMessage response) {
              if (response.ok) {
                print("<< echoed back: '${message.photo}'");
              } else {
                print("** sendPhoto failed: ${response.description}");
              }
            });
          });
        } catch (e, stackTrace) {
          print(
              "** exception while sendPhoto with fileId: ${e}\n${stackTrace}");
        }
      } else {
        print(">> TODO: implement more cases");

        try {
          // send 'uploading photo...'
          bot.sendChatAction(message.chat.id, ChatAction.UploadPhoto).then((APIResponseBool response) {
            if (!response.ok) {
              print("** sendChatAction failed: ${response.description}");
            }

            bot.sendPhoto(
                message.chat.id, InputFile.fromFilepath(_imageFilepath),
                replyToMessageId: message.messageId,
                caption: "Not implemented for this kind of file or message yet.")
              .then((APIResponseMessage response) {
                if (response.ok) {
                  print("<< echoed back: '${_imageFilepath}'");
                } else {
                  print("** sendPhoto failed: ${response.description}");
                }
              });
          });
        } catch (e, stackTrace) {
          print(
              "** exception while sendPhoto with filepath: ${e}\n${stackTrace}");
        }
      }
    }
  } else {
    print("getMe() failed: ${me.description}");
  }
}
