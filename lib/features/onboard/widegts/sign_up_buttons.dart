import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_segment/flutter_segment.dart';
import 'package:peepl/generated/l10n.dart';
import 'package:peepl/models/app_state.dart';
import 'package:peepl/features/onboard/dialogs/warn_before_recreate.dart';
import 'package:peepl/redux/viewsmodels/splash.dart';
import 'package:peepl/common/router/routes.dart';
import 'package:peepl/features/shared/widgets/primary_button.dart';
import 'package:peepl/features/shared/widgets/transparent_button.dart';

class SignUpButtons extends StatefulWidget {
  @override
  _SignUpButtonsState createState() => _SignUpButtonsState();
}

class _SignUpButtonsState extends State<SignUpButtons> {
  bool isPrimaryPreloading = false;
  bool isTransparentPreloading = false;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SplashViewModel>(
      distinct: true,
      converter: SplashViewModel.fromStore,
      builder: (_, viewModel) {
        return Container(
          padding: EdgeInsets.only(bottom: 80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 6,
                child: Image.asset(
                  'assets/images/splash.png',
                  width: 350,
                  height: 350,
                ),
              ),
              Flexible(
                flex: 2,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    PrimaryButton(
                      disabled: isPrimaryPreloading,
                      preload: isPrimaryPreloading,
                      label: viewModel.isLoggedOut
                          ? I10n.of(context).login
                          : I10n.of(context).create_new_wallet,
                      onPressed: () {
                        if (viewModel.isLoggedOut) {
                          viewModel.loginAgain();
                          if (context.router.canPopSelfOrChildren) {
                            context.router.popUntilRoot();
                          }
                          context.router.replace(MainScreen());
                        } else {
                          setState(() {
                            isPrimaryPreloading = true;
                          });
                          viewModel.createLocalAccount(() {
                            setState(() {
                              isPrimaryPreloading = false;
                            });
                            context.router.replace(SignUpScreen());
                          }, () {
                            setState(() {
                              isPrimaryPreloading = false;
                            });
                          });
                        }
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: viewModel.isLoggedOut
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                TransparentButton(
                                  fontSize: 14,
                                  label: I10n.of(context).restore_backup,
                                  onPressed: () {
                                    Segment.track(
                                      eventName:
                                          'Existing User: Restore wallet from backup',
                                    );
                                    context.router
                                        .replace(RestoreFromBackupScreen());
                                  },
                                ),
                                Text(
                                  I10n.of(context).or,
                                  style: TextStyle(
                                    color: Color(0xFFB2B2B2),
                                  ),
                                ),
                                TransparentButton(
                                  fontSize: 14,
                                  label: I10n.of(context).create__wallet,
                                  preload: isTransparentPreloading,
                                  onPressed: () async {
                                    bool result = await showDialog(
                                      context: context,
                                      builder: (context) =>
                                          WarnBeforeReCreation(),
                                    );
                                    if (result) {
                                      setState(() {
                                        isTransparentPreloading = true;
                                      });
                                      viewModel.createLocalAccount(() {
                                        context.router.push(SignUpScreen());
                                      }, () {
                                        setState(() {
                                          isTransparentPreloading = false;
                                        });
                                      });
                                    }
                                  },
                                )
                              ],
                            )
                          : TransparentButton(
                              fontSize: 20,
                              label: I10n.of(context).restore_from_backup,
                              onPressed: () {
                                Segment.track(
                                  eventName:
                                      'Existing User: Restore wallet from backup',
                                );
                                context.router.push(RestoreFromBackupScreen());
                              },
                            ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
