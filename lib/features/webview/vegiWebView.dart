import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:guide_liverpool/features/shared/widgets/paymentSheet.dart';
import 'package:guide_liverpool/features/shared/widgets/snackbars.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/redux/viewsmodels/paymentSheet.dart';

class VegiWebView extends StatefulWidget {
  const VegiWebView({Key? key}) : super(key: key);

  @override
  State<VegiWebView> createState() => _VegiWebViewState();
}

class _VegiWebViewState extends State<VegiWebView> {
  late InAppWebViewController webView;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PaymentSheetViewModel>(
      converter: PaymentSheetViewModel.fromStore,
      builder: (_, viewmodel) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: PreferredSize(
            preferredSize: Size(double.infinity, 10),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFA8D39B),
                    Color(0xFFA8D39B),
                  ],
                ),
              ),
            ),
          ),
          body: InAppWebView(
            onJsAlert: (controller, jsAlertRequest) {
              return Future<JsAlertResponse>(
                () {
                  return JsAlertResponse(message: jsAlertRequest.message ?? "message");
                },
              );
            },
            initialUrlRequest: URLRequest(
              url: Uri.parse("https://vegiapp.itsaboutpeepl.com"),
            ),
            onWebViewCreated: (InAppWebViewController controller) {
              webView = controller;
              webView.addJavaScriptHandler(
                handlerName: "getWalletAddress",
                callback: (list) {
                  return {"walletAddress": viewmodel.walletAddress};
                },
              );
              webView.addJavaScriptHandler(
                handlerName: "getDisplayName",
                callback: (list) {
                  return {"displayName": viewmodel.displayName};
                },
              );
              webView.addJavaScriptHandler(
                handlerName: "makePayment",
                callback: (values) {
                  if (values.isEmpty) return;
                  viewmodel.updatePaymentIntentID(values[0][0]);
                  viewmodel.getOrderDetails(
                    values[0][0],
                    () {
                      //success Callback - show payment sheet
                      showModalBottomSheet(
                        useRootNavigator: true,
                        backgroundColor: Colors.grey[900],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        elevation: 5,
                        context: context,
                        builder: (context) => PaymentSheet(),
                      );
                    },
                    () {
                      //error Callback - show error sheet
                      showErrorSnack(
                          context: context,
                          title:
                              "Something went wrong, try again later please!");
                    },
                  );
                },
              );
              webView.addJavaScriptHandler(
                handlerName: "getOrderAmounts",
                callback: (values) {
                  return {
                    "gbpAmount":
                        (viewmodel.selectedGBPxAmount).toStringAsFixed(2),
                    "pplAmount": viewmodel.selectedPPLAmount.toStringAsFixed(2)
                  };
                },
              );
            },
          ),
        );
      },
    );
  }
}
