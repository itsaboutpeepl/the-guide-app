import 'package:flutter/material.dart';
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
            initialUrlRequest: URLRequest(url: Uri.parse("http://localhost:60825/#")),
            onWebViewCreated: (InAppWebViewController controller) {
              webView = controller;
              webView.addJavaScriptHandler(
                handlerName: "isWebView",
                callback: (list) {
                  return {"walletAddress": viewmodel.walletAddress, "displayName": "Hussain"};
                },
              );
              webView.addJavaScriptHandler(
                handlerName: "makePayment",
                callback: (values) {
                  if (values.isEmpty) return;
                  viewmodel.getOrderDetails(
                    values[0]["paymentIntent"], //TODO: replace with actual payment intent ID
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
