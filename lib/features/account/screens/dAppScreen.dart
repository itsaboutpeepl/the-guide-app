import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:guide_liverpool/features/guideHome/helpers/dateTimeFormat.dart';
import 'package:guide_liverpool/features/shared/widgets/ShimmerButton.dart';
import 'package:guide_liverpool/features/shared/widgets/my_scaffold.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/redux/actions/home_page_actions.dart';
import 'package:guide_liverpool/redux/viewsmodels/dappPageViewModel.dart';
import 'package:guide_liverpool/utils/format.dart';

import '../../../utils/peepl_icons_icons.dart';

class DAppScreen extends StatefulWidget {
  const DAppScreen({Key? key}) : super(key: key);

  @override
  State<DAppScreen> createState() => _DAppScreenState();
}

class _DAppScreenState extends State<DAppScreen> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, DappPageViewModel>(
      distinct: true,
      converter: DappPageViewModel.fromStore,
      onInitialBuild: (viewModel) {
        // viewModel.onStart();
      },
      onInit: (store) {
        store.dispatch(UpdateIsLoading(isLoading: true));
      },
      builder: (_, viewModel) => MyScaffold(
        title: "Token Vesting Schedule",
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Icon(
                     PeeplIcons.ppl_circles_02,
                      color: Color(0xFFFF344D),
                      size: 60,
                      ),
                ),
                SizedBox(
                  height: 20,
                ),
                RefreshIndicator(
                  onRefresh: () async {},
                  child: viewModel.isLoading
                      ? CircularProgressIndicator()
                      : StaggeredGrid.count(
                          crossAxisCount: 4,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 5,
                          children: [
                            StaggeredGridTile.count(
                              crossAxisCellCount: 2,
                              mainAxisCellCount: 1.75,
                              child: VestingInfoCard(
                                value: viewModel.currentScheduleID ==
                                        'No Vesting Schedule Found'
                                    ? '${viewModel.currentScheduleID}'
                                    : '${Formatter.formatEthAddress(viewModel.currentScheduleID)}',
                                extraText: "",
                                title: "Schedule ID",
                              ),
                            ),
                            StaggeredGridTile.count(
                              crossAxisCellCount: 2,
                              mainAxisCellCount: 1.75,
                              child: VestingInfoCard(
                                value: "${viewModel.vestedTotal} PPL",
                                extraText: "",
                                title: "Vested Amount",
                              ),
                            ),
                            StaggeredGridTile.count(
                              crossAxisCellCount: 2,
                              mainAxisCellCount: 1.75,
                              child: VestingInfoCard(
                                value: "${viewModel.endTimeDays} Days",
                                extraText:
                                    "${dateFormatter(viewModel.scheduleEnd)}",
                                title: "Fully Vested",
                              ),
                            ),
                            StaggeredGridTile.count(
                              crossAxisCellCount: 2,
                              mainAxisCellCount: 1.75,
                              child: VestingInfoCard(
                                value: "${viewModel.currentAmountReleasable}",
                                extraText: "",
                                title: "Withdrawable Amount",
                              ),
                            ),
                            StaggeredGridTile.count(
                              crossAxisCellCount: 4,
                              mainAxisCellCount: 1.75,
                              child: VestingInfoCard(
                                value: "${viewModel.cliffEndDays} Days",
                                extraText: "${dateFormatter(viewModel.cliff)}",
                                title: "Withdrawable Avaliable in",
                              ),
                            ),
                          ],
                        ),
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
      ),
    );
  }
}

class VestingInfoCard extends StatelessWidget {
  const VestingInfoCard(
      {Key? key,
      required this.title,
      required this.extraText,
      required this.value})
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
