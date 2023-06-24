import 'package:flutter/material.dart';

class CardPayButton extends StatelessWidget {
  const CardPayButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/images/card_pay.png',
        width: 105,
      ),
    );
  }
}
