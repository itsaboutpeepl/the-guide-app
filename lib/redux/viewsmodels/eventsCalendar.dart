import 'package:equatable/equatable.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/models/articles/events.dart';
import 'package:redux/redux.dart';

class EventsCalendarViewModel extends Equatable {
  final List<Events> eventsList;

  EventsCalendarViewModel({required this.eventsList});

  static EventsCalendarViewModel fromStore(Store<AppState> store) {
    return EventsCalendarViewModel(
      eventsList: store.state.homePageState.eventList,
    );
  }

  @override
  List<Object> get props => [eventsList];
}
