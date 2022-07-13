import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:guide_liverpool/features/shared/widgets/ShimmerButton.dart';
import 'package:guide_liverpool/features/shared/widgets/my_scaffold.dart';
import 'package:guide_liverpool/utils/peepl_icons_icons.dart';

String _loremIpsum =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.";

class DAppScreen extends StatefulWidget {
  const DAppScreen({Key? key}) : super(key: key);

  @override
  State<DAppScreen> createState() => _DAppScreenState();
}

class _DAppScreenState extends State<DAppScreen> {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: "Token Vesting Schedule",
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  "assets/images/peepl-logo-red.png",
                  width: 150,
                  color: Color(0xFFFF344D),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              StaggeredGrid.count(
                crossAxisCount: 4,
                mainAxisSpacing: 10,
                crossAxisSpacing: 5,
                children: [
                  StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 1.75,
                    child: VestingInfoCard(
                      value: "#####",
                      extraText: "",
                      title: "Schedule ID",
                    ),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 1.75,
                    child: VestingInfoCard(
                      value: "#####",
                      extraText: "",
                      title: "Vested Amount",
                    ),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 1.75,
                    child: VestingInfoCard(
                      value: "#####",
                      extraText: "Vests on: 12th Nov '22",
                      title: "Fully Vested",
                    ),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 1.75,
                    child: VestingInfoCard(
                      value: "#####",
                      extraText: "",
                      title: "Withdrawable Amount",
                    ),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 4,
                    mainAxisCellCount: 1.75,
                    child: VestingInfoCard(
                      value: "1 year, 5 months and 12 days",
                      extraText: "Vests on: 12th Nov '22",
                      title: "Withdrawable Avaliable in",
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ShimmerButton(
                buttonContent: Center(
                  child: Text(
                    "Withdraw",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                buttonAction: () {},
                baseColor: Color(0xFFFF344D),
                highlightColor: Color(0xFFFF344D).withOpacity(0.8),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class VestingInfoCard extends StatelessWidget {
  const VestingInfoCard({Key? key, required this.title, required this.extraText, required this.value})
      : super(key: key);

  final String value;
  final String title;
  final String extraText;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.grey[200],
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            Spacer(),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                extraText,
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// Text(
//                 "What is the Peepl Token?",
//                 style: TextStyle(
//                   fontSize: 22,
//                   fontWeight: FontWeight.w900,
//                 ),
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               Text(
//                 _loremIpsum,
//                 style: TextStyle(
//                   color: Colors.grey[700],
//                   fontSize: 13,
//                 ),
//               )