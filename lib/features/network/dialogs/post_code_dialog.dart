import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:guide_liverpool/features/shared/widgets/primary_button.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/redux/actions/user_actions.dart';

class PostCodeDialog extends StatefulWidget {
  const PostCodeDialog({
    Key? key,
  }) : super(key: key);
  @override
  State<PostCodeDialog> createState() => _PostCodeDialogState();
}

class _PostCodeDialogState extends State<PostCodeDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;
  bool isPreloading = false;
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);

    controller
      ..addListener(() {
        setState(() {});
      })
      ..forward();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, void Function(String postcode)>(
      distinct: true,
      converter: (store) {
        return (String postcode) {
          store.dispatch(UpdateUserPostcode(postCode: postcode));
        };
      },
      builder: (_, updatePostcode) => ScaleTransition(
        scale: scaleAnimation,
        child: AlertDialog(
          buttonPadding: const EdgeInsets.all(20),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          title: const Text(
            'Please add your postcode to get personalized content!',
            textAlign: TextAlign.center,
          ),
          content: TextField(
            textCapitalization: TextCapitalization.words,
            decoration: const InputDecoration(
              fillColor: Colors.transparent,
              labelText: 'Postcode',
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
            controller: _textController,
          ),
          actions: [
            PrimaryButton(
              onPressed: () {
                updatePostcode(_textController.text.toUpperCase());
                context.router.pop();
              },
              label: 'Save',
            )
          ],
          actionsAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}
