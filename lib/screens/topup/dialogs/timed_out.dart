import 'package:flutter/material.dart';

class TimedOut extends StatefulWidget {
  @override
  _TimedOutState createState() => _TimedOutState();
}

class _TimedOutState extends State<TimedOut>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;
  bool isPreloading = false;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext _context) {
    return ScaleTransition(
        scale: scaleAnimation,
        child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
          content: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Hmmm...',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Minting GBPx taking a bit longer than expected',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  "Don't worry, Just give it a few minutes and refresh balance",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
