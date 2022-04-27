import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:guide_liverpool/common/router/routes.dart';
import 'package:guide_liverpool/features/account/screens/verify_mnemonic.dart';
import 'package:guide_liverpool/features/shared/widgets/my_scaffold.dart';
import 'package:guide_liverpool/features/shared/widgets/primary_button.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/redux/viewsmodels/backup.dart';

class VerifyUserMnemonic extends StatefulWidget {
  const VerifyUserMnemonic({Key? key}) : super(key: key);

  @override
  State<VerifyUserMnemonic> createState() => _VerifyUserMnemonicState();
}

class _VerifyUserMnemonicState extends State<VerifyUserMnemonic> {
  List<int> selectedWordsNum = <int>[];
  final _formKey = GlobalKey<FormState>();

  List<int> getRandom3Numbers() {
    List<int> list = new List<int>.generate(12, (int index) => index + 1);
    list.shuffle();
    List<int> _l = list.sublist(0, 3);
    _l.sort();
    return _l;
  }

  @override
  void initState() {
    super.initState();

    selectedWordsNum = getRandom3Numbers();
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: "Verify Seed Phrase",
      body: StoreConnector<AppState, BackupViewModel>(
        converter: BackupViewModel.fromStore,
        builder: (_, viewModel) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Text(
                  "Please enter the correct words below",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Spacer(flex: 1),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Word(
                        mnemonic: viewModel.user.mnemonic,
                        wordIndex: selectedWordsNum[0],
                      ),
                      SizedBox(height: 16.0),
                      Word(
                        mnemonic: viewModel.user.mnemonic,
                        wordIndex: selectedWordsNum[1],
                      ),
                      SizedBox(height: 16.0),
                      Word(
                        mnemonic: viewModel.user.mnemonic,
                        wordIndex: selectedWordsNum[2],
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(
                flex: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: PrimaryButton(
                  label: "Next",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.router.push(SignUpScreen());
                    }
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
