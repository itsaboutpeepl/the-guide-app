import 'package:auto_route/auto_route.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:guide_liverpool/common/router/routes.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/models/tokens/token.dart';
import 'package:guide_liverpool/utils/constants.dart';

class _MintingDialogViewModel extends Equatable {
  const _MintingDialogViewModel({
    required this.secondaryToken,
  });

  factory _MintingDialogViewModel.fromStore(Store<AppState> store) {
    return _MintingDialogViewModel(
      secondaryToken: store.state.cashWalletState.tokens[gbpxToken.address]!,
    );
  }
  final Token secondaryToken;

  @override
  List<Object> get props => [
        secondaryToken.amount,
      ];
}

class MintingDialog extends StatefulWidget {
  const MintingDialog({
    Key? key,
    required this.amountText,
    required this.shouldPushToHome,
  }) : super(key: key);
  final String amountText;
  final bool shouldPushToHome;
  @override
  State<MintingDialog> createState() => _MintingDialogState();
}

class _MintingDialogState extends State<MintingDialog>
    with SingleTickerProviderStateMixin {
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

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);

    controller
      ..addListener(() {
        setState(() {});
      })
      ..forward();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _MintingDialogViewModel>(
      distinct: true,
      converter: _MintingDialogViewModel.fromStore,
      onWillChange: (prevVM, nextVM) {
        if (prevVM?.secondaryToken.amount != nextVM.secondaryToken.amount) {
          setState(() {
            _isMinting = false;
          });

          Future.delayed(
            const Duration(seconds: 5),
            () {
              context.router.pop();

              if (widget.shouldPushToHome) {
                context.router.navigate(const GuideHomeTab());
              }
            },
          );
        }
      },
      builder: (_, viewModel) => ScaleTransition(
        scale: scaleAnimation,
        child: AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          title: Center(
            child: Container(
              margin: const EdgeInsets.only(left: 28, right: 28),
              child: Center(
                child: AnimatedCrossFade(
                  crossFadeState: _isMinting
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: const Duration(milliseconds: 500),
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
            ),
          ),
          content: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: Text(
                    _isMinting
                        ? "Adding balance to your wallet, won't be long"
                        : 'Token minting complete!',
                    key: ValueKey(_isMinting),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: Text(
                    _isMinting
                        ? "We're hooking up some extra lemons "
                            'to make this go faster!'
                        : 'Thanks for topping up your Peepl Wallet!',
                    key: ValueKey(_isMinting),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
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
