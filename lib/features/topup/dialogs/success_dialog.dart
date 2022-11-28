import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:guide_liverpool/features/shared/widgets/primary_button.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/redux/viewsmodels/topup.dart';

class TopUpSuccess extends StatefulWidget {
  const TopUpSuccess(this.amountText, this.showOrderNow, {Key? key})
      : super(key: key);
  final String amountText;
  final bool showOrderNow;
  @override
  State<TopUpSuccess> createState() => _TopUpSuccessState();
}

class _TopUpSuccessState extends State<TopUpSuccess>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;
  bool isPreloading = false;

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
    return ScaleTransition(
      scale: scaleAnimation,
      child: AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        title: const Text(
          '💸 Success!',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        content: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                '£${widget.amountText} Topped Up',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Thanks for topping up your Peepl Wallet!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'You can now go ahead and enjoy one of '
                'the Peepl Eat Experiences this weekend 😋',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              if (widget.showOrderNow)
                const SizedBox(height: 20)
              else
                const SizedBox.shrink(),
              if (widget.showOrderNow)
                Center(
                  child: StoreConnector<AppState, TopUpViewModel>(
                    distinct: true,
                    converter: TopUpViewModel.fromStore,
                    builder: (_, viewModel) => PrimaryButton(
                      label: 'Order now',
                      onPressed: () {
                        context.router.popUntilRoot();
                      },
                    ),
                  ),
                )
              else
                const SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }
}
