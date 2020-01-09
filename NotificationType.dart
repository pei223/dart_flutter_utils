import './Strings.dart';

/// add or delete if necessary.
enum NotificationTypeId { TEST_NOTIFICATION, TEST_NOTIFICATION2 }

/// add or delete if necessary.
Map<NotificationTypeId, NotificationType> _NOTIFICATION_TYPE_MAP = {
  NotificationTypeId.TEST_NOTIFICATION: new NotificationType(
      "test_notification", StringId.TEST_NOTIFICATION_CHANNEL_NAME),
  NotificationTypeId.TEST_NOTIFICATION2: new NotificationType(
      "test_notification2", StringId.TEST_NOTIFICATION2_CHANNEL_NAME)
};

class NotificationType {
  final String channelId;

  final StringId channelNameId;

  NotificationType(this.channelId, this.channelNameId);
}

/// modify if necessary.
NotificationType defaultNotificationType() {
  return notificationTypeFromId(NotificationTypeId.TEST_NOTIFICATION);
}

NotificationType notificationTypeFromId(NotificationTypeId notificationTypeId) {
  return _NOTIFICATION_TYPE_MAP[notificationTypeId];
}
