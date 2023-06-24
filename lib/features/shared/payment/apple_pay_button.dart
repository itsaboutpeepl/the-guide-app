import 'package:flutter/material.dart';

class ApplePayButton extends StatelessWidget {
  const ApplePayButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/images/apple_pay.png',
        width: 75,
      ),
    );
  }
}
