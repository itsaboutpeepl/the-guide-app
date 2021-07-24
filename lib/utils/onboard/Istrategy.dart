import 'package:peepl/constants/enums.dart';
import 'package:peepl/utils/onboard/firebase.dart';
import 'package:peepl/utils/onboard/simple.dart';
import 'package:peepl/utils/onboard/sms.dart';

abstract class IOnBoardStrategy {
  final OnboardStrategy strategy;

  Future<dynamic> login(store, phoneNumber);
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
