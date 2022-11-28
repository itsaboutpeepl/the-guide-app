import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:guide_liverpool/common/di/di.dart';

class Analytics {
  static Future<void> track({
    required String eventName,
    Map<String, dynamic>? properties,
  }) async {
    unawaited(getIt<FirebaseAnalytics>().logEvent(
      name: eventName,
      parameters: properties,
    ));
  }

  static Future<void> setUserId(String userId) async {
    unawaited(getIt<FirebaseAnalytics>().setUserId(id: userId));
  }

  static Future<void> identify(
    Map<String, dynamic> properties,
  ) async {
    properties.forEach((key, value) {
      getIt<FirebaseAnalytics>().setUserProperty(
        name: key,
        value: value.toString(),
      );
    });
  }
}
