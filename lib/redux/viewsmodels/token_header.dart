import 'package:equatable/equatable.dart';
import 'package:redux/redux.dart';
import 'package:peepl/models/app_state.dart';
import 'package:peepl/models/community/community.dart';

class ProTokenHeaderViewModel extends Equatable {
  final List<Community> communities;
  ProTokenHeaderViewModel({
    required this.communities,
  });

  static ProTokenHeaderViewModel fromStore(Store<AppState> store) {
    return ProTokenHeaderViewModel(
        communities: store.state.cashWalletState.communities.values.toList());
  }

  @override
  List<Object> get props => [communities];
}
