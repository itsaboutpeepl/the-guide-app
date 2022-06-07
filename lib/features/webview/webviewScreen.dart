import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/redux/viewsmodels/webview.dart';

class WebviewScreen extends StatefulWidget {
  const WebviewScreen({Key? key}) : super(key: key);

  @override
  State<WebviewScreen> createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {
  late InAppWebViewController webView;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, InAppWebViewViewModel>(
      converter: InAppWebViewViewModel.fromStore,
      builder: (_, InAppWebViewViewModel viewModel) {
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
            initialUrlRequest: URLRequest(url: Uri.parse(dotenv.env["SHOCAL_URL"]!)),
            onWebViewCreated: (InAppWebViewController controller) {
              webView = controller;
              webView.addJavaScriptHandler(
                handlerName: "isWebView",
                callback: (list) {
                  return true;
                },
              );
            },
          ),
        );
      },
    );
  }
}


// linear-gradient(90deg, rgb(92, 32, 142), rgb(102, 40, 153))