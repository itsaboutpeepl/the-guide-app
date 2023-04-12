import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:guide_liverpool/common/router/routes.dart';
import 'package:guide_liverpool/features/shared/payment/ppl_balance_card.dart';
import 'package:guide_liverpool/features/shared/payment/ppl_slider_control.dart';
import 'package:guide_liverpool/features/shared/widgets/ShimmerButton.dart';
import 'package:guide_liverpool/features/topup/dialogs/processing_payment.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/redux/actions/network_tab_actions.dart';
import 'package:guide_liverpool/redux/viewsmodels/paymentSheet.dart';

class PaymentSheet extends StatelessWidget {
  const PaymentSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PeeplPaySheetViewModel>(
      distinct: true,
      converter: PeeplPaySheetViewModel.fromStore,
      onInit: (store) {
        store
          ..dispatch(SetShouldShowPaymentSheet(false))
          ..dispatch(SetTransferringPayment(flag: false))
          ..dispatch(SetError(flag: false))
          ..dispatch(SetConfirmed(flag: false))
          ..dispatch(
            UpdateSelectedAmounts(
              gbpxAmount: (store.state.networkTabState.cartTotal) / 100,
              pplAmount: 0,
            ),
          );

        final StreamSubscription<AppState> stream =
            store.onChange.listen((event) {});

        stream.onData((state) {
          if (state.networkTabState.transferringTokens) {
            Navigator.pop(context);
            showDialog<void>(
              context: context,
              builder: (context) => const ProcessingPayment(),
            );
            stream.cancel();
          }
        });
      },
      builder: (_, viewmodel) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
                bottom: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Peepl Pay',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  IconButton(
                    splashRadius: 25,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[800],
                      ),
                      child: const Center(
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
            const Spacer(),
            const PeeplPayBalanceCard(),
            const Spacer(),
            const PPLSlider(),
            const Spacer(),
            if (viewmodel.transferringTokens)
              const CircularProgressIndicator(
                color: Colors.white,
              )
            else
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: ShimmerButton(
                  buttonContent: const Center(
                    child: Text(
                      'Pay Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  buttonAction: () => viewmodel.startPaymentProcess(
                    context: context,
                  ),
                  baseColor: Colors.grey[800]!,
                  highlightColor: Colors.grey[850]!,
                ),
              ),
            const Spacer()
          ],
        );
      },
    );
  }
}
