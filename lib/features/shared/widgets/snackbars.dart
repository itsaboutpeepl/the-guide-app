import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:guide_liverpool/features/guideHome/helpers/order_helpers.dart';
import 'package:guide_liverpool/utils/peepl_icons_icons.dart';

void showErrorSnack({
  required BuildContext context,
  String? title,
  int duration = 3,
  EdgeInsets? margin,
  message,
}) {
  Flushbar(
      boxShadows: [
        BoxShadow(
          offset: Offset(0.5, 0.5),
          blurRadius: 5,
        ),
      ],
      duration: Duration(seconds: duration),
      titleText: Text(
        title ?? 'Transaction failed',
        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      ),
      messageText: Text(
        message,
        style: TextStyle(
          fontSize: 14.0,
        ),
      ),
      backgroundColor: BottomAppBarTheme.of(context).color ?? Colors.white,
      margin: margin ?? EdgeInsets.only(top: 8, right: 8, left: 8, bottom: 80),
      borderRadius: BorderRadius.all(
        Radius.circular(8.0),
      ),
      icon: SvgPicture.asset(
        'assets/images/failed_icon.svg',
        width: 20,
        height: 20,
      ))
    ..show(context);
}

void showCopiedFlushbar(context) {
  Flushbar(
    duration: Duration(seconds: 1),
    boxShadows: [
      BoxShadow(
        offset: Offset(0.5, 0.5),
        blurRadius: 5,
      ),
    ],
    messageText: Text(
      'Copied to clipboard',
      textAlign: TextAlign.center,
    ),
    backgroundColor: BottomAppBarTheme.of(context).color ?? Colors.white,
    margin: EdgeInsets.only(
      top: 8,
      right: 8,
      left: 8,
      bottom: 100,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(8.0),
    ),
  )..show(context);
}

void showPlayBackCompletedFlushBar(context, int rewardAmount) {
  Flushbar(
    duration: Duration(seconds: 3),
    boxShadows: [
      BoxShadow(
        offset: Offset(0.5, 0.5),
        blurRadius: 5,
      ),
    ],
    titleText: Text.rich(
      TextSpan(
        style: TextStyle(
            color: Colors.white, fontSize: 25, fontWeight: FontWeight.w900),
        children: [
          WidgetSpan(
            child: Icon(
              PeeplIcons.ppl_circles_02,
              size: 35.0,
              color: Color(0xFFEB4953),
            ),
          ),
          TextSpan(text: "\nThanks for watching")
        ],
      ),
      textAlign: TextAlign.center,
    ),
    messageText: Text.rich(
      TextSpan(
        text: '$rewardAmount PPL tokens (${getPPLValueString(rewardAmount)}) '
            'will be in your wallet in seconds, happy ordering 🥳',
      ),
      style: TextStyle(color: Colors.white),
      textAlign: TextAlign.center,
    ),
    backgroundColor: Color(0xFF333333),
    margin: EdgeInsets.only(
      right: 20,
      left: 20,
      bottom: 50,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(8.0),
    ),
  )..show(context);
}

void showPlayBackCompletedFlushBarNoAcc(context) {
  Flushbar(
    duration: Duration(seconds: 7),
    titleText: Text.rich(
      TextSpan(
        style: TextStyle(
            color: Colors.white, fontSize: 25, fontWeight: FontWeight.w900),
        children: [
          WidgetSpan(
            child: Icon(
              PeeplIcons.ppl_circles_02,
              size: 35.0,
              color: Color(0xFFEB4953),
            ),
          ),
          TextSpan(text: "\nThanks for watching")
        ],
      ),
      textAlign: TextAlign.center,
    ),
    messageText: Text.rich(
      TextSpan(
        text: 'Please create an account to get rewarded '
            'for watching videos, and to order '
            'from your favorite local retailers!',
      ),
      style: TextStyle(color: Colors.white),
      textAlign: TextAlign.center,
    ),
    backgroundColor: Color(0xFF333333),
    margin: EdgeInsets.only(
      right: 20,
      left: 20,
      bottom: 50,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(8.0),
    ),
  )..show(context);
}

void showOrderCreatedFlushBar(BuildContext context) {
  Flushbar<void>(
    duration: const Duration(seconds: 3),
    boxShadows: const [
      BoxShadow(
        offset: Offset(0.5, 0.5),
        blurRadius: 5,
      ),
    ],
    titleText: const Text.rich(
      TextSpan(
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.w900,
        ),
        children: [
          WidgetSpan(
            child: Icon(
              PeeplIcons.ppl_circles_02,
              size: 35,
              color: Color(0xFFEB4953),
            ),
          ),
          TextSpan(text: '\nThank you for ordering')
        ],
      ),
      textAlign: TextAlign.center,
    ),
    messageText: Text.rich(
      TextSpan(
        text: 'You will recieve an email with your confirmation details',
      ),
      style: const TextStyle(color: Colors.white),
      textAlign: TextAlign.center,
    ),
    backgroundColor: const Color(0xFF333333),
    margin: const EdgeInsets.only(
      right: 20,
      left: 20,
      bottom: 50,
    ),
    borderRadius: const BorderRadius.all(
      Radius.circular(8),
    ),
  ).show(context);
}
