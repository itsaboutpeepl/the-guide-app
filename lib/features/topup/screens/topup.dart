import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:peepl/common/di/di.dart';
import 'package:peepl/features/shared/widgets/my_scaffold.dart';
import 'package:peepl/features/shared/widgets/numeric_keyboard.dart';
import 'package:peepl/features/shared/widgets/primary_button.dart';
import 'package:peepl/features/topup/dialogs/card_failed.dart';
import 'package:peepl/features/topup/dialogs/minting_dialog.dart';
import 'package:peepl/generated/l10n.dart';
import 'package:peepl/models/app_state.dart';
import 'package:peepl/utils/constants.dart';
import 'package:peepl/utils/log/log.dart';
import 'package:redux/redux.dart';

class TopUpViewModel {
  final String walletAddress;

  TopUpViewModel({
    required this.walletAddress,
  });

  static TopUpViewModel fromStore(Store<AppState> store) {
    return TopUpViewModel(
      walletAddress: store.state.userState.walletAddress,
    );
  }
}

enum TopupType { STRIPE, PLAID }

class TopupScreen extends StatefulWidget {
  final TopupType topupType;
  TopupScreen({
    Key? key,
    this.topupType = TopupType.STRIPE,
  });
  @override
  _TopupScreenState createState() => _TopupScreenState();
}

class _TopupScreenState extends State<TopupScreen>
    with SingleTickerProviderStateMixin {
  String amountText = "25";
  bool isPreloading = false;

/*   void _onSuccessCallback(
    String publicToken,
    LinkSuccessMetadata metadata,
    String walletAddress,
  ) async {
    getIt<Dio>().post(
      '$topUpService/plaid/set_access_token',
      data: {
        'walletAddress': walletAddress,
        'publicToken': publicToken,
      },
      options: Options(
        headers: {
          "Content-Type": 'application/json',
        },
      ),
    );
    // Todo
    // context.router.popUntilRoot();
    // context.router.navigateTo(
    //   HomeTab(
    //     children: [
    //       HomeScreen(),
    //     ],
    //   ),
    // );
    // final BottomNavigationBar navigationBar =
    //     AppKeys.bottomBarKey.currentWidget;
    // navigationBar.onTap(0);
    // responseHandler(
    //   await client.post(
    //     '$topUpService/plaid/set_access_token',
    //     body: body,
    //     headers: {"Content-Type": 'application/json'},
    //   ),
    // );
  } */

  // void _onEventCallback(String event, LinkEventMetadata metadata) {
  //   print("onEvent: $event, metadata: ${metadata.description()}");
  // }

  // void _onExitCallback(LinkError? error, LinkExitMetadata? metadata) {
  //   print("onExit: $error, metadata: ${metadata?.description()}");
  // }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  /* void _handlePlaid(String walletAddress) async {
    PlaidLink _plaidLinkToken;

    Response response = await getIt<Dio>().post(
      '$topUpService/plaid/create_link_token_for_payment',
      options: Options(
        headers: {
          "Authorization": "Bearer keywI4WPG7mJVm2XU",
        },
      ),
      data: {
        'walletAddress': walletAddress,
        'value': num.parse(amountText),
        'reference': 'Top up',
        'isAndroid': Platform.isAndroid
      },
    );

    if (response.data['link_token'] != null) {
      _plaidLinkToken = PlaidLink(
        configuration: LinkTokenConfiguration(
          token: response.data['link_token'],
        ),
        onSuccess: (
          String publicToken,
          LinkSuccessMetadata metadata,
        ) =>
            _onSuccessCallback(publicToken, metadata, walletAddress),
        onEvent: _onEventCallback,
        onExit: _onExitCallback,
      );
      _plaidLinkToken.open();
    }
  } */

  String _paymentApiUrl = '$topUpService/stripe/createPaymentIntent';

  // Main function to initiate a payment.
  Future<void> _handleStripe({
    required String walletAddress,
  }) async {
    try {
      Map<String, dynamic> _paymentSheetData = await _createPaymentIntent(
        amount: amountText,
        currency: 'gbp',
        walletAddress: walletAddress,
      );

      final paymentIntentClientSecret = _paymentSheetData['clientSecret'];
      log.info('clientSecret $paymentIntentClientSecret');
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          applePay: true,
          googlePay: true,
          style: ThemeMode.dark,
          testEnv: true,
          merchantCountryCode: 'GB',
          merchantDisplayName: 'Peepl',
          paymentIntentClientSecret: paymentIntentClientSecret,
        ),
      );
      await Stripe.instance.presentPaymentSheet(
        parameters: PresentPaymentSheetParameters(
          clientSecret: paymentIntentClientSecret,
          confirmPayment: true,
        ),
      );
      showDialog(
        context: context,
        builder: (context) {
          return MintingDialog(amountText, true);
        },
        barrierDismissible: false,
      );
    } on Exception catch (e) {
      showDialog(
        context: context,
        builder: (context) => TopUpFailed(),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Unforeseen error: ${e}'),
        ),
      );
    }
  }

  Future<Map<String, dynamic>> _createPaymentIntent({
    required String amount,
    required String currency,
    required String walletAddress,
  }) async {
    final int amountNew =
        (double.parse(amount) * 100).toInt(); // Pounds to pence
    try {
      final Response response = await getIt<Dio>().post(
        _paymentApiUrl,
        data: {
          'amount': amountNew,
          'currency': currency,
          'walletAddress': walletAddress
        },
        options: Options(
          headers: {"Content-Type": 'application/json'},
        ),
      );
      return response.data['data']['paymentIntent'];
    } catch (e) {
      log.info('Error _createPaymentIntent ${e.toString()}');
      return {'error': e.toString()};
    }
  }

