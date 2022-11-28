import 'package:guide_liverpool/constants/enums.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/utils/onboard/firebase.dart';
import 'package:guide_liverpool/utils/onboard/simple.dart';
import 'package:guide_liverpool/utils/onboard/sms.dart';
import 'package:redux/redux.dart';

abstract class IOnBoardStrategy {
  IOnBoardStrategy(this.strategy);

  final OnboardStrategy strategy;

  Future<dynamic> login(
    Store<AppState> store,
    String? phoneNumber,
    void Function() onSuccess,
    void Function(dynamic error) onError,
  );
  Future<dynamic> verify(
    Store<AppState> store,
    String verificationCode,
    void Function(String jwtToken) onSuccess,
  );
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
