import 'package:equatable/equatable.dart';
import 'package:redux/redux.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/models/cash_wallet_state.dart';
import 'package:guide_liverpool/utils/constants.dart';

class BalanceViewModel extends Equatable {
  const BalanceViewModel({
    required this.gbpxbalance,
    required this.pplBalance,
  });

  factory BalanceViewModel.fromStore(Store<AppState> store) {
    final CashWalletState cashWalletState = store.state.cashWalletState;
    return BalanceViewModel(
      pplBalance: cashWalletState.tokens[pplToken.address]!
          .getAmount()
          .toStringAsFixed(2),
      gbpxbalance: cashWalletState.tokens[gbpxToken.address]!
          .getAmount()
          .toStringAsFixed(2),
      // usdValue: display(value),
    );
  }
  final String pplBalance;
  final String gbpxbalance;

  @override
  List<Object> get props => [
        pplBalance,
        gbpxbalance,
      ];
}
