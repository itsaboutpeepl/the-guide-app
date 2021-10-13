import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:peepl/features/contacts/send_amount_arguments.dart';
import 'package:peepl/features/screens/ppl_pay_sheet.dart';
import 'package:redux/redux.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:peepl/features/topup/dialogs/card_failed.dart';
import 'package:peepl/features/topup/dialogs/minting_dialog.dart';
import 'package:peepl/models/app_state.dart';
import 'package:peepl/redux/actions/cash_wallet_actions.dart';
import 'package:peepl/utils/stripe.dart';
import 'package:peepl/models/community/community.dart';
import 'package:peepl/models/tokens/token.dart';
import 'package:peepl/features/contacts/send_amount_arguments.dart';

class WebViewWidget extends StatefulWidget {
  final String url;
  final String walletAddress;
<<<<<<< HEAD
=======
  // final SendFlowArguments pageArgs;
>>>>>>> 24dd360261b29e8f0c780f4a1b67212c9b9e273b

  WebViewWidget({
    required this.url,
    required this.walletAddress,
<<<<<<< HEAD
=======
    // required this.pageArgs,
>>>>>>> 24dd360261b29e8f0c780f4a1b67212c9b9e273b
  });

  @override
  _WebViewWidgetState createState() => _WebViewWidgetState();
}

class _WebViewWidgetState extends State<WebViewWidget> {
  late InAppWebViewController webView;

  Future<bool> _handleStripe(amount) async {
    final StripeCustomResponse response = await StripeService().payWithNewCard(
      amount: amount,
      walletAddress: widget.walletAddress,
      currency: 'GBP',
    );
    if (response.ok) {
      showDialog(
        context: context,
        builder: (context) => MintingDialog(amount, false),
        barrierDismissible: false,
      );
      return true;
    } else {
      if (!response.msg!.contains('Cancelled by user')) {
        showDialog(
          context: context,
          builder: (context) => TopUpFailed(), // TopUpFailed
        );
      }
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
=======
    // final SendFlowArguments args = this.widget.pageArgs;
>>>>>>> 24dd360261b29e8f0c780f4a1b67212c9b9e273b
    return StoreConnector<AppState, InAppWebViewViewModel>(
      converter: InAppWebViewViewModel.fromStore,
      builder: (_, InAppWebViewViewModel viewModel) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: Theme.of(context).splashColor,
            toolbarHeight: MediaQuery.of(context).size.height / 17,
            leading: Builder(
              builder: (_) => IconButton(
                icon: Icon(
                  PlatformIcons(context).back,
                  color: Colors.black,
                ),
                onPressed: () async {
                  await webView.goBack();
                },
              ),
            ),
          ),
          body: InAppWebView(
            initialUrlRequest: URLRequest(url: Uri.parse(widget.url)),
            onWebViewCreated: (InAppWebViewController controller) {
              webView = controller;
              webView.addJavaScriptHandler(
                handlerName: "pay",
                callback: (args) {
                  Map<String, dynamic> paymentDetails = Map.from(args[0]);
                  sendSuccessCallback(jobId) async {}

                  sendFailureCallback() {}

                  showModalBottomSheet(
                      context: context,
                      builder: (builder) {
                        return PaymentSheet(
                          paymentDetails['amount'],
                          viewModel.sendTokenFromWebView(
                            paymentDetails['currency'],
                            paymentDetails['destination'],
                            paymentDetails['amount'],
                            paymentDetails['orderId'],
                            sendSuccessCallback,
                            sendFailureCallback,
                          ),
                        );
                        ;
                      });
                },
              );

              webView.addJavaScriptHandler(
                handlerName: "topup",
                callback: (args) {
                  Map<String, dynamic> data = Map.from(args[0]);
                  num amount = num.parse(data['amount']);

                  // TODO: Remove eventually
                  if (amount > 250) {
                    // TODO: Add error message for large top up
                    return false;
                  }
                  return _handleStripe(amount.toString());

                  /* if (amount > viewModel.secondaryTokenAmount) {
                    num value = amount - viewModel.secondaryTokenAmount;
                    return _handleStripe(value.toString());
                  } else {
                    return _handleStripe(amount.toString());
                  } */
                },
              );
            },
          ),
        );
      },
    );
  }
}

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
    String communityAddress = store.state.cashWalletState.communityAddress;
    Community? community =
        store.state.cashWalletState.communities[communityAddress];
    // final Token token? = store.state.cashWalletState.tokens
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
        store.dispatch(sendTokenFromWebViewCall(
          currency,
          receiverAddress,
          amount,
          orderId,
          sendSuccessCallback,
          sendFailureCallback,
        ));
      },
    );
  }
}
