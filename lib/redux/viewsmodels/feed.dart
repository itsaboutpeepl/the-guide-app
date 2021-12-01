import 'package:equatable/equatable.dart';
import 'package:guide_liverpool/models/actions/wallet_action.dart';
import 'package:guide_liverpool/redux/actions/cash_wallet_actions.dart';
import 'package:redux/redux.dart';
import 'package:guide_liverpool/models/app_state.dart';

class FeedViewModel extends Equatable {
  final List<WalletAction> walletActions;
  final Function() refreshFeed;

  FeedViewModel({
    required this.refreshFeed,
    required this.walletActions,
  });

  static FeedViewModel fromStore(Store<AppState> store) {
    final List<WalletAction> walletActions =
        List.from(store.state.cashWalletState.walletActions!.list.reversed);
    return FeedViewModel(
      walletActions: walletActions,
      refreshFeed: () {
        store.dispatch(refresh());
      },
    );
  }

  @override
  List<Object> get props => [
        walletActions,
      ];
}
