import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:guide_liverpool/features/shared/widgets/paymentSheet.dart';
import 'package:guide_liverpool/features/shared/widgets/snackbars.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/redux/viewsmodels/paymentSheet.dart';

class WebviewScreen extends StatefulWidget {
  const WebviewScreen({Key? key}) : super(key: key);

  @override
  State<WebviewScreen> createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {
  late InAppWebViewController webView;

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
                    Color.fromRGBO(92, 32, 142, 1),
                    Color.fromRGBO(102, 40, 153, 1),
                  ],
                ),
              ),
            ),
          ),
          body: InAppWebView(
            initialUrlRequest:
                URLRequest(url: Uri.parse(dotenv.env["SHOCAL_URL"]! + "?walletAddress=${viewmodel.walletAddress}")),
            onWebViewCreated: (InAppWebViewController controller) {
              webView = controller;
              webView.addJavaScriptHandler(
                handlerName: "isWebView",
                callback: (list) {
                  return true;
                },
              );
              webView.addJavaScriptHandler(
                handlerName: "initPayment",
                callback: (values) {
                  viewmodel.getOrderDetails(
                    "paymentIntentID", //TODO: replace with actual payment intent ID
                    () {
                      //success Callback - show payment sheet
                      showModalBottomSheet(
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
