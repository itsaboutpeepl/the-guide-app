import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:peepl/features/topup/dialogs/card_failed.dart';
import 'package:peepl/features/topup/dialogs/minting_dialog.dart';
import 'package:peepl/models/app_state.dart';
import 'package:peepl/redux/actions/cash_wallet_actions.dart';
import 'package:peepl/utils/stripe.dart';

class WebViewWidget extends StatefulWidget {
  final String url;
  final String walletAddress;

  WebViewWidget({
    required this.url,
    required this.walletAddress,
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
    VoidCallback sendFailureCallback;
    Function(dynamic) sendSuccessCallback;

    ;
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
          body: Stack(
            children: [
              InAppWebView(
                initialUrlRequest: URLRequest(url: Uri.parse(widget.url)),
                onWebViewCreated: (InAppWebViewController controller) {
                  webView = controller;
                  webView.addJavaScriptHandler(
                    handlerName: "pay",
                    callback: (args) {
                      Map<String, dynamic> paymentDetails = Map.from(args[0]);
                      sendSuccessCallback(jobId) async {}

                      sendFailureCallback() {}

                      viewModel.sendTokenFromWebView(
                        paymentDetails['currency'],
                        paymentDetails['destination'],
                        paymentDetails['amount'],
                        paymentDetails['orderId'],
                        sendSuccessCallback,
                        sendFailureCallback,
                      );
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
              Positioned(
                bottom: 30,
                right: 30,
                child: ElevatedButton(
                  onPressed: () {
                    sendTokenFromWebViewCall(
                      "GBP",
                      "0f8Ad4098Febe6Dbf5032547713D62c5096fB9F066",
                      50,
                      500,
                      (jobId) async {},
                      () {},
                    );
                  },
                  child: Text('Pls'),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(24),
                    primary: Colors.purple,
                  ),
                ),
              ),
            ],
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
