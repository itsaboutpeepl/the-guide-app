import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:guide_liverpool/constants/enums.dart';
import 'package:guide_liverpool/features/shared/widgets/ShimmerButton.dart';
import 'package:guide_liverpool/features/shared/widgets/snackbars.dart';
import 'package:guide_liverpool/generated/l10n.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/redux/actions/cart_actions.dart';
import 'package:guide_liverpool/redux/viewsmodels/paymentSheet.dart';
import 'package:guide_liverpool/utils/biometric_local_auth.dart';
import 'package:guide_liverpool/utils/constants.dart';
import 'package:guide_liverpool/utils/handleStripe.dart';

class PaymentSheet extends StatefulWidget {
  const PaymentSheet({Key? key}) : super(key: key);

  @override
  _PaymentSheetState createState() => _PaymentSheetState();
}

class _PaymentSheetState extends State<PaymentSheet> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PaymentSheetViewModel>(
      distinct: true,
      converter: PaymentSheetViewModel.fromStore,
      onInit: (store) {
        store.dispatch(SetTransferringPayment(false));
        store.dispatch(UpdateSelectedAmounts((store.state.cartState.cartTotal) / 100, 0));
      },
      builder: (_, viewmodel) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Peepl Pay",
                    style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w800),
                  ),
                  IconButton(
                    splashRadius: 25,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[800],
                      ),
                      child: Center(
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: Text(
                "Current Wallet Balance",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[800],
              ),
              height: 85,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        viewmodel.gbpXBalance,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "GBPx",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  VerticalDivider(
                    width: 20,
                    thickness: 2,
                    color: Colors.grey[600],
                    indent: 15,
                    endIndent: 15,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        viewmodel.pplBalance,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Image.asset(
                        "assets/images/avatar-ppl-red.png",
                        width: 25,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            PPLSlider(),
            Spacer(),
            viewmodel.transferringTokens
                ? CircularProgressIndicator(
                    color: Colors.white,
                  )
                : SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: ShimmerButton(
                        buttonContent: Center(
                          child: Text(
                            "Pay Now",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        buttonAction: () async {
                          if (await BiometricUtils.authenticateIsAvailable()) {
                            final BiometricAuth biometricAuth = await BiometricUtils.getAvailableBiometrics();
                            final String biometric = BiometricUtils.getBiometricString(
                              context,
                              biometricAuth,
                            );
                            await BiometricUtils.showDefaultPopupCheckBiometricAuth(
                              message: '${I10n.of(context).please_use} $biometric ${I10n.of(context).to_unlock}',
                              callback: (bool result) {
                                result
                                    ? (double.parse(viewmodel.gbpXBalance.replaceAll(",", "")) <=
                                            viewmodel.selectedGBPxAmount)
                                        ? handleStripe(
                                            walletAddress: viewmodel.walletAddress,
                                            amountText: (double.parse(viewmodel.gbpXBalance.replaceAll(",", "")) -
                                                    viewmodel.selectedGBPxAmount)
                                                .abs()
                                                .ceil()
                                                .toStringAsFixed(2),
                                            context: context,
                                            shouldPushToHome: false,
                                          )
                                        : viewmodel.sendToken(
                                            () {
                                              context.router.pop();
                                            },
                                            () {
                                              print("error took place");
                                              showErrorSnack(context: context, title: "Something went wrong");
                                            },
                                          )
                                    : context.router.pop();
                              },
                            );
                          } else {
                            //TODO: add pincode screen verification.
                            (double.parse(viewmodel.gbpXBalance.replaceAll(",", "")) <= viewmodel.selectedGBPxAmount)
                                ? handleStripe(
                                    walletAddress: viewmodel.walletAddress,
                                    amountText: (double.parse(viewmodel.gbpXBalance.replaceAll(",", "")) -
                                            viewmodel.selectedGBPxAmount)
                                        .abs()
                                        .ceil()
                                        .toStringAsFixed(2),
                                    context: context,
                                    shouldPushToHome: false,
                                  )
                                : viewmodel.sendToken(
                                    () {
                                      context.router.pop();
                                    },
                                    () {
                                      print("error took place");
                                      showErrorSnack(context: context, title: "Something went wrong");
                                    },
                                  );
                          }
                        },
                        baseColor: Colors.grey[800]!,
                        highlightColor: Colors.grey[850]!),
                  ),
            SizedBox(
              height: 15,
            )
          ],
        );
      },
    );
  }
}
//What do i need to do?

