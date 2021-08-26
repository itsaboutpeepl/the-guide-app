import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:peepl/features/shared/widgets/primary_button.dart';
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
                            height: height * 0.6,
                            color: Colors.transparent,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 8.0,
                                            right: 8.0,
                                            top: 8.0,
                                          ),
                                          child: Text('Peepl.pay'),
                                        ),
                                        Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 8.0,
                                            right: 8.0,
                                            top: 8.0,
                                          ),
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
                                    Divider(),
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "Company Name",
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "Pay with Peepl.Pay",
                                                  style: TextStyle(
                                                      color: Colors.blueGrey,
                                                      fontSize: 15),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    Divider(),
                                    Text(
                                      "To pay send amount to the address:",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.blueGrey,
                                      ),
                                    ),
                                    Text("Amount"),
                                    TextFormField(
                                      enabled: false,
                                      decoration: InputDecoration(
                                        hintText: '50 GBPx',
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 20.0, vertical: 5.0),
                                        filled: true,
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.never,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          borderSide: BorderSide.none,
                                        ),
                                      ),
                                    ),
                                    Text("Address"),
                                    TextFormField(
                                      enabled: false,
                                      decoration: InputDecoration(
                                        hintText:
                                            '0xc0ffee254729296a45a3885639AC7E10F9d54979',
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 20.0, vertical: 5.0),
                                        filled: true,
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.never,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          borderSide: BorderSide.none,
                                        ),
                                        suffixIcon: IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.copy_all_outlined,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        PrimaryButton(
                                          opacity: 1,
                                          // labelFontWeight: FontWeight.normal,
                                          label: "Pay",
                                          onPressed: () {},

                                          width: width * 0.3,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
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
