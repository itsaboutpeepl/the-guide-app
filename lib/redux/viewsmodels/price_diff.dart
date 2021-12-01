import 'package:equatable/equatable.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/models/tokens/token.dart';
import 'package:guide_liverpool/redux/actions/cash_wallet_actions.dart';
import 'package:redux/redux.dart';

class PriceDiffViewModel extends Equatable {
  final Map<String, Token> tokens;
  final Function(
    Token token,
    String limit,
  ) fetchPriceDiff;

  PriceDiffViewModel({
    required this.tokens,
    required this.fetchPriceDiff,
  });

  static PriceDiffViewModel fromStore(Store<AppState> store) {
    return PriceDiffViewModel(
      tokens: store.state.cashWalletState.tokens,
      fetchPriceDiff: (
        token,
        limit,
      ) {
        store.dispatch(
          getTokenPriceDiffCall(
            token.address,
            limit,
          ),
        );
        store.dispatch(
          getTokenStatsCall(
            token,
            limit: limit,
          ),
        );
      },
    );
  }

  @override
  List<Object> get props => [
        tokens,
      ];
}