// I have a payment intent ID
// I have payment final amounts in GBPx and PPL
// Check if the amounts are actually there in the wallet
// Set Loading to true
// If PPL or GBPX payment amount is zero, dont make any payment in PPL/GBPx
// Make Payment for payment amount in GBPx
// Make Payment for payment amount in PPL
// Error? => show Error
// Confirmed => Show Screen

class PPLSlider extends StatefulWidget {
  const PPLSlider({Key? key}) : super(key: key);

  @override
  State<PPLSlider> createState() => _PPLSliderState();
}

class _PPLSliderState extends State<PPLSlider> {
  double _pplSliderValue = 0.0;
  double _amountToBePaid = 0.0;
  double _pplBalance = 0.0;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PaymentSheetViewModel>(
      converter: PaymentSheetViewModel.fromStore,
      distinct: true,
      onInit: (store) {
        _amountToBePaid = store.state.cartState.cartTotal.toDouble();
        _pplBalance = double.parse(store.state.cashWalletState.tokens[PeeplToken.address]!.getBalance(true));
      },
      builder: (_, viewmodel) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: (viewmodel.pplBalance != "0.0"
                    ? [
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            trackHeight: 5.0,
                            trackShape: RoundedRectSliderTrackShape(),
                            activeTrackColor: Colors.grey[800],
                            inactiveTrackColor: Colors.grey[400],
                            thumbShape: RoundSliderThumbShape(
                              enabledThumbRadius: 9.0,
                              pressedElevation: 8.0,
                            ),
                            thumbColor: Colors.white,
                            overlayColor: Colors.grey.withOpacity(0.2),
                            overlayShape: RoundSliderOverlayShape(overlayRadius: 0.0),
                          ),
                          child: Slider(
                            min: 0.0,
                            max: _amountToBePaid * 10 <
                                    _pplBalance *
                                        10 //if amount to be paid is less than ppl balance then the max is amount to be paid * 10 otherwise max is wallet balance
                                ? _amountToBePaid * 10
                                : _pplBalance * 10,
                            value: _pplSliderValue,
                            divisions: 100,
                            onChangeEnd: (value) {
                              viewmodel.updateSelectedValues(
                                (_amountToBePaid / 100) - (_pplSliderValue / 1000),
                                (_pplSliderValue / 10),
                              );
                            },
                            onChanged: (value) {
                              setState(
                                () {
                                  _pplSliderValue = value;
                                },
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Slide to use your Peepl Token balance",
                          style: TextStyle(
                            color: Colors.grey[300],
                            fontSize: 14,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ]
                    : <Widget>[SizedBox.shrink()]) +
                [
                  Text(
                    "Pay ${viewmodel.restaurantName}",
                    style: TextStyle(
                      color: Colors.grey[300],
                      fontSize: 14,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text.rich(
                    TextSpan(
                      text: "GBPx ${((_amountToBePaid / 100) - (_pplSliderValue / 1000)).toStringAsFixed(2)},",
                      children: [TextSpan(text: " PPL ${(_pplSliderValue / 10).toStringAsFixed(2)}")],
                    ),
                    style: TextStyle(
                      color: Colors.grey[300],
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text.rich(
                    TextSpan(
                      text: "Total ${cFPrice(viewmodel.cartTotal)} | ",
                      children: [
                        TextSpan(
                            text:
                                "Earn ${(((_amountToBePaid / 100) - (_pplSliderValue / 1000)) * 5).toStringAsFixed(2)} "),
                        WidgetSpan(
                          child: Image.asset(
                            "assets/images/avatar-ppl-red.png",
                            width: 25,
                          ),
                        )
                      ],
                    ),
                    style: TextStyle(
                      color: Colors.grey[300],
                      fontSize: 16,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
          ),
        );
      },
    );
  }
}

String cFPrice(int price) {
  //isPence ? price = price ~/ 100 : price;
  return "£" + (price / 100).toStringAsFixed(2);
}
