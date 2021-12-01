import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:guide_liverpool/generated/l10n.dart';
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
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(
              children: [
                Flexible(
                  child: Text(
                    I10n.of(context).balance,
                    style: TextStyle(
                      color: Theme.of(context).canvasColor,
                      fontSize: 13.0,
                    ),
                  ),
                ),
                SizedBox(
                  width: 35,
                ),
                Flexible(
                  child: Text(
                    'Rewards',
                    style: TextStyle(
                      color: Theme.of(context).canvasColor,
                      fontSize: 13.0,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                AutoSizeText.rich(
                  TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: viewModel.gbpxbalance,
                      ),
                      TextSpan(
                        text: ' GBPX',
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
                    fontSize: 40,
                  ),
                ),
                SizedBox(
                  width: 30,
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
                      )
                    ],
                  ),
                  style: TextStyle(
                    color: Theme.of(context).canvasColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
              ],
            ),
            // Flexible(
            //   child: AutoSizeText(
            //     '\$${viewModel.usdValue}',
            //     style: TextStyle(
            //       fontWeight: FontWeight.bold,
            //     ),
            //     presetFontSizes: [
            //       30,
            //       25,
            //       22,
            //     ],
            //   ),
            // ),
          ],
        );
      },
    );
  }
}
