import 'package:equatable/equatable.dart';
import 'package:guide_liverpool/models/cash_wallet_state.dart';
import 'package:guide_liverpool/models/tokens/token.dart';
import 'package:guide_liverpool/utils/constants.dart';
// import 'package:guide_liverpool/utils/format.dart';
import 'package:redux/redux.dart';
import 'package:guide_liverpool/models/app_state.dart';

num combiner(num previousValue, Token token) =>
    ![null, '', '0', 0, 'NaN'].contains(token.priceInfo?.quote)
        ? previousValue + num.parse(token.getFiatBalance())
        : previousValue + 0;

class BalanceViewModel extends Equatable {
  final String pplBalance;
  final String gbpxbalance;

  BalanceViewModel({
    required this.gbpxbalance,
    required this.pplBalance,
  });

  static BalanceViewModel fromStore(Store<AppState> store) {
    CashWalletState cashWalletState = store.state.cashWalletState;
    // List<Token> homeTokens = List<Token>.from(cashWalletState.tokens.values)
    //     .where((Token token) =>
    //         num.parse(token.getBalance(true)).compareTo(0) == 1)
    //     .toList();

    // final num value = homeTokens.fold<num>(0, combiner);

    return BalanceViewModel(
      pplBalance: cashWalletState.tokens[PeeplToken.address]!.getBalance(),
      gbpxbalance: cashWalletState.tokens[GBPxToken.address]!.getBalance(),
      // usdValue: display(value),
    );
  }

  @override
  List<Object> get props => [
        pplBalance,
        gbpxbalance,
      ];
}
