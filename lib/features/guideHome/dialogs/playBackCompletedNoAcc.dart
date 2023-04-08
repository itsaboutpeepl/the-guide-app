import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:guide_liverpool/common/router/routes.dart';
import 'dart:core';
import 'package:guide_liverpool/features/shared/widgets/primary_button.dart';
import 'package:guide_liverpool/utils/peepl_icons_icons.dart';

class PlayBackCompletedNoAcc extends StatefulWidget {
  const PlayBackCompletedNoAcc({
    Key? key,
  }) : super(key: key);
  @override
  State<PlayBackCompletedNoAcc> createState() => _PlayBackCompletedNoAccState();
}

class _PlayBackCompletedNoAccState extends State<PlayBackCompletedNoAcc>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> opacityAnimation;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    opacityAnimation = Tween<double>(begin: 0.0, end: 0.4).animate(
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: scaleAnimation,
      child: AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        title: Icon(
          PeeplIcons.ppl_circles_02,
          size: 55.0,
          color: Color(0xFFEB4953),
        ),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              "You’re missing out",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              "Next time, earn rewards for watching The Guide content, to spend at the best local independents.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 20.0),
            PrimaryButton(
                onPressed: () => context.router.navigate(OnboardRoute()),
                label: "Create an account"),
            SizedBox(height: 10.0),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                "Maybe later!",
                style: TextStyle(fontSize: 18, color: Colors.grey[700]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
