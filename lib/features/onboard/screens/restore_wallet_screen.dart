import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:guide_liverpool/common/router/routes.dart';
import 'package:guide_liverpool/features/shared/widgets/my_scaffold.dart';
import 'package:guide_liverpool/features/shared/widgets/primary_button.dart';
import 'package:guide_liverpool/features/shared/widgets/snackbars.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/redux/viewsmodels/recovery.dart';

@RoutePage()
class RestoreFromBackupPage extends StatefulWidget {
  const RestoreFromBackupPage({Key? key}) : super(key: key);

  @override
  State<RestoreFromBackupPage> createState() => _RestoreFromBackupPageState();
}

class _RestoreFromBackupPageState extends State<RestoreFromBackupPage> {
  bool isLoading = false;
  final wordsController = TextEditingController(text: '');
  final _formKey = GlobalKey<FormState>();
  bool isPreloading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    wordsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: 'Restore from backup',
      body: Container(
        padding: const EdgeInsets.only(
          bottom: 40,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Text(
                          'This is a 12 word phrase you were given when you created your previous wallet',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: wordsController,
                          keyboardType: TextInputType.multiline,
                          maxLines: 5,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface,
                            backgroundColor: Theme.of(context).canvasColor,
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                            fillColor: Colors.transparent,
                          ),
                          validator: (String? value) =>
                              value?.split(' ').length != 12
                                  ? 'Please enter 12 words'
                                  : null,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                StoreConnector<AppState, RecoveryViewModel>(
                  distinct: true,
                  converter: RecoveryViewModel.fromStore,
                  builder: (_, viewModel) => Center(
                    child: PrimaryButton(
                      preload: isPreloading,
                      disabled: isPreloading,
                      label: 'Next',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            isPreloading = true;
                          });
                          viewModel.generateWalletFromBackup(
                              wordsController.text.toLowerCase(), () {
                            setState(() {
                              isPreloading = false;
                            });
                            context.router.push(const SignupRoute());
                          }, () {
                            setState(() {
                              isPreloading = false;
                            });
                            showErrorSnack(
                              context: context,
                              message: 'Entered phrase seems to be invalid',
                              title: 'Oops',
                            );
                          });
                        }
                      },
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
