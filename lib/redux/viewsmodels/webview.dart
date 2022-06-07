import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:redux/redux.dart';

class InAppWebViewViewModel extends Equatable {
  final num secondaryTokenAmount;
  final Function(
    String currency,
    String receiverAddress,
    num amount,
    dynamic orderId,
    Function(dynamic) sendSuccessCallback,
    VoidCallback sendFailureCallback,
  ) sendTokenFromWebView;

  @override
  List<Object> get props => [
        secondaryTokenAmount,
      ];

  InAppWebViewViewModel({
    required this.secondaryTokenAmount,
    required this.sendTokenFromWebView,
  });

  static InAppWebViewViewModel fromStore(Store<AppState> store) {
    // String communityAddress = store.state.cashWalletState.communityAddress;
    // Community community =
    //     store.state.cashWalletState.communities[communityAddress] ??
    //         Community.initial();
    // final Token token = store.state.cashWalletState.tokens
    //         .containsKey(community?.secondaryTokenAddress?.toLowerCase())
    //     ? store.state.cashWalletState
    //         .tokens[community?.secondaryTokenAddress?.toLowerCase()]
    //     : store.state.cashWalletState.tokens[community?.secondaryTokenAddress];
    // final num secondaryTokenAmount = num.parse(formatValue(
    //       token?.amount,
    //       token?.decimals,
    //       withPrecision: true,
    //     )) ??
    //     0;
    return InAppWebViewViewModel(
      secondaryTokenAmount: 0, // secondaryTokenAmount,
      sendTokenFromWebView: (
        String currency,
        String receiverAddress,
        num amount,
        dynamic orderId,
        Function(dynamic) sendSuccessCallback,
        VoidCallback sendFailureCallback,
      ) {
        print("hello");
        // store.dispatch(sendTokenFromWebViewCall(
        //   currency,
        //   receiverAddress,
        //   amount,
        //   orderId,
        //   sendSuccessCallback,
        //   sendFailureCallback,
        // ));
      },
    );
  }
}
