import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:guide_liverpool/features/guideHome/dialogs/tokenHelpDialog.dart';
import 'package:guide_liverpool/features/guideHome/helpers/order_helpers.dart';
import 'package:guide_liverpool/redux/viewsmodels/balance.dart';
import 'package:guide_liverpool/models/app_state.dart';

class Balance extends StatelessWidget {
  const Balance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, BalanceViewModel>(
      distinct: true,
      converter: BalanceViewModel.fromStore,
      builder: (_, viewModel) {
        return Stack(
          children: [
            Positioned(
              right: 0,
              bottom: 0,
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => TokenHelpDialog(),
                  );
                },
                child: Icon(
                  Icons.info_outline,
                  color: Colors.white,
                ),
              ),
            ),
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Balance',
                      style: TextStyle(
                        color: Theme.of(context).canvasColor,
                        fontSize: 13.0,
                      ),
                    ),
                    AutoSizeText.rich(
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: viewModel.gbpxbalance,
                          ),
                          TextSpan(
                            text: ' GBPx',
                            style: TextStyle(
                              fontWeight: FontWeight.w100,
                              fontSize: 14,
                              color: Theme.of(context).canvasColor,
                            ),
                          ),
                        ],
                      ),
                      style: TextStyle(
                        color: Theme.of(context).canvasColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 30,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Rewards',
                      style: TextStyle(
                        color: Theme.of(context).canvasColor,
                        fontSize: 13.0,
                      ),
                    ),
                    AutoSizeText.rich(
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: viewModel.pplBalance,
                          ),
                          TextSpan(
                            text: ' PPL',
                            style: TextStyle(
                              fontWeight: FontWeight.w100,
                              fontSize: 14,
                              color: Theme.of(context).canvasColor,
                            ),
                          ),
                          TextSpan(
                            text:
                                ' (£${getPPLValueFromPence(double.parse(viewModel.pplBalance)).toStringAsFixed(2)})',
                            style: TextStyle(
                              fontWeight: FontWeight.w100,
                              fontSize: 14,
                              color: Theme.of(context).canvasColor,
                            ),
                          ),
                        ],
                      ),
                      style: TextStyle(
                        color: Theme.of(context).canvasColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
