import 'package:flutter/material.dart';
import 'package:peepl/models/articles/events.dart';

class SingleEventItem extends StatefulWidget {
  final Events eventItem;
  const SingleEventItem({Key? key, required this.eventItem}) : super(key: key);

  @override
  _SingleEventItemState createState() => _SingleEventItemState();
}

class _SingleEventItemState extends State<SingleEventItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 10, bottom: 12, right: 20),
      child: Row(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "12",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                  color: Colors.grey[100],
                ),
              ),
              Text(
                "November",
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
                "25",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                  color: Colors.grey[100],
                ),
              ),
              Text(
                "November",
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Play Events At Tres Liverpool",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Colors.grey[100],
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Tres Liverpool, Temple Court, Liverpool, UK",
                  style: TextStyle(
                    color: Colors.grey[100],
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 15,
                      color: Colors.grey[100],
                    ),
                    SizedBox(width: 5),
                    Text(
                      "2322 Avenue Vigor",
                      style: TextStyle(
                        color: Colors.grey[100],
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
                      "2322 Avenue Vigor",
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
    );
  }
}
