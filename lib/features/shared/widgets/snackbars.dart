import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:guide_liverpool/generated/l10n.dart';

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
        title ?? I10n.of(context).transaction_failed,
        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      ),
      messageText: Text(
        message,
        style: TextStyle(
          fontSize: 14.0,
        ),
      ),
      backgroundColor: Theme.of(context).bottomAppBarColor,
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
      I10n.of(context).copied_to_clipboard,
      textAlign: TextAlign.center,
    ),
    backgroundColor: Theme.of(context).bottomAppBarColor,
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
        style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w900),
        children: [
          WidgetSpan(
            child: Image.asset(
              "assets/images/avatar-ppl-red.png",
              width: 30,
            ),
          ),
          TextSpan(text: "\nThanks for watching")
        ],
      ),
      textAlign: TextAlign.center,
    ),
    messageText: Text.rich(
      TextSpan(
        text: "Your reward will be added to your wallet soon!",
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
