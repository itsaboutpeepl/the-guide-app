import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:guide_liverpool/common/router/routes.gr.dart';
import 'package:guide_liverpool/constants/enums.dart';
import 'package:guide_liverpool/redux/actions/user_actions.dart';
import 'package:guide_liverpool/services.dart';
import 'package:guide_liverpool/utils/onboard/Istrategy.dart';
import 'package:guide_liverpool/constants/strings.dart';

class SmsStrategy implements IOnBoardStrategy {
  final OnboardStrategy strategy;
  SmsStrategy({this.strategy = OnboardStrategy.sms});

  @override
  Future login(
    store,
    phoneNumber,
  ) async {
    await walletApi.loginWithSMS(
      phoneNumber,
    );
    store.dispatch(SetIsLoginRequest(isLoading: false));
    rootRouter.push(VerifyPhoneNumber());
  }

  @override
  Future verify(store, verificationCode, onSuccess) async {
    final String phoneNumber = store.state.userState.phoneNumber;
    final String accountAddress = store.state.userState.accountAddress;
    String jwtToken = "";

    if (phoneNumber == dotenv.env["DEMO_PHONE_NUMBER"]) {
      jwtToken = dotenv.env["DEMO_JWT_TOKEN"]!;
    } else {
      jwtToken = await walletApi.verifySMS(
        verificationCode,
        phoneNumber,
        accountAddress,
        appName: Strings.appName,
      );
    }

    onSuccess(jwtToken);
  }
}
