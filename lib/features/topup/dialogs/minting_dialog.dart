import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_segment/flutter_segment.dart';
import 'package:guide_liverpool/common/router/routes.gr.dart';
import 'package:guide_liverpool/features/topup/dialogs/success_dialog.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/models/tokens/token.dart';
import 'package:guide_liverpool/utils/constants.dart';
import 'package:redux/redux.dart';

class _MintingDialogViewModel extends Equatable {
  final Token secondaryToken;

  _MintingDialogViewModel({
    required this.secondaryToken,
  });

  static _MintingDialogViewModel fromStore(Store<AppState> store) {
    return _MintingDialogViewModel(
      secondaryToken: store.state.cashWalletState.tokens[GBPxToken.address]!,
    );
  }

  @override
  List<Object> get props => [
        secondaryToken.amount,
      ];
}

class MintingDialog extends StatefulWidget {
  final String amountText;
  final bool shouldPushToHome;
  MintingDialog({
    required this.amountText,
    required this.shouldPushToHome,
  });
  @override
  _MintingDialogState createState() => _MintingDialogState();
}

class _MintingDialogState extends State<MintingDialog> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;
  bool isPreloading = false;
  bool _isMinting = true;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    scaleAnimation = CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _MintingDialogViewModel>(
      distinct: true,
      converter: _MintingDialogViewModel.fromStore,
      onWillChange: (prevVM, nextVM) {
        if (prevVM?.secondaryToken.amount != nextVM.secondaryToken.amount) {
          Segment.track(eventName: 'Token Mint Success, showed success dialog');
          setState(() {
            _isMinting = false;
          });

          Future.delayed(
            Duration(seconds: 2),
            () {
              context.router.pop();

              if (widget.shouldPushToHome) {
                context.router.navigate(GuideHomeTab());
              }
            },
          );
        }
      },
      builder: (_, viewModel) => ScaleTransition(
        scale: scaleAnimation,
        child: AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
          title: Center(
            child: Container(
              child: Center(
                child: AnimatedCrossFade(
                  crossFadeState: _isMinting ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                  duration: Duration(milliseconds: 500),
                  firstChild: SizedBox(
                    width: 60,
                    height: 60,
                    child: Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 5,
                        color: Theme.of(context).primaryColorDark,
                      ),
                    ),
                  ),
                  secondChild: SizedBox(
                    width: 60,
                    height: 60,
                    child: Icon(
                      Icons.done,
                      size: 50,
                      color: Theme.of(context).primaryColorDark,
                    ),
                  ),
                ),
              ),
              margin: EdgeInsets.only(left: 28, right: 28),
            ),
          ),
          content: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                AnimatedSwitcher(
                  duration: Duration(milliseconds: 500),
                  child: Text(
                    _isMinting ? "Minting your tokens!" : "Token minting complete!",
                    key: ValueKey(_isMinting),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                AnimatedSwitcher(
                  duration: Duration(milliseconds: 500),
                  child: Text(
                    _isMinting
                        ? "We're hooking up some extra lemons to make this go faster!"
                        : "Thanks for topping up your Peepl Wallet!",
                    key: ValueKey(_isMinting),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
