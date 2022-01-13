import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:guide_liverpool/constants/theme.dart';
import 'package:guide_liverpool/features/guideHome/helpers/UrlLaunch.dart';
import 'package:guide_liverpool/generated/l10n.dart';
import 'dart:core';
import 'package:guide_liverpool/features/shared/widgets/primary_button.dart';

class TokenHelpDialog extends StatefulWidget {
  TokenHelpDialog();
  @override
  createState() => new TokenHelpDialogState();
}

class TokenHelpDialogState extends State<TokenHelpDialog>
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
        content: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Center(
                    child: Container(
                      width: 300,
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontFamily: "Europa",
                            fontSize: 16,
                          ),
                          children: [
                            TextSpan(
                                text:
                                    "The Guide app uses the Fuse blockchain to issue Peepl rewards and as a means to safeguard your privacy. This means we only require your phone number to verify and secure your account, and all information is stored locally on your device.\n\nFor more information on the steps we take to safeguard your privacy, our policy can be found "),
                            TextSpan(
                              text: "here ",
                              style: TextStyle(
                                color: flexColorSchemeLight.primary,
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: new TapGestureRecognizer()
                                ..onTap = () {
                                  UrlLaunch.launchURL(
                                      "https://itsaboutpeepl.com/privacy/");
                                },
                            ),
                            TextSpan(
                                text:
                                    "and can be viewed anytime within the Account section."),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 25.0),
                  Center(
                    child: PrimaryButton(
                      label: I10n.of(context).close,
                      onPressed: () async {
                        Navigator.of(context).pop();
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
