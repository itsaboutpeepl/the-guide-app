import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:guide_liverpool/features/shared/widgets/paymentSheet.dart';
import 'package:guide_liverpool/features/shared/widgets/snackbars.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/redux/viewsmodels/paymentSheet.dart';

class ShocalWebView extends StatefulWidget {
  const ShocalWebView({Key? key}) : super(key: key);

  @override
  State<ShocalWebView> createState() => _ShocalWebViewState();
}

class _ShocalWebViewState extends State<ShocalWebView> {
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
                    Color(0xFF552489),
                    Color(0xFF3E2285),
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
              url: Uri.parse("https://shocal.org"),
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
                  viewmodel.updatePaymentIntentID(values[0]["paymentIntent"]);
                  viewmodel.getOrderDetails(
                    values[0]["paymentIntent"],
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
                      showErrorSnack(context: context, title: "Something went wrong, try again later please!");
                    },
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
