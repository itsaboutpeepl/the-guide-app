import 'package:equatable/equatable.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:redux/redux.dart';

class DappPageViewModel extends Equatable {
  final BigInt amount;

  DappPageViewModel({
    required this.amount,
  });

  static DappPageViewModel fromStore(Store<AppState> store) {
    return DappPageViewModel(
      amount: store.state.vestingState.amount,
    );
  }

  @override
  List<Object> get props => [amount];
}
