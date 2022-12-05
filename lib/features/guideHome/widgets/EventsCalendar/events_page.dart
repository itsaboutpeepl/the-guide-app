import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:guide_liverpool/features/guideHome/helpers/UrlLaunch.dart';
import 'package:guide_liverpool/features/shared/widgets/my_scaffold.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/models/articles/events.dart';
import 'package:guide_liverpool/redux/viewsmodels/eventsCalendar.dart';
import 'package:guide_liverpool/utils/extensions.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return MyScaffold(
      title: 'Events',
      body: StoreConnector<AppState, EventsCalendarViewModel>(
        converter: EventsCalendarViewModel.fromStore,
        builder: (context, viewmodel) {
          return ListView.separated(
            padding: EdgeInsets.all(20),
            itemBuilder: (_, index) => EventListItem(
              event: viewmodel.eventsList[index],
            ),
            separatorBuilder: (_, index) => Divider(
              indent: width * 0.45,
              endIndent: width * 0.45,
              color: Colors.amber,
              thickness: 2,
            ),
            itemCount: viewmodel.eventsList.length,
          );
        },
      ),
    );
  }
}

class EventListItem extends StatelessWidget {
  const EventListItem({
    Key? key,
    required this.event,
  }) : super(key: key);

  final Events event;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (event.latitude.isNotEmpty && event.longitude.isNotEmpty)
          UrlLaunch.openMap(
            double.parse(event.latitude),
            double.parse(event.longitude),
          );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: Theme.of(context).primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.eventTitle,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Colors.grey[100],
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    event.description,
                    maxLines: 3,
                    style: TextStyle(
                      color: Colors.grey[100],
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 15,
                        color: Colors.grey[100],
                      ),
                      SizedBox(width: 5),
                      Text(
                        event.location,
                        style: TextStyle(
                          color: Colors.grey[100],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.schedule,
                        size: 15,
                        color: Colors.grey[100],
                      ),
                      SizedBox(width: 5),
                      if (event.isSameDay)
                        Text(
                          '${event.startDate.ordinalDate()} '
                          '${event.startDate.shortMonth}, '
                          '${event.startDate.hoursAndMinutes} - '
                          '${event.endDate.hoursAndMinutes}',
                          style: TextStyle(
                            color: Colors.grey[100],
                          ),
                        )
                      else
                        Text(
                          '${event.startDate.ordinalDate()} '
                          '${event.startDate.shortMonth} '
                          '${event.startDate.hoursAndMinutes} - '
                          '${event.endDate.ordinalDate()} '
                          '${event.endDate.shortMonth} '
                          '${event.endDate.hoursAndMinutes}',
                          style: TextStyle(
                            color: Colors.grey[100],
                          ),
                        )
                    ],
                  ),
                ],
              ),
            ),
            if (event.bookingLink.isNotEmpty)
              GestureDetector(
                onTap: () => UrlLaunch.launchURL(event.bookingLink),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(
                        10,
                      ),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Click here to book',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}

class EventDetails extends StatelessWidget {
  const EventDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
