import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_segment/flutter_segment.dart';
import 'package:peepl/features/topup/dialogs/success_dialog.dart';
import 'package:peepl/models/app_state.dart';
import 'package:peepl/models/tokens/token.dart';
import 'package:peepl/utils/constants.dart';
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
  final bool showOrderNow;
  MintingDialog(
    this.amountText,
    this.showOrderNow,
  );
  @override
  _MintingDialogState createState() => _MintingDialogState();
}

class _MintingDialogState extends State<MintingDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;
  bool isPreloading = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext _context) {
    return StoreConnector<AppState, _MintingDialogViewModel>(
      distinct: true,
      converter: _MintingDialogViewModel.fromStore,
      onWillChange: (prevVM, nextVM) {
        if (prevVM?.secondaryToken.amount != nextVM.secondaryToken.amount) {
          Segment.track(eventName: 'Token Mint Success, showed success dialog');
          // close the dialog and show success dialog
          Navigator.of(context).pop();
          showDialog(
            context: context,
            builder: (context) => TopUpSuccess(
              widget.amountText,
              widget.showOrderNow,
            ),
            barrierDismissible: !widget.showOrderNow,
          );
        }
      },
      builder: (_, viewModel) => ScaleTransition(
        scale: scaleAnimation,
        child: AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          title: Center(
            child: Container(
              child: CircularProgressIndicator(
                  strokeWidth: 5,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).primaryColorDark,
                  )),
              width: 60.0,
              height: 60.0,
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
                Text(
                  'One Sec!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Whilst lots of new tech stuff is happening in the background.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Turns out, forking up the system takes a little while!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
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
