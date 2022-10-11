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
              width: MediaQuery.of(context).size.width * 0.9,
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
                                    "The Guide has partnered with Peepl to give all of our app users their own wallet, rewarding you for shopping locally. \n\nWhen you watch some of the videos that appear within our app, you will get Peepl rewards. \n\nYou can use your rewards, and save money on purchases made through the Peepl Community button in the bottom right. \n\nWe’re excited to partner with Peepl on their mission to move away from extractive big tech and keep more money in our local community. \n\nAny feedback you have on the app please share with info@theguideliverpool.com and if you would like to learn more about Peepl you can visit "),
                            TextSpan(
                              text: "www.itsaboutpeepl.com ",
                              style: TextStyle(
                                color: flexColorSchemeLight.primary,
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: new TapGestureRecognizer()
                                ..onTap = () {
                                  UrlLaunch.launchURL(
                                      "https://www.itsaboutpeepl.com");
                                },
                            ),
                            TextSpan(
                                text: "and get in touch with them from there."),
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
