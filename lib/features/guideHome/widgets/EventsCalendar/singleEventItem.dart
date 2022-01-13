import 'package:flutter/material.dart';
import 'package:guide_liverpool/features/guideHome/helpers/UrlLaunch.dart';
import 'package:guide_liverpool/models/articles/events.dart';
import 'package:intl/intl.dart';

class SingleEventItem extends StatefulWidget {
  final Events eventItem;
  const SingleEventItem({Key? key, required this.eventItem}) : super(key: key);

  @override
  _SingleEventItemState createState() => _SingleEventItemState();
}

class _SingleEventItemState extends State<SingleEventItem> {
  DateFormat monthFormat = DateFormat.MMM();
  DateFormat timeFormat = DateFormat.Hm();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 20),
      child: Stack(
        children: [
          Positioned.fill(
            child: Row(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.eventItem.startDate.day.toString(),
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                        color: Colors.grey[100],
                      ),
                    ),
                    Text(
                      monthFormat
                          .format(widget.eventItem.startDate)
                          .toUpperCase(),
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
                      widget.eventItem.endDate.day.toString(),
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                        color: Colors.grey[100],
                      ),
                    ),
                    Text(
                      monthFormat
                          .format(widget.eventItem.endDate)
                          .toUpperCase(),
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
                        widget.eventItem.eventTitle,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.grey[100],
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        widget.eventItem.description,
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
                              widget.eventItem.location,
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
                            timeFormat.format(widget.eventItem.startDate) +
                                " - " +
                                timeFormat.format(widget.eventItem.endDate),
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
                UrlLaunch.openMap(double.parse(widget.eventItem.latitude),
                    double.parse(widget.eventItem.longitude));
              },
            ),
          ),
          widget.eventItem.bookingLink != ""
              ? Positioned(
                  bottom: 5,
                  right: 25,
                  child: IconButton(
                    icon: Icon(
                      Icons.launch,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      UrlLaunch.launchURL(widget.eventItem.bookingLink);
                    },
                  ),
                )
              : SizedBox.shrink()
        ],
      ),
    );
  }
}
