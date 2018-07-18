/// echo.dart
///
/// A sample bot which echoes back all received messages.

import '../../lib/telegram.dart';

// NOTE: Edit this value to yours.
const String _tokenForTesting = "1234567890:put_your_token_here";

// NOTE: Set this to 'true' for verbose messages.
const bool _isVerbose = false;

const String _imageFilepath = "./we_will_be_back_soon.png";

main() async {
  Bot bot = Bot.create(_tokenForTesting);
  bot.verbose = _isVerbose;

  var me = await bot.getMe();
  if (me.ok) {
    print("Starting bot: @${me.result.username} ...");

    // polling updates
    await for (Update update in bot.monitorUpdates(interval: 3)) {
      print(
          "> @${update.message.from.username}"
          " sent a message: '${update.message.toJson()}'");

      // NOTE: functions are called synchronously here for responding messages in order.
      var message = update.message;
      if (message.text != null) { // text message
        print(">> received text: '${message.text}'");

        try {
          // echo received message back
          var response = await bot.sendMessage(
              message.chat.id,
              message.text,
              replyToMessageId: message.messageId);

          if (response.ok) {
            print("<< echoed back: '${message.text}'");
          } else {
            print("** sendMessage failed: ${response.description}");
          }
        } catch (e, stackTrace) {
          print("** exception while sendMessage: ${e}\n${stackTrace}");
        }
      } else if (message.photo != null) { // photo
        print(">> received photo: ${message.photo}");

        try {
          // echo received photo back
          var response = await bot.sendPhoto(
              message.chat.id,
              InputFile.createFromFileId(message.largestPhoto().fileId),
              replyToMessageId: message.messageId);

          if (response.ok) {
            print("<< echoed back: '${message.photo}'");
          } else {
            print("** sendPhoto failed: ${response.description}");
          }
        } catch (e, stackTrace) {
          print("** exception while sendPhoto with fileId: ${e}\n${stackTrace}");
        }
      } else {
        print(">> TODO: implement more cases");

        try {
          var response = await bot.sendPhoto(
              message.chat.id,
              InputFile.createFromFilepath(_imageFilepath),
              replyToMessageId: message.messageId,
              caption: "Not implemented for this kind of message yet.");

          if (response.ok) {
            print("<< echoed back: '${_imageFilepath}'");
          } else {
            print("** sendPhoto failed: ${response.description}");
          }
        } catch (e, stackTrace) {
          print("** exception while sendPhoto with filepath: ${e}\n${stackTrace}");
        }
      }
    }
  } else {
    print("getMe() failed: ${me.description}");
  }
}
