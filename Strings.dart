import 'dart:io';

import 'package:flutter/material.dart';

enum StringId {
  TEST_NOTIFICATION_CHANNEL_NAME,
  TEST_NOTIFICATION2_CHANNEL_NAME,
  TEST_STRING,
}

class Strings {
  static String getString(BuildContext context, StringId id) {
    if (id == null || !_JA_STRINGS.containsKey(id)) {
      return "";
    }
    Locale locale = Localizations.localeOf(context);
    if (context == null || !Platform.isAndroid) {
      return _JA_STRINGS[id];
    }

    switch (locale.countryCode) {
      case "US":
        return _EN_STRINGS[id];
      case "JP":
        return _JA_STRINGS[id];
    }
    return _EN_STRINGS[id];
  }

  static String getReplacedString(
      BuildContext context, StringId id, List<String> replaceStrings) {
    String result = getString(context, id);
    for (int i = 0; i < replaceStrings.length; i++) {
      result = result.replaceFirst("@${i + 1}", replaceStrings[i]);
    }
    return result;
  }

  static const _EN_STRINGS = {
    StringId.TEST_NOTIFICATION_CHANNEL_NAME: "Test notification",
    StringId.TEST_NOTIFICATION2_CHANNEL_NAME: "Test notification 2",
    StringId.TEST_STRING: "Test @1",
  };
  static const _JA_STRINGS = {
    StringId.TEST_NOTIFICATION_CHANNEL_NAME: "テスト通知",
    StringId.TEST_NOTIFICATION2_CHANNEL_NAME: "テスト通知2",
    StringId.TEST_STRING: "テスト@1",
  };
}
