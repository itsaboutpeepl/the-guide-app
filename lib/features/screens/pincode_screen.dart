import 'package:auto_route/auto_route.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/redux/viewsmodels/backup.dart';
import 'package:guide_liverpool/common/router/routes.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

@RoutePage()
class PincodePage extends StatefulWidget {
  @override
  _PincodePageState createState() => _PincodePageState();
}

class _PincodePageState extends State<PincodePage> {
  final pincodeController = TextEditingController(text: "");
  String currentText = "";
  late Flushbar flush;
  final formKey = GlobalKey<FormState>();
  // StreamController<ErrorAnimationType> errorController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // errorController.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * .5,
              width: MediaQuery.of(context).size.width * .9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 100,
                  ),
                  Expanded(
                    child: Image.asset(
                      'assets/images/guide-logo-horizontal.png',
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Enter pincode',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        StoreConnector<AppState, LockScreenViewModel>(
                          converter: LockScreenViewModel.fromStore,
                          builder: (_, viewModel) => Form(
                            key: formKey,
                            child: Container(
                              width: 250,
                              child: PinCodeTextField(
                                backgroundColor: Colors.transparent,
                                length: 6,
                                showCursor: false,
                                autoFocus: true,
                                appContext: context,
                                enableActiveFill: true,
                                obscureText: true,
                                enablePinAutofill: false,
                                keyboardType: TextInputType.numberWithOptions(
                                  signed: false,
                                  decimal: false,
                                ),
                                animationType: AnimationType.fade,
                                controller: pincodeController,
                                validator: (String? value) =>
                                    value!.length != 6 &&
                                            value == viewModel.pincode
                                        ? 'Invalid pincode'
                                        : null,
                                textStyle: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                pinTheme: PinTheme(
                                  borderRadius: BorderRadius.circular(5),
                                  borderWidth: 4,
                                  fieldWidth: 35,
                                  shape: PinCodeFieldShape.underline,
                                  inactiveColor: Colors.white,
                                  selectedColor: Colors.white,
                                  activeColor: Colors.white,
                                  inactiveFillColor: Colors.transparent,
                                  selectedFillColor: Colors.transparent,
                                  disabledColor: Colors.transparent,
                                  activeFillColor: Colors.transparent,
                                ),
                                onCompleted: (value) {
                                  if (viewModel.pincode == value) {
                                    context.router.replaceAll([MainRoute()]);
                                    pincodeController.clear();
                                  } else {
                                    flush = Flushbar<bool>(
                                      title: 'Invalid pincode',
                                      message: 'Authentication Failed',
                                      icon: Icon(
                                        Icons.info_outline,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                      mainButton: TextButton(
                                        onPressed: () async {
                                          flush.dismiss(true);
                                        },
                                        child: Text(
                                          'Please try again',
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary),
                                        ),
                                      ),
                                    )..show(context).then(
                                        (result) async {
                                          if (result == true) {
                                            pincodeController.clear();
                                            WidgetsBinding.instance.focusManager
                                                .primaryFocus
                                                ?.previousFocus();
                                          }
                                        },
                                      );
                                  }
                                },
                                onChanged: (value) {
                                  setState(() {
                                    currentText = value;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
