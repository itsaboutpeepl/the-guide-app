import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guide_liverpool/features/shared/widgets/my_scaffold.dart';
import 'package:guide_liverpool/features/shared/widgets/numeric_keyboard.dart';
import 'package:guide_liverpool/features/shared/widgets/primary_button.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/redux/viewsmodels/topup.dart';
import 'package:guide_liverpool/services.dart';

@RoutePage()
class TopupPage extends StatefulWidget {
  const TopupPage({Key? key}) : super(key: key);

  @override
  State<TopupPage> createState() => _TopupPageState();
}

class _TopupPageState extends State<TopupPage>
    with SingleTickerProviderStateMixin {
  String _amountText = '25';
  final bool _isPreloading = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  //decimal place checker
  String decimalChecker(double a, {int decimalPlaces = 2}) {
    final List<String> values = a.toString().split('.');
    if (values.length == 2 && values[1].length > decimalPlaces) {
      return 'Too long';
    } else {
      return a.toString();
    }
  }

  void _onKeyPress(String value, {bool back = false}) {
    if (back) {
      if (_amountText.isEmpty) return;
      _amountText = _amountText.substring(0, _amountText.length - 1);
    } else {
      if (_amountText == '0' && value == '0') {
        _amountText = _amountText;
      } else if (!(num.parse(_amountText + value) > 250) &&
          !(decimalChecker(double.parse(_amountText + value)) == 'Too long')) {
        _amountText = _amountText + value;
      }
      // Prevent deposits greater than 250
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: 'Top up using your card',
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.9,
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: const Text(
                'Topups are limited to £250',
                style: TextStyle(
                  color: Color(
                    0xFF898989,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: AutoSizeText(
                              _amountText,
                              maxLines: 1,
                              style: const TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.background,
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const <Widget>[
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
                            ),
                          )
                        ],
                      ),
                    ),
                    const Padding(
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
                    if (_amountText.contains('.')) {
                      return;
                    } else {
                      setState(() {
                        _amountText = '$_amountText.';
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
                  // labelFontWeight: FontWeight.normal,
                  label: 'Next',
                  onPressed: () => stripeService.handleApplePay(
                    walletAddress: viewModel.walletAddress,
                    amount: int.parse(_amountText) * 100,
                    context: context,
                    shouldPushToHome: true,
                  ),
                  preload: _isPreloading,
                  disabled: _isPreloading,
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
