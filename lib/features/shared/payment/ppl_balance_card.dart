import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/redux/viewsmodels/balance.dart';

class PeeplPayBalanceCard extends StatelessWidget {
  const PeeplPayBalanceCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
          child: Text(
            'Current Wallet Balance',
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
          child: StoreConnector<AppState, BalanceViewModel>(
            converter: BalanceViewModel.fromStore,
            builder: (context, viewmodel) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        viewmodel.gbpxbalance,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      const Text(
                        'GBPx',
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
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Image.asset(
                        'assets/images/avatar-ppl-red.png',
                        width: 25,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
