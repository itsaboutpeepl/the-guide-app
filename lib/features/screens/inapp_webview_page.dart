import 'dart:math' as math;

import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:peepl/features/contacts/send_amount_arguments.dart';
import 'package:peepl/features/screens/ppl_pay_sheet.dart';
import 'package:peepl/features/shared/widgets/primary_button.dart';
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
  // final SendFlowArguments pageArgs;

  WebViewWidget({
    required this.url,
    required this.walletAddress,
    // required this.pageArgs,
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
    // final SendFlowArguments args = this.widget.pageArgs;

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    bool _value = false;

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

                  // showModalBottomSheet(
                  //   context: context,
                  //   builder: (builder) {
                  //     return Container(
                  //       height: height,
                  //       color: Colors.transparent,
                  //       child: Padding(
                  //         padding: const EdgeInsets.only(
                  //           left: 15,
                  //         ),
                  //         child: Center(
                  //           child: Column(
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             children: [
                  //               Row(
                  //                 children: [
                  //                   Padding(
                  //                     padding: const EdgeInsets.all(8.0),
                  //                     child: Column(
                  //                       crossAxisAlignment:
                  //                           CrossAxisAlignment.start,
                  //                       children: [
                  //                         Row(
                  //                           children: [
                  //                             Padding(
                  //                               padding: const EdgeInsets.only(
                  //                                 bottom: 3.0,
                  //                                 top: 8.0,
                  //                               ),
                  //                               child: Text(
                  //                                 "Pay with ",
                  //                                 style: TextStyle(
                  //                                   fontSize: 18,
                  //                                 ),
                  //                               ),
                  //                             ),
                  //                             Stack(
                  //                               children: [
                  //                                 Image.asset(
                  //                                   'assets/images/icon-android-adaptive-foreground.png',
                  //                                   width: 70,
                  //                                   height: 70,
                  //                                 ),
                  //                                 Positioned(
                  //                                   top: 29,
                  //                                   bottom: 0,
                  //                                   right: 300,
                  //                                   child: Text("pay"),
                  //                                 )
                  //                               ],
                  //                             ),
                  //                           ],
                  //                         ),
                  //                         Padding(
                  //                           padding: const EdgeInsets.only(
                  //                             bottom: 8.0,
                  //                             top: 8.0,
                  //                           ),
                  //                           child: Text(
                  //                             "Delifonseca",
                  //                             style: TextStyle(
                  //                                 color: Colors.blueGrey,
                  //                                 fontSize: 15),
                  //                           ),
                  //                         )
                  //                       ],
                  //                     ),
                  //                   )
                  //                 ],
                  //               ),
                  //               Divider(),
                  //               Padding(
                  //                 padding: const EdgeInsets.only(left: 8.0),
                  //                 child: Text(
                  //                   "To pay send amount to the address:",
                  //                   style: TextStyle(
                  //                     fontSize: 15,
                  //                     color: Colors.blueGrey,
                  //                   ),
                  //                 ),
                  //               ),
                  //               Padding(
                  //                 padding: const EdgeInsets.all(8.0),
                  //                 child: Text(
                  //                   "Amount",
                  //                   style: TextStyle(
                  //                     fontWeight: FontWeight.w600,
                  //                   ),
                  //                 ),
                  //               ),
                  //               Padding(
                  //                 padding: const EdgeInsets.only(right: 15.0),
                  //                 child: TextFormField(
                  //                   enabled: false,
                  //                   decoration: InputDecoration(
                  //                     hintText: "${paymentDetails['amount']}",
                  //                     contentPadding: EdgeInsets.symmetric(
                  //                         horizontal: 20.0, vertical: 5.0),
                  //                     filled: true,
                  //                     floatingLabelBehavior:
                  //                         FloatingLabelBehavior.never,
                  //                     border: OutlineInputBorder(
                  //                       borderRadius:
                  //                           BorderRadius.circular(10.0),
                  //                       borderSide: BorderSide.none,
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ),
                  //               Padding(
                  //                 padding: const EdgeInsets.all(8.0),
                  //                 child: Text(
                  //                   "Address",
                  //                   style: TextStyle(
                  //                     fontWeight: FontWeight.w600,
                  //                   ),
                  //                 ),
                  //               ),
                  //               Padding(
                  //                 padding: const EdgeInsets.only(right: 15.0),
                  //                 child: TextFormField(
                  //                   enabled: false,
                  //                   decoration: InputDecoration(
                  //                     hintText:
                  //                         '0xc0ffee254729296a45a3885639AC7E10F9d54979',
                  //                     contentPadding: EdgeInsets.symmetric(
                  //                         horizontal: 20.0, vertical: 5.0),
                  //                     filled: true,
                  //                     floatingLabelBehavior:
                  //                         FloatingLabelBehavior.never,
                  //                     border: OutlineInputBorder(
                  //                       borderRadius:
                  //                           BorderRadius.circular(10.0),
                  //                       borderSide: BorderSide.none,
                  //                     ),
                  //                     suffixIcon: IconButton(
                  //                       onPressed: () {},
                  //                       icon: Icon(
                  //                         Icons.copy_all_outlined,
                  //                       ),
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ),
                  //               Row(
                  //                 children: [
                  //                   Checkbox(
                  //                       value: true,
                  //                       onChanged: (_value) {
                  //                         setState(() {
                  //                           _value = false;
                  //                         });
                  //                       }),
                  //                   Text('Use PPL rewards token?'),
                  //                 ],
                  //               ),
                  //               Row(
                  //                 mainAxisAlignment: MainAxisAlignment.end,
                  //                 children: [
                  //                   Padding(
                  //                     padding: const EdgeInsets.only(
                  //                       right: 12.0,
                  //                     ),
                  //                     child: Text(
                  //                       "Available: 2200 PPL(£22)",
                  //                       style: TextStyle(
                  //                         color: Colors.blueGrey,
                  //                       ),
                  //                     ),
                  //                   ),
                  //                 ],
                  //               ),
                  //               Row(
                  //                 mainAxisAlignment: MainAxisAlignment.center,
                  //                 children: [
                  //                   Padding(
                  //                     padding: const EdgeInsets.all(8.0),
                  //                     child: PrimaryButton(
                  //                       opacity: 1,
                  //                       // labelFontWeight: FontWeight.normal,
                  //                       label: "Pay",
                  //                       onPressed: () {
                  //                         viewModel.sendTokenFromWebView(
                  //                           paymentDetails['currency'],
                  //                           paymentDetails['destination'],
                  //                           paymentDetails['amount'],
                  //                           paymentDetails['orderId'],
                  //                           sendSuccessCallback,
                  //                           sendFailureCallback,
                  //                         );
                  //                         Navigator.of(context).pop();
                  //                       },

                  //                       width: width * 0.3,
                  //                     ),
                  //                   ),
                  //                 ],
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  //     );
                  //   },
                  // );
                  //TODO: Add ondissmissed function
                  showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    builder: (builder) {
                      return Container(
                        height: height,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                          ),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  bottom: 3.0,
                                                  top: 1.0,
                                                ),
                                                child: Text(
                                                  "Pay with ",
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 90,
                                                height: 70,
                                                child: Stack(
                                                  children: [
                                                    Image.asset(
                                                      'assets/images/icon-android-adaptive-foreground.png',
                                                      width: 70,
                                                      height: 70,
                                                    ),
                                                    Positioned(
                                                      top: 20.5,
                                                      left: 55,
                                                      child: Transform.rotate(
                                                        angle: -math.pi / 20.0,
                                                        child: Text('Pay'),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              bottom: 3.0,
                                              top: 3.0,
                                            ),
                                            child: Text(
                                              "Delifonseca",
                                              style: TextStyle(
                                                  color: Colors.blueGrey,
                                                  fontSize: 15),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Divider(),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    "To pay send amount to the address:",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Amount",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 15.0),
                                  child: TextFormField(
                                    enabled: false,
                                    decoration: InputDecoration(
                                      hintText: "${paymentDetails['amount']}",
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 5.0),
                                      filled: true,
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Address",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 15.0),
                                  child: TextFormField(
                                    enabled: false,
                                    decoration: InputDecoration(
                                      hintText:
                                          '0xc0ffee254729296a45a3885639AC7E10F9d54979',
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 5.0),
                                      filled: true,
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: BorderSide.none,
                                      ),
                                      suffixIcon: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.copy_all_outlined,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                        value: true, onChanged: (_value) {}),
                                    Text('Use PPL rewards token?'),
                                    Spacer(),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: Text(
                                        "Available: 2200 PPL(£22)",
                                        style: TextStyle(
                                          color: Colors.blueGrey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: PrimaryButton(
                                        opacity: 1,
                                        // labelFontWeight: FontWeight.normal,
                                        label: "Pay",
                                        onPressed: () {
                                          viewModel.sendTokenFromWebView(
                                            paymentDetails['currency'],
                                            paymentDetails['destination'],
                                            paymentDetails['amount'],
                                            paymentDetails['orderId'],
                                            sendSuccessCallback,
                                            sendFailureCallback,
                                          );
                                          Navigator.of(context).pop();
                                        },

                                        width: width * 0.3,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
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
