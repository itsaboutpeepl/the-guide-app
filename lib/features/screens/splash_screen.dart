import 'package:another_flushbar/flushbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:guide_liverpool/common/router/routes.dart';
import 'package:guide_liverpool/constants/enums.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/models/user_state.dart';
import 'package:guide_liverpool/redux/actions/user_actions.dart';
import 'package:guide_liverpool/redux/viewsmodels/backup.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({
    Key? key,
    this.onLoginResult,
  }) : super(key: key);
  final void Function(bool isLoggedIn)? onLoginResult;

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late Flushbar<bool> flush;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, LockScreenViewModel>(
      distinct: true,
      onInit: (store) {
        final String privateKey = store.state.userState.privateKey;
        final String jwtToken = store.state.userState.jwtToken;
        final bool isLoggedOut = store.state.userState.isLoggedOut;
        if (privateKey.isEmpty || jwtToken.isEmpty || isLoggedOut) {
          context.router.replaceAll([const OnboardRoute()]);
          widget.onLoginResult?.call(false);
        } else {
          final UserState userState = store.state.userState;
          if (userState.authType != BiometricAuth.none) {
            store
              ..dispatch(getWalletAddressesCall())
              ..dispatch(identifyCall());
          }
          if (BiometricAuth.faceID == userState.authType ||
              BiometricAuth.touchID == userState.authType) {
            context.router.replaceAll([const MainRoute()]);
            widget.onLoginResult?.call(true);
          } else if (userState.authType == BiometricAuth.pincode) {
            context.router.replaceAll([const MainRoute()]);
            widget.onLoginResult?.call(true);
          } else {
            context.router.replaceAll([const MainRoute()]);
            widget.onLoginResult?.call(true);
          }
        }
      },
      converter: LockScreenViewModel.fromStore,
      builder: (_, viewModel) {
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * .5,
                  child: Image.asset(
                    'assets/images/guide-logo.png',
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
