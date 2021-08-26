import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:peepl/models/app_state.dart';
import 'package:peepl/redux/actions/cash_wallet_actions.dart';
import 'package:peepl/redux/viewsmodels/home.dart';
import 'package:peepl/features/home/widgets/tabs.dart';
import 'package:peepl/features/home/widgets/header.dart';
import 'package:peepl/utils/addresses.dart';
import 'package:peepl/features/shared/widgets/my_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return new StoreConnector<AppState, HomeViewModel>(
      distinct: true,
      converter: HomeViewModel.fromStore,
      onInitialBuild: (viewModel) {
        viewModel.onStart();
      },
      onInit: (store) {
        final communities = store.state.cashWalletState.communities;
        if (!communities.containsKey(defaultCommunityAddress.toLowerCase())) {
          store.dispatch(switchCommunityCall(defaultCommunityAddress));
        }
      },
      builder: (_, viewModel) {
        return Scaffold(
          appBar: MyAppBar(
            height: 156,
            backgroundColor: Colors.black,
            child: Header(),
          ),
          body: Stack(
            children: [
              Tabs(),
              Positioned(
                bottom: 34,
                right: 20,
                child: ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(10),
                            topRight: const Radius.circular(10.0),
                          ),
                        ),
                        builder: (BuildContext context) {
                          return Container(
                            height: height * 0.5,
                            color: Colors.transparent,
                            child: Center(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('Peepl.pay'),
                                      ),
                                      Spacer(),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.cancel_outlined,
                                            color: Colors.blueGrey,
                                          ),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          color: Colors.red,
                                          child: Text("Company Logo"),
                                          height: height * 0.1,
                                          width: width * 0.2,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text("Company Name"),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text("Pay with Peepl.Pay"),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  child: Text('Peepl.Pay'),
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 20.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      primary: Colors.purple),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
