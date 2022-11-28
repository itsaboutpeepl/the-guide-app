import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/redux/actions/home_page_actions.dart';
import 'package:redux/redux.dart';

class VideoViewModel extends Equatable {
  final void Function(
    String videoID,
    void Function(int) onSuccess,
    VoidCallback onError,
  ) createNewVideoView;

  const VideoViewModel({required this.createNewVideoView});

  static VideoViewModel fromStore(Store<AppState> store) {
    return VideoViewModel(
      createNewVideoView: (videoID, onSuccess, onError) =>
          store.dispatch(createVideoView(videoID, onSuccess, onError)),
    );
  }

  @override
  List<Object> get props => [];
}
