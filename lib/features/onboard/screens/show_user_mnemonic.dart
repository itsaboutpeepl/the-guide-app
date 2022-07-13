import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:guide_liverpool/common/router/routes.dart';
import 'package:guide_liverpool/features/onboard/dialogs/mnemonic_info.dart';
import 'package:guide_liverpool/features/shared/widgets/copy.dart';
import 'package:guide_liverpool/features/shared/widgets/my_scaffold.dart';
import 'package:guide_liverpool/features/shared/widgets/primary_button.dart';
import 'package:guide_liverpool/models/app_state.dart';

class ShowUserMnemonicScreen extends StatefulWidget {
  const ShowUserMnemonicScreen({Key? key}) : super(key: key);

  @override
  State<ShowUserMnemonicScreen> createState() => _ShowUserMnemonicScreenState();
}

class _ShowUserMnemonicScreenState extends State<ShowUserMnemonicScreen> {
  List<String> _userMnemonic = [];

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      resizeToAvoidBottomInset: false,
      title: "Seed Phrase",
      body: StoreConnector<AppState, void>(
        converter: (store) {
          _userMnemonic = store.state.userState.mnemonic;
        },
        builder: (_, viewmodel) {
          return Container(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Please save your wallet's seed phrase before proceeding",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                            child: Container(
                              padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                color: Color(0xFFF7F7F7),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15.0),
                                ),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      wordWidget(context, _userMnemonic[0], 1),
                                      wordWidget(context, _userMnemonic[1], 2),
                                      wordWidget(context, _userMnemonic[2], 3)
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      wordWidget(context, _userMnemonic[3], 4),
                                      wordWidget(context, _userMnemonic[4], 5),
                                      wordWidget(context, _userMnemonic[5], 6)
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      wordWidget(context, _userMnemonic[6], 7),
                                      wordWidget(context, _userMnemonic[7], 8),
                                      wordWidget(context, _userMnemonic[8], 9)
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      wordWidget(context, _userMnemonic[9], 10),
                                      wordWidget(context, _userMnemonic[10], 11),
                                      wordWidget(context, _userMnemonic[11], 12)
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 10,
                                      bottom: 10,
                                    ),
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          CopyToClipboard(
                                            content: _userMnemonic.join(" "),
                                          ),
                                          SizedBox(width: 4.0),
                                          Icon(
                                            Icons.content_copy,
                                            size: 16,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => MneomonicInfo(),
                      );
                    },
                    child: Text(
                      "What's a seed phrase?",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                    // child: PrimaryButton(
                    //   onPressed: () => context.router.push(VerifyUserMnemonic()),
                    //   label: "Next",
                    // ),
                    ),
              ],
            ),
          );
        },
      ),
    );
  }
}

Widget wordWidget(
  BuildContext context,
  String word,
  int index,
) =>
    Expanded(
      child: Center(
        child: Padding(
          child: Text("${index.toString()}. $word", style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
        ),
      ),
    );
