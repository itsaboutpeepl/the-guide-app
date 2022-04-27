import 'dart:ui';

import 'package:guide_liverpool/constants/enums.dart';
import 'package:guide_liverpool/utils/onboard/firebase.dart';
import 'package:guide_liverpool/utils/onboard/simple.dart';
import 'package:guide_liverpool/utils/onboard/sms.dart';

abstract class IOnBoardStrategy {
  final OnboardStrategy strategy;

  Future<dynamic> login(
    store,
    phoneNumber,
    VoidCallback onSuccess,
    Function(dynamic error) onError,
  );
  Future<dynamic> verify(store, verificationCode, onSuccess);

  IOnBoardStrategy(this.strategy);
}

class OnBoardStrategyFactory {
  static IOnBoardStrategy create(String strategy) {
    if (strategy == 'firebase') {
      return FirebaseStrategy();
    } else if (strategy == 'sms') {
      return SmsStrategy();
    } else {
      return SimpleStrategy();
    }
  }
}