/*   void _handleStripe(String walletAddress) async {
    final StripeCustomResponse response = await StripeService().payWithNewCard(
      amount: amountText,
      walletAddress: walletAddress,
      currency: 'GBP',
    );

    // Timer timer = Timer(Duration(seconds: 25), () {
    //   Navigator.of(context, rootNavigator: true).pop();
    //   showDialog(
    //     context: context,
    //     builder: (context) => TimedOut(),
    //     barrierDismissible: true,
    //   );
    // });

    if (response.ok) {
      Segment.track(eventName: 'TopUp Success, Token Minting..');
      showDialog(
        context: context,
        builder: (context) {
          return MintingDialog(amountText, true);
        },
        barrierDismissible: false,
      ).then((value) {
        // timer.cancel();
      });
    } else {
      if (!response.msg!.contains('Cancelled by user')) {
        Segment.track(eventName: 'Cancelled top up');
        showDialog(
          context: context,
          builder: (context) => TopUpFailed(),
        );
      }
    }
  } */

  _onPress(String walletAddress) async {
    /* if (widget.topupType == TopupType.PLAID) {
      _handlePlaid(walletAddress);
    } else if (widget.topupType == TopupType.STRIPE) { */
    _handleStripe(walletAddress: walletAddress);
    // }
  }

  //decimal place checker
  String decimalChecker(double a, {int decimalPlaces = 2}) {
    List<String> values = a.toString().split('.');
    if (values.length == 2 && values[1].length > decimalPlaces) {
      return "Too long";
    } else {
      return a.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    _onKeyPress(String value, {bool back = false}) {
      if (back) {
        if (amountText.length == 0) return;
        amountText = amountText.substring(0, amountText.length - 1);
      } else {
        if (amountText == '0' && value == '0') {
          amountText = amountText;
        } else {
          amountText = amountText + value;
        }
      }
      setState(() {});
    }

    return MyScaffold(
      title: 'Top up using your card',
      body: Container(
        height: MediaQuery.of(context).size.height * 0.9,
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                I10n.of(context).how_much,
                style: TextStyle(
                  color: Color(
                    0xFF898989,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: AutoSizeText(
                              amountText,
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 40.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Theme.of(context).backgroundColor,
                                borderRadius: BorderRadius.circular(
                                  20,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    'GBP',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Color(
                                        0xFF808080,
                                      ),
                                    ),
                                  )
                                ],
                              ))
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 20,
                      ),
                      child: Divider(
                        color: Color(0xFFE8E8E8),
                        thickness: 1.5,
                      ),
                    ),
                  ],
                ),
                NumericKeyboard(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  onKeyboardTap: _onKeyPress,
                  rightButtonFn: () {
                    _onKeyPress('', back: true);
                  },
                  rightIcon: SvgPicture.asset(
                    'assets/images/backspace.svg',
                    // width: 28,
                  ),
                  leftButtonFn: () {
                    if (amountText.contains('.')) {
                      return;
                    } else {
                      setState(() {
                        amountText = amountText + '.';
                      });
                    }
                  },
                  leftIcon: Icon(
                    Icons.fiber_manual_record,
                    size: 10,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ],
            ),
            StoreConnector<AppState, TopUpViewModel>(
              distinct: true,
              converter: TopUpViewModel.fromStore,
              builder: (_, viewModel) => Center(
                child: PrimaryButton(
                  opacity: 1,
                  // labelFontWeight: FontWeight.normal,
                  label: I10n.of(context).next_button,
                  onPressed: () => _onPress(viewModel.walletAddress),
                  preload: isPreloading,
                  disabled: isPreloading,
                  width: 300,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
