import 'package:flutter/material.dart';
import 'package:guide_liverpool/features/shared/widgets/my_scaffold.dart';

class DAppScreen extends StatefulWidget {
  const DAppScreen({Key? key}) : super(key: key);

  @override
  State<DAppScreen> createState() => _DAppScreenState();
}

class _DAppScreenState extends State<DAppScreen> {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: "DApp Screen",
      body: Center(
        child: Text("Hi Obinna!"),
      ),
    );
  }
}
