import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:guide_liverpool/features/shared/widgets/primary_button.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:redux/redux.dart';
import 'package:guide_liverpool/redux/actions/user_actions.dart';

class _UpdateContactInfoDialogViewmodel extends Equatable {
  const _UpdateContactInfoDialogViewmodel({
    required this.email,
    required this.updateEmail,
  });

  factory _UpdateContactInfoDialogViewmodel.fromStore(Store<AppState> store) {
    return _UpdateContactInfoDialogViewmodel(
      email: store.state.userState.email,
      updateEmail: (email) {
        store.dispatch(SetEmail(email));
      },
    );
  }

  final String email;
  final void Function(String email) updateEmail;

  @override
  List<Object> get props => [
        email,
      ];
}

class UpdateContactInfoDialog extends StatefulWidget {
  const UpdateContactInfoDialog({super.key});

  @override
  State<UpdateContactInfoDialog> createState() =>
      _UpdateContactInfoDialogState();
}

class _UpdateContactInfoDialogState extends State<UpdateContactInfoDialog> {
  bool _isLoading = false;
  late GlobalKey<FormBuilderState> _updateContactInfoFormKey;

  @override
  void initState() {
    _updateContactInfoFormKey = GlobalKey<FormBuilderState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 20,
        right: 20,
      ),
      child: StoreConnector<AppState, _UpdateContactInfoDialogViewmodel>(
        converter: _UpdateContactInfoDialogViewmodel.fromStore,
        builder: (context, viewmodel) {
          return FormBuilder(
            key: _updateContactInfoFormKey,
            child: Wrap(
              spacing: 5,
              children: [
                const Text(
                  'Please update your contact information '
                  'before making an order',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                FormBuilderTextField(
                  validator: FormBuilderValidators.email(),
                  cursorColor: Colors.white,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: 'Email Address',
                    isDense: true,
                  ),
                  name: 'email',
                ),
                const SizedBox(
                  height: 20,
                ),
                PrimaryButton(
                  onPressed: () {
                    setState(() => _isLoading = true);
                    viewmodel.updateEmail(
                      _updateContactInfoFormKey.currentState!.fields['email']!
                              .value as String? ??
                          '',
                    );
                    Navigator.pop(context, true);
                  },
                  label: 'Apply',
                  width: double.infinity,
                  preload: _isLoading,
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
