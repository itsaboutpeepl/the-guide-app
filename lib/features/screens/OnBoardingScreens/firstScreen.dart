import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen();

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.32,
            left: 20,
            right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Transform.rotate(
              angle: 50,
              child: Image.asset(
                'assets/images/guide-logo-horizontal.png',
                width: MediaQuery.of(context).size.width * .9,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 5),
              child: Text(
                "The Best of Liverpool City Region",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              "right at your fingertips.",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w100,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: AutoSizeText.rich(
                TextSpan(children: [
                  TextSpan(
                    text:
                        "Welcome to The Guide Liverpool app! Here you’ll find the latest good news and what’s on info from across the city region. ",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ]),
                minFontSize: 16,
                maxFontSize: 20,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
