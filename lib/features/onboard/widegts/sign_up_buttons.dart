import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_segment/flutter_segment.dart';
import 'package:guide_liverpool/generated/l10n.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/features/onboard/dialogs/warn_before_recreate.dart';
import 'package:guide_liverpool/redux/viewsmodels/splash.dart';
import 'package:guide_liverpool/common/router/routes.dart';
import 'package:guide_liverpool/features/shared/widgets/transparent_button.dart';

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
        return Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 6,
                    child: Image.asset(
                      'assets/images/guide-logo-horizontal.png',
                      width: 350,
                      height: 350,
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            primary: Colors.white,
                            side: BorderSide(
                              color: Colors.grey[100]!,
                              width: 2,
                              style: BorderStyle.solid,
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 15,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            viewModel.isLoggedOut ? I10n.of(context).login : I10n.of(context).create_new_wallet,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: Colors.grey[100],
                            ),
                          ),
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
                                context.router.push(ShowUserMnemonicScreen());
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
                                          eventName: 'Existing User: Restore wallet from backup',
                                        );
                                        context.router.push(RestoreFromBackupScreen());
                                      },
                                      textColor: Colors.grey[100]!,
                                    ),
                                    Text(
                                      I10n.of(context).or,
                                      style: TextStyle(
                                        color: Colors.grey[100],
                                      ),
                                    ),
                                    TransparentButton(
                                      fontSize: 14,
                                      textColor: Colors.grey[100]!,
                                      label: I10n.of(context).create__wallet,
                                      preload: isTransparentPreloading,
                                      onPressed: () async {
                                        bool result = await showDialog(
                                          context: context,
                                          builder: (context) => WarnBeforeReCreation(),
                                        );
                                        if (result) {
                                          setState(() {
                                            isTransparentPreloading = true;
                                          });
                                          viewModel.createLocalAccount(() {
                                            context.router.push(ShowUserMnemonicScreen());
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
                                  textColor: Colors.grey[100]!,
                                  onPressed: () {
                                    Segment.track(
                                      eventName: 'Existing User: Restore wallet from backup',
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
            ),
          ],
        );
        // return Container(
        //   decoration: BoxDecoration(
        //     gradient: LinearGradient(
        //       colors: screenGradient,
        //       begin: Alignment.topRight,
        //       end: Alignment.bottomLeft,
        //       stops: [0, 0.1, 0.3, 0.5, 0.7, 0.9, 1],
        //     ),
        //   ),
        //   padding: EdgeInsets.only(bottom: 80),
        //   child: column,
        // );
      },
    );
  }
}
