import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:guide_liverpool/redux/actions/user_actions.dart';
import 'package:guide_liverpool/services.dart';
import 'package:guide_liverpool/features/shared/widgets/my_scaffold.dart';
import 'package:guide_liverpool/features/shared/widgets/primary_button.dart';
import 'package:guide_liverpool/features/onboard/dialogs/signup.dart';
import 'package:guide_liverpool/features/shared/widgets/snackbars.dart';
import 'package:phone_number/phone_number.dart';

typedef SignUp = void Function(
  CountryCode,
  PhoneNumber,
  Function onSuccess,
  Function(dynamic error) onError,
);

@RoutePage()
class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final fullNameController = TextEditingController(text: "");
  final phoneController = TextEditingController(text: "");
  final _formKey = GlobalKey<FormState>();
  CountryCode countryCode = CountryCode.fromCountryCode("GB");
  bool isPreloading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      resizeToAvoidBottomInset: false,
      title: 'Sign up',
      body: InkWell(
        onTap: () {
          WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
        },
        child: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Please enter your phone number so we can setup your account',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        focusColor: Theme.of(context).canvasColor,
                        highlightColor: Theme.of(context).canvasColor,
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => SignUpDialog(),
                          );
                        },
                        child: Center(
                          child: Text(
                            'Why do we need this?',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 30, right: 30),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(
                            child: Container(
                              width: 280,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                    width: 2.0,
                                  ),
                                ),
                              ),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    child: CountryCodePicker(
                                      onChanged: (_countryCode) {
                                        setState(() {
                                          countryCode = _countryCode;
                                        });
                                      },
                                      searchDecoration: InputDecoration(
                                        border: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSurface,
                                          ),
                                        ),
                                        fillColor:
                                            Theme.of(context).canvasColor,
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSurface,
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSurface,
                                          ),
                                        ),
                                      ),
                                      dialogSize: Size(
                                          MediaQuery.of(context).size.width *
                                              .9,
                                          MediaQuery.of(context).size.height *
                                              0.85),
                                      searchStyle: TextStyle(
                                        fontSize: 18,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                      ),
                                      showFlag: true,
                                      initialSelection: countryCode.code,
                                      showCountryOnly: false,
                                      dialogTextStyle: TextStyle(
                                        fontSize: 18,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                      ),
                                      textStyle: TextStyle(
                                        fontSize: 18,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                      ),
                                      alignLeft: false,
                                    ),
                                  ),
                                  Icon(Icons.arrow_drop_down),
                                  Container(
                                    height: 35,
                                    width: 1,
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                    margin:
                                        EdgeInsets.only(left: 5.0, right: 5.0),
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      controller: phoneController,
                                      keyboardType: TextInputType.number,
                                      autofocus: true,
                                      validator: (String? value) =>
                                          value!.isEmpty
                                              ? "Please enter mobile number"
                                              : null,
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSurface),
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                          vertical: 20,
                                          horizontal: 10,
                                        ),
                                        hintText: 'Phone Number',
                                        border: InputBorder.none,
                                        fillColor: Theme.of(context)
                                            .colorScheme
                                            .background,
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 40.0),
                          StoreConnector<AppState, SignUp>(
                            distinct: true,
                            converter: (store) => (
                              CountryCode countryCode,
                              PhoneNumber phoneNumber,
                              Function onSuccess,
                              dynamic Function(dynamic) onError,
                            ) =>
                                store.dispatch(
                                  loginHandler(
                                    countryCode,
                                    phoneNumber,
                                    onSuccess,
                                    onError,
                                  ),
                                ),
                            builder: (_, signUp) => Center(
                              child: PrimaryButton(
                                label: 'Next',
                                preload: isPreloading,
                                disabled: isPreloading,
                                onPressed: () async {
                                  final String phoneNumber =
                                      '${countryCode.dialCode}${phoneController.text}';
                                  setState(() {
                                    isPreloading = true;
                                  });
                                  try {
                                    PhoneNumber value =
                                        await phoneNumberUtil.parse(phoneNumber,
                                            regionCode: countryCode.code);
                                    signUp(
                                      countryCode,
                                      value,
                                      () {
                                        setState(() {
                                          isPreloading = false;
                                        });
                                      },
                                      (error) {
                                        setState(() {
                                          isPreloading = false;
                                        });
                                        showErrorSnack(
                                          message: 'Invalid number',
                                          title: 'Something went wrong',
                                          context: context,
                                          margin: EdgeInsets.only(
                                            top: 8,
                                            right: 8,
                                            left: 8,
                                            bottom: 120,
                                          ),
                                        );
                                      },
                                    );
                                  } catch (e) {
                                    setState(() {
                                      isPreloading = false;
                                    });
                                    showErrorSnack(
                                      message: 'Invalid number',
                                      title: 'Something went wrong',
                                      context: context,
                                      margin: EdgeInsets.only(
                                        top: 8,
                                        right: 8,
                                        left: 8,
                                        bottom: 120,
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 40.0),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
