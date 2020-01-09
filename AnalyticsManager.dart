import 'package:firebase_analytics/firebase_analytics.dart';

/// Analytics manager of firebase.
class AnalyticsManager {
  FirebaseAnalytics analytics = new FirebaseAnalytics();

  static AnalyticsManager _instance;

  static AnalyticsManager instance() {
    if (_instance == null) {
      _instance = AnalyticsManager();
    }
    return _instance;
  }

  static logSelectEvent({String name}) {
    instance().analytics.logSelectContent(contentType: name, itemId: null);
  }
}
