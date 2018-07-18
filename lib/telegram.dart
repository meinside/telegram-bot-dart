/// Wrapper library for Telegram Bot API (https://core.telegram.org/bots/api)

library telegram;

import 'src/types.dart';
import 'src/http.dart';

import 'dart:async';
import 'dart:convert';

import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart' as crypto;
import 'package:intl/intl.dart';

export 'src/types.dart';
export 'src/http.dart';

/// Bot client class
class Bot extends HttpClient {
  static const String _redactedString = "<REDACTED>"; // confidential info will be displayed as this
  static const int _defaultIntervalSeconds = 10;

  // datetime format for logging
  static DateFormat _dtFormat = new DateFormat('yyyy-MM-dd HH:mm:ss');

  // print verbose log messages or not
  bool verbose;

  // tokens
  String _token;  // Telegram bot API's token
  String _tokenHashed;  // hashed token

  // constructor
  Bot(this._token, this._tokenHashed) : this.verbose = false;

  // Create a new bot API client with given token string.
  static Bot create(String token) {
    return new Bot(token, _md5sum(token));
  }

  @override
  String botToken() {
    return _token;
  }

  @override
  void logVerbose(String message) {
    if (verbose) {
      print("${_dtFormat.format(new DateTime.now())} [VERBOSE] ${_redact(message)}");
    }
  }

  @override
  void logError(String error) {
    print("${_dtFormat.format(new DateTime.now())} [ERROR] ${_redact(error)}");
  }

  // Remove confidential info from given string.
  String _redact(String str) {
    return str
      .replaceAll(_token, _redactedString)
      .replaceAll(_tokenHashed, _redactedString);
  }

  // Get md5 sum of given string.
  static String _md5sum(String str) {
    List<int> content = new Utf8Encoder().convert(str);
    crypto.Digest digest = crypto.md5.convert(content);
    return hex.encode(digest.bytes);
  }

  //////////////////////////////////////////////////
  //
  // Useful functions
  //

  /// Retrieve updates from API server constantly.
  ///
  /// NOTE: If webhook is registered, it may not work properly. So make sure webhook is deleted, or not registered.
  Stream<Update> monitorUpdates({
    int updateOffset = 0,
    int interval = _defaultIntervalSeconds,
  }) async* {
    // check params
    updateOffset ??= 0;
    if (interval == null || interval <= 0) {
      interval = 1;
    }

    logVerbose("monitoring updates... (update offset: ${updateOffset}, interval seconds: ${interval})");

    APIResponseUpdates updates;
    try {
      updates = await getUpdates(offset: updateOffset);

      if (updates.ok) {
	if (updates.result != null) {
	  for (Update update in updates.result) {
	    if (updateOffset <= update.updateId) {
	      updateOffset = update.updateId + 1;
	    }

	    yield update;
	  }
	}
      } else {
	logError("getUpdates failed while monitoring updates: ${updates.description}");
      }
    } catch (e, stackTrace) {
      logError("exception thrown while monitoring updates: ${e}\n${stackTrace}");
    } finally {
      await new Future.delayed(new Duration(seconds: interval));

      yield* monitorUpdates(updateOffset: updateOffset, interval: interval);
    }
  }
}
