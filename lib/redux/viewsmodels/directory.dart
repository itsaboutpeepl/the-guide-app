import 'package:equatable/equatable.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/models/articles/directory.dart';
import 'package:redux/redux.dart';

class DirectoryViewModel extends Equatable {
  final List<Directory> directoryList;

  DirectoryViewModel({required this.directoryList});

  static DirectoryViewModel fromStore(Store<AppState> store) {
    return DirectoryViewModel(
      directoryList: store.state.homePageState.directoryList,
    );
  }

  @override
  List<Object> get props => [directoryList];
}
