import 'package:flutter_segment/flutter_segment.dart';
import 'package:guide_liverpool/common/router/routes.dart';
import 'package:guide_liverpool/constants/enums.dart';
import 'package:guide_liverpool/redux/actions/user_actions.dart';
import 'package:guide_liverpool/services.dart';
import 'package:guide_liverpool/utils/log/log.dart';
import 'package:guide_liverpool/utils/onboard/Istrategy.dart';

class SimpleStrategy implements IOnBoardStrategy {
  @override
  final OnboardStrategy strategy;
  SimpleStrategy({this.strategy = OnboardStrategy.none});

  @override
  Future login(
    store,
    phoneNumber,
    Function onSuccess,
    Function(dynamic error) onError,
  ) async {
    final String accountAddress = store.state.userState.accountAddress;
    final jwtToken = await walletApi.requestToken(
      phoneNumber,
      accountAddress,
    );
    log.info('jwtToken $jwtToken');
    store.dispatch(LoginVerifySuccess(jwtToken));
    walletApi.setJwtToken(jwtToken);
    Segment.track(
      eventName: 'Sign up: VerificationCode_NextBtn_Press',
    );
    rootRouter.push(UserNameScreen());
    onSuccess();
  }

  @override
  Future verify(store, verificationCode, onSuccess) async {
    // No need
  }
}
