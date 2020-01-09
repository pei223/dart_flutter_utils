import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import './Strings.dart';

import './Log.dart';
import './NotificationType.dart';

class NotificationTapListener {
  Future onTappedOnAndroid(String a) {
    infoLog("on notification tapped.");
  }

  Future<dynamic> onTappedOnIOS(int a, String b, String c, String d) {
    infoLog("on notification tapped.");
  }
}

class NotificationCreator {
  NotificationTapListener defaultNotificationTapListener =
      NotificationTapListener();
  FlutterLocalNotificationsPlugin _notificationPlugin;
  NotificationDetails _notificationDetails;
  DateTime _notifyAt;
  String _title;
  String _description;

  static cancelAll() {
    infoLog("Cancel notifications.");
    var flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.cancelAll();
  }

  static requestPermissionIOS(BuildContext context) {
    NotificationCreator(context, null, null);
  }

  NotificationCreator(
      BuildContext context,
      NotificationTapListener notificationTapListener,
      NotificationType notificationType) {
    if (notificationTapListener == null) {
      notificationTapListener = defaultNotificationTapListener;
    }
    if (notificationType == null) {
      notificationType = defaultNotificationType();
    }

    _notificationPlugin = FlutterLocalNotificationsPlugin();
    var androidSettings = AndroidInitializationSettings('icon');
    var iosSettings = IOSInitializationSettings(
        onDidReceiveLocalNotification: notificationTapListener.onTappedOnIOS);
    var initializationSettings =
        InitializationSettings(androidSettings, iosSettings);
    _notificationPlugin.initialize(initializationSettings,
        onSelectNotification: notificationTapListener.onTappedOnAndroid);
    var androidDetails = AndroidNotificationDetails(notificationType.channelId,
        Strings.getString(context, notificationType.channelNameId), '',
        importance: Importance.High,
        playSound: true,
        priority: Priority.Max,
        vibrationPattern: Int64List.fromList([500, 1000, 500]));
    var iosDetails = IOSNotificationDetails(presentSound: true);
    _notificationDetails = NotificationDetails(androidDetails, iosDetails);
  }

  NotificationCreator laterFor(Duration duration) {
    _notifyAt = DateTime.now().add(duration);
    return this;
  }

  NotificationCreator setDescription(String description) {
    this._description = description;
    return this;
  }

  NotificationCreator setTitle(String title) {
    this._title = title;
    return this;
  }

  /// reserve the notification.
  reserve() {
    _notificationPlugin.schedule(
        0, _title, _description, _notifyAt, _notificationDetails,
        payload: '');
  }
}
