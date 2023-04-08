import 'package:guide_liverpool/common/router/routes.dart';
import 'package:guide_liverpool/constants/enums.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/redux/actions/user_actions.dart';
import 'package:guide_liverpool/services.dart';
import 'package:guide_liverpool/utils/log/log.dart';
import 'package:guide_liverpool/utils/onboard/Istrategy.dart';
import 'package:redux/redux.dart';

class SimpleStrategy implements IOnBoardStrategy {
  SimpleStrategy({this.strategy = OnboardStrategy.none});

  @override
  final OnboardStrategy strategy;

  @override
  Future<void> login(
    Store<AppState> store,
    String? phoneNumber,
    void Function() onSuccess,
    void Function(dynamic error) onError,
  ) async {
    final String accountAddress = store.state.userState.accountAddress;
    final jwtToken = await chargeApi.requestToken(
      phoneNumber ?? '',
      accountAddress,
    );

    log.info('jwtToken $jwtToken');
    store.dispatch(LoginVerifySuccess(jwtToken));
    chargeApi.setJwtToken(jwtToken);
    await rootRouter.push(SelectUsernameRoute());
    onSuccess();
  }

  @override
  Future<void> verify(
    Store<AppState> store,
    String? verificationCode,
    void Function(String) onSuccess,
  ) async {
    throw UnimplementedError();
  }
}
