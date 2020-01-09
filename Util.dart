import 'package:flutter/material.dart';
import './Log.dart';

/// return current time set hour, minute, second 0.
DateTime getArrangedNowDate() {
  DateTime now = DateTime.now();
  return DateTime(now.year, now.month, now.day);
}

closeKeyboard(BuildContext context) {
  if (context == null) {
    errorLog("context is null.");
    return;
  }
  FocusScope.of(context).requestFocus(new FocusNode());
}
