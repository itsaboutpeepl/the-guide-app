import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/redux/viewsmodels/confetti.dart';

class MyConfettiWidget extends StatefulWidget {
  final Widget child;

  const MyConfettiWidget({
    required this.child,
    Key? key,
  }) : super(key: key);
  @override
  _MyConfettiWidgetState createState() => _MyConfettiWidgetState();
}

class _MyConfettiWidgetState extends State<MyConfettiWidget> {
  late ConfettiController controller;

  @override
  void initState() {
    super.initState();
    controller = ConfettiController(duration: Duration(seconds: 5));
    controller.play();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ConfettiViewModel>(
        converter: ConfettiViewModel.fromStore,
        builder: (_, viewmodel) {
          return Stack(children: [
            widget.child,
            viewmodel.playConfetti
                ? buildConfetti()
                : Padding(padding: EdgeInsets.zero),
          ]);
        });
  }

  Widget buildConfetti() => Align(
        alignment: Alignment.topCenter,
        child: ConfettiWidget(
          confettiController: controller,
          colors: [
            Colors.red,
            Colors.blue,
            Colors.orange,
            Colors.purple,
            Colors.lightBlue,
          ],
          blastDirection: pi / 2,
          blastDirectionality: BlastDirectionality.directional,
          shouldLoop: false,
          emissionFrequency: 0.1,
          numberOfParticles: 10,
          gravity: 0.2,
          maxBlastForce: 5,
          minBlastForce: 4,
          particleDrag: 0.05,
        ),
      );
}
