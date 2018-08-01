// rpi_camera.dart
//
// A sample bot which sends photos back.
// (will work only on Raspberry Pi + Raspberry Pi Camera)

import '../../lib/telegram.dart';

import 'dart:async';
import 'dart:io';
import 'dart:convert';

// NOTE: Edit this value to yours.
const String _tokenForTesting = "1234567890:put_your_token_here";

// NOTE: Set this to 'true' for verbose messages.
const bool _isVerbose = false;

// commands
const String _cmdCapture = "/capture";
const String _cmdHelp = "/help";

// messages
const String _helpMessage = """*Supported commands:*

*${_cmdCapture}* : Capture a photo with Raspberry Pi Camera.
*${_cmdHelp}* : Show this help message.
""";

main() async {
  Bot bot = Bot.create(_tokenForTesting);
  bot.verbose = _isVerbose;

  // keyboard commands
  ReplyKeyboardMarkup _keyboards = ReplyKeyboardMarkup(
      List<List<KeyboardButton>>()
        ..add(List<KeyboardButton>()
          ..add(KeyboardButton(_cmdCapture))
          ..add(KeyboardButton(_cmdHelp))),
      resizeKeyboard: true);

  var me = await bot.getMe();
  if (me.ok) {
    print("Starting bot: @${me.result.username} ...");

    // polling updates
    await for (Update update in bot.monitorUpdates(interval: 3)) {
      print("> @${update.message.from.username}"
          " sent a message: '${update.message.toJson()}'");

      var message = update.message;
      if (message.text != null) {
        switch (message.text) {
          case _cmdCapture:
            bot.sendChatAction(message.chat.id, ChatAction.UploadPhoto);

            // will take some time here...
            _photoBytesFromCamera().then((bytes) {
              bot.sendPhoto(message.chat.id, InputFile.fromBytes(bytes),
                  replyMarkup: _keyboards);
            }).catchError((e, stackTrace) {
              String errMessage = "Error while reading taken photo: ${e}";
              bot.logError("${errMessage}\n${stackTrace}");

              bot.sendMessage(message.chat.id, errMessage,
                  replyMarkup: _keyboards);
            });
            break;
          case _cmdHelp:
            bot.sendMessage(message.chat.id, _helpMessage,
                replyMarkup: _keyboards, parseMode: ParseMode.Markdown);
            break;
          default:
            bot.sendMessage(
                message.chat.id, "Command not recognized: *${message.text}*",
                replyMarkup: _keyboards, parseMode: ParseMode.Markdown);
            break;
        }
      } else {
        bot.sendMessage(
            message.chat.id, "This type of message is not supported.",
            replyMarkup: _keyboards);
      }
    }
  } else {
    print("getMe() failed: ${me.description}");
  }
}

// read bytes from Raspberry Pi Camera
Future<List<int>> _photoBytesFromCamera() async {
  const String _raspiStillBin = "/usr/bin/raspistill";

  ProcessResult result = await Process.run(_raspiStillBin, ['-o', '-'],
      stdoutEncoding: null); // capture and print bytes to stdout

  int exitCode = await result.exitCode;
  if (exitCode == 0) {
    return result.stdout;
  } else {
    throw _rpiCameraException(
        "${_photoBytesFromCamera} failed with exit code: ${exitCode}, ${result.stderr}");
  }
}

// custom exception for Raspberry Pi Camera
class _rpiCameraException implements Exception {
  String cause;
  _rpiCameraException(this.cause);
}
