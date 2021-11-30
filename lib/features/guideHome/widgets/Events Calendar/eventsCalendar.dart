import 'package:flutter/material.dart';

class EventCalendar extends StatefulWidget {
  const EventCalendar({Key? key}) : super(key: key);

  @override
  _EventCalendarState createState() => _EventCalendarState();
}

class _EventCalendarState extends State<EventCalendar> {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      sliver: SliverToBoxAdapter(
        child: Card(
            color: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.24,
              child: ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  itemBuilder: (context, index) =>
                      eventItemBuilder(context, index),
                  itemCount: 2),
            )),
      ),
    );
  }
}

Widget eventItemBuilder(BuildContext context, int index) {
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
        // SizedBox(
        //   width: 20,
        // ),
        // Container(
        //   height: 70,
        //   width: MediaQuery.of(context).size.width * 0.2,
        //   child: ClipRRect(
        //     borderRadius: BorderRadius.all(Radius.circular(5)),
        //     child: Image.network(
        //       "https://www.cityam.com/wp-content/uploads/2021/07/CAMD-G89-1024-GBrown-copy-1.jpg",
        //       fit: BoxFit.cover,
        //     ),
        //   ),
        // ),
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


// return SliverPadding(
//       padding: EdgeInsets.symmetric(horizontal: 10.0),
//       sliver: SliverToBoxAdapter(
//         child: Card(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.all(
//               Radius.circular(10),
//             ),
//           ),
//           child: Stack(
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.all(Radius.circular(10)),
//                 child: Image.network(
//                   "https://www.ssearena.co.uk/assets/img/fbs-1440x810-c08f628e73.jpg",
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               Positioned(
//                 top: 20,
//                 right: 20,
//                 child: Container(
//                   height: 55,
//                   width: 50,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(10)),
//                     color: Colors.white,
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         "21",
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontWeight: FontWeight.w800,
//                             fontSize: 25),
//                       ),
//                       Text(
//                         "DEC",
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontWeight: FontWeight.w300,
//                             fontSize: 14),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Positioned.fill(
//                 child: Container(
//                   alignment: Alignment.bottomCenter,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(10)),
//                     color: Colors.white,
//                     gradient: LinearGradient(
//                       begin: FractionalOffset.topCenter,
//                       end: FractionalOffset.bottomCenter,
//                       colors: [
//                         Colors.transparent,
//                         Colors.black,
//                       ],
//                       stops: [0.4, 0.8],
//                     ),
//                   ),
//                   child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 15, vertical: 20),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.stretch,
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Text(
//                             "M&S Bank Arena, Monarchs Quay, Liverpool",
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w300,
//                                 fontSize: 16),
//                           ),
//                           SizedBox(
//                             height: 5,
//                           ),
//                           Text(
//                             "Fatboy Slim",
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w800,
//                                 fontSize: 28),
//                           ),
//                         ],
//                       )),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
