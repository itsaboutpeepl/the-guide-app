import 'package:flutter/material.dart';
import 'package:guide_liverpool/features/guideHome/helpers/UrlLaunch.dart';
import 'package:guide_liverpool/models/articles/events.dart';
import 'package:guide_liverpool/utils/extensions.dart';

class SingleEventItem extends StatelessWidget {
  final Events eventItem;
  const SingleEventItem({Key? key, required this.eventItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 20),
      child: Stack(
        children: [
          Positioned.fill(
            child: Row(
              children: [
                if (!eventItem.isSameDay)
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        eventItem.startDate.day.toString(),
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w900,
                          color: Colors.grey[100],
                        ),
                      ),
                      Text(
                        eventItem.startDate.shortMonth.toUpperCase(),
                        style: TextStyle(
                          color: Colors.grey[100],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Icon(
                        Icons.circle,
                        size: 10,
                        color: Colors.grey[100],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        eventItem.endDate.day.toString(),
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w900,
                          color: Colors.grey[100],
                        ),
                      ),
                      Text(
                        eventItem.endDate.shortMonth.toUpperCase(),
                        style: TextStyle(
                          color: Colors.grey[100],
                        ),
                      ),
                    ],
                  )
                else
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        eventItem.startDate.day.toString(),
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w900,
                          color: Colors.grey[100],
                        ),
                      ),
                      Text(
                        eventItem.startDate.shortMonth.toUpperCase(),
                        style: TextStyle(
                          color: Colors.grey[100],
                        ),
                      ),
                    ],
                  ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        eventItem.eventTitle,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.grey[100],
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        eventItem.description,
                        maxLines: 3,
                        style: TextStyle(
                          color: Colors.grey[100],
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: Icon(
                              Icons.location_on_outlined,
                              size: 15,
                              color: Colors.grey[100],
                            ),
                          ),
                          SizedBox(width: 5),
                          Flexible(
                            flex: 9,
                            child: Text(
                              eventItem.location,
                              style: TextStyle(
                                color: Colors.grey[100],
                              ),
                            ),
                          )
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
                          Text(
                            '${eventItem.startDate.hoursAndMinutes} '
                            '- ${eventItem.endDate.hoursAndMinutes}',
                            style: TextStyle(
                              color: Colors.grey[100],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 5,
            right: -10,
            child: IconButton(
              icon: Icon(
                Icons.location_pin,
                color: Colors.white,
              ),
              onPressed: () {
                UrlLaunch.openMap(double.parse(eventItem.latitude),
                    double.parse(eventItem.longitude));
              },
            ),
          ),
          eventItem.bookingLink != ""
              ? Positioned(
                  bottom: 5,
                  right: 25,
                  child: IconButton(
                    icon: Icon(
                      Icons.launch,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      UrlLaunch.launchURL(eventItem.bookingLink);
                    },
                  ),
                )
              : SizedBox.shrink()
        ],
      ),
    );
  }
}
