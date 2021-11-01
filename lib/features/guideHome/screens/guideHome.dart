import 'package:flutter/material.dart';
import 'package:peepl/features/shared/widgets/my_app_bar.dart';
// import 'package:flutter_redux/flutter_redux.dart';
// import 'package:peepl/models/app_state.dart';
// import 'package:peepl/redux/actions/cash_wallet_actions.dart';
// import 'package:peepl/redux/viewsmodels/home.dart';
// import 'package:peepl/features/home/widgets/header.dart';
// import 'package:peepl/utils/addresses.dart';
// import 'package:peepl/features/shared/widgets/my_app_bar.dart';

class GuideHomeScreen extends StatefulWidget {
  const GuideHomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<GuideHomeScreen> createState() => _GuideHomeScreenState();
}

class _GuideHomeScreenState extends State<GuideHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(
          child: Text("hello"),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          child: Center(
            child: Text(
              "data",
              style: TextStyle(fontSize: 50),
            ),
          ),
        ));
  }
}
