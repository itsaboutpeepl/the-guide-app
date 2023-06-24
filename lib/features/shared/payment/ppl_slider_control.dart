import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:guide_liverpool/features/guideHome/helpers/order_helpers.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/redux/viewsmodels/paymentSheet.dart';
import 'package:guide_liverpool/utils/constants.dart';

class PPLSlider extends StatefulWidget {
  const PPLSlider({Key? key}) : super(key: key);

  @override
  State<PPLSlider> createState() => _PPLSliderState();
}

class _PPLSliderState extends State<PPLSlider> {
  double _pplSliderValue = 0;
  double _gbpxSliderValue = 0;
  double _amountToBePaid = 0;
  double _pplBalance = 0;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PeeplPaySheetViewModel>(
      converter: PeeplPaySheetViewModel.fromStore,
      distinct: true,
      onInit: (store) {
        _amountToBePaid =
            store.state.networkTabState.cartTotal.toDouble(); //in pence
        _gbpxSliderValue =
            store.state.networkTabState.cartTotal.toDouble(); //in pence
        _pplBalance =
            store.state.cashWalletState.tokens[pplToken.address]!.getAmount();
      },
      builder: (_, viewmodel) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Column(
            children: [
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackHeight: 5,
                  trackShape: const RoundedRectSliderTrackShape(),
                  activeTrackColor: Colors.grey[800],
                  inactiveTrackColor: Colors.grey[400],
                  thumbShape: const RoundSliderThumbShape(
                    enabledThumbRadius: 9,
                    pressedElevation: 8,
                  ),
                  thumbColor: Colors.white,
                  overlayColor: Colors.grey.withOpacity(0.2),
                  overlayShape: const RoundSliderOverlayShape(overlayRadius: 0),
                ),
                child: Slider(
                  max: getPPLValueFromPence(_amountToBePaid) <
                          _pplBalance // compare values in PPL terms //665 < 171.66 ? || 35 < 171.66
                      ? getPPLValueFromPence(_amountToBePaid)
                      : _pplBalance,
                  value: _pplSliderValue,
                  divisions: 100,
                  onChangeEnd: (value) {
                    _gbpxSliderValue = _amountToBePaid -
                        value *
                            10; //converting the PPL slider value into pence again
                    _pplSliderValue = value;
                    setState(() {});
                    viewmodel.updateSelectedValues(
                      _gbpxSliderValue / 100,
                      _pplSliderValue,
                    );
                  },
                  onChanged: (value) {
                    setState(
                      () {
                        _gbpxSliderValue = _amountToBePaid -
                            value *
                                10; //converting the PPL slider value into pence again
                        _pplSliderValue = value;
                      },
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Slide to use your Peepl Token balance',
                style: TextStyle(
                  color: Colors.grey[300],
                  fontSize: 14,
                  fontWeight: FontWeight.w200,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Pay ${viewmodel.cartTotal}',
                style: TextStyle(
                  color: Colors.grey[300],
                  fontSize: 14,
                  fontWeight: FontWeight.w200,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text.rich(
                TextSpan(
                  text: 'GBPx ${(_gbpxSliderValue / 100).toStringAsFixed(2)},',
                  children: [
                    TextSpan(
                      text: ' PPL ${_pplSliderValue.toStringAsFixed(2)}',
                    )
                  ],
                ),
                style: TextStyle(
                  color: Colors.grey[300],
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              // Text.rich(
              //   TextSpan(
              //     text: 'Total ${viewmodel.cartTotal}',
              //     children: [
              //       // TextSpan(
              //       //   text:
              //       //       'Earn ${getPPLRewardsFromPence(_gbpxSliderValue).toStringAsFixed(2)} ',
              //       // ),
              //       // WidgetSpan(
              //       //   child: Image.asset(
              //       //     'assets/images/avatar-ppl-red.png',
              //       //     width: 25,
              //       //   ),
              //       // )
              //     ],
              //   ),
              //   style: TextStyle(
              //     color: Colors.grey[300],
              //     fontSize: 16,
              //     fontWeight: FontWeight.w200,
              //   ),
              // ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        );
      },
    );
  }
}
