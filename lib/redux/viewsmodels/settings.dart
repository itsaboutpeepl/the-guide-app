import 'package:guide_liverpool/models/app_state.dart';
import 'package:redux/redux.dart';
import 'package:guide_liverpool/redux/actions/user_actions.dart';

class SettingsViewModel {
  final Function() logout;

  SettingsViewModel({
    required this.logout,
  });

  static SettingsViewModel fromStore(Store<AppState> store) {
    return SettingsViewModel(
      logout: () {
        store.dispatch(logoutCall());
      },
    );
  }
}
