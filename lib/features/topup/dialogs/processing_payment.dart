import 'package:auto_route/auto_route.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:guide_liverpool/models/app_state.dart';

class _ProcessingPaymentViewModel extends Equatable {
  const _ProcessingPaymentViewModel({
    required this.isLoading,
    required this.isError,
    required this.isSuccessful,
  });

  factory _ProcessingPaymentViewModel.fromStore(Store<AppState> store) {
    return _ProcessingPaymentViewModel(
      isLoading: store.state.networkTabState.transferringTokens,
      isError: store.state.networkTabState.errorCompletingPayment,
      isSuccessful: store.state.networkTabState.confirmedPayment,
    );
  }
  final bool isLoading;
  final bool isError;
  final bool isSuccessful;

  @override
  List<Object> get props => [isLoading, isError, isSuccessful];
}

class ProcessingPayment extends StatefulWidget {
  const ProcessingPayment({
    Key? key,
  }) : super(key: key);
  @override
  State<ProcessingPayment> createState() => _ProcessingPaymentState();
}

class _ProcessingPaymentState extends State<ProcessingPayment>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;
  int _valueKey = 0;

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
    return StoreConnector<AppState, _ProcessingPaymentViewModel>(
      distinct: true,
      converter: _ProcessingPaymentViewModel.fromStore,
      onWillChange: (prevVM, nextVM) {
        if (nextVM.isError) {
          setState(() {
            _valueKey = 1;
          });
          Future.delayed(
            const Duration(seconds: 2),
            () {
              context.router.pop();
              //..navigate(const VeganHomeAltTab());
            },
          );
        }
        if (nextVM.isSuccessful) {
          _valueKey = 2;
          Future.delayed(
            const Duration(seconds: 2),
            () {
              context.router.pop();
              //..navigate(const OrderConfirmedScreen());
            },
          );
        }
      },
      builder: (_, viewmodel) => ScaleTransition(
        scale: scaleAnimation,
        child: AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          title: Center(
            child: Container(
              margin: const EdgeInsets.only(left: 28, right: 28),
              child: Center(
                child: AnimatedCrossFade(
                  crossFadeState: viewmodel.isLoading
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: const Duration(milliseconds: 500),
                  firstChild: SizedBox(
                    width: 60,
                    height: 60,
                    child: Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 5,
                        color: Theme.of(context).primaryColorDark,
                      ),
                    ),
                  ),
                  secondChild: SizedBox(
                    width: 60,
                    height: 60,
                    child: viewmodel.isError
                        ? Icon(
                            Icons.error_outline_outlined,
                            size: 50,
                            color: Theme.of(context).primaryColorDark,
                          )
                        : Icon(
                            Icons.done,
                            size: 50,
                            color: Theme.of(context).primaryColorDark,
                          ),
                  ),
                ),
              ),
            ),
          ),
          content: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: Text(
                    viewmodel.isLoading
                        ? 'Processing your payment'
                        : viewmodel.isError
                            ? 'Something went wrong!'
                            : 'Payment completed successfully',
                    key: ValueKey(_valueKey),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: Text(
                    viewmodel.isLoading
                        ? 'Sorry if this is taking too long'
                        : viewmodel.isError
                            ? 'Please contact us at help@vegi.co.uk'
                            : 'Thank you for your order!',
                    key: ValueKey(_valueKey),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
