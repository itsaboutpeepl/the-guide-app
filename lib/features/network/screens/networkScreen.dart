import 'dart:async';
import 'dart:math';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:guide_liverpool/common/router/routes.dart';
import 'package:guide_liverpool/constants/keys.dart';
import 'package:guide_liverpool/constants/variables.dart';
import 'package:guide_liverpool/features/network/dialogs/loading_dialog.dart';
import 'package:guide_liverpool/features/network/dialogs/post_code_dialog.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/redux/viewsmodels/network_screen.dart';

final _communityURI = Uri.parse('https://itsaboutpeepl.com/community/');
//Uri.parse('http://localhost:1234');

class NetworkScreen extends StatefulWidget {
  NetworkScreen({Key? key}) : super(key: key);

  @override
  State<NetworkScreen> createState() => _NetworkScreenState();
}

class _NetworkScreenState extends State<NetworkScreen> {
  InAppWebViewController? webViewController;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, NetworkScreenViewModel>(
      converter: NetworkScreenViewModel.fromStore,
      distinct: true,
      builder: (_, viewmodel) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: NetworkTabAppBar(
            height: 50,
            webViewController: webViewController,
          ),
          body: InAppWebView(
            key: AppKeys.webViewKey,
            initialOptions: InAppWebViewGroupOptions(
              crossPlatform: InAppWebViewOptions(
                clearCache: true,
              ),
            ),
            initialUrlRequest: URLRequest(
              url: _communityURI,
            ),
            onJsAlert: onJsAlert,
            onLoadStart: (controller, url) async {
              viewmodel.updateCurrentUrl(url.toString());
              if (url == _communityURI && await controller.isLoading()) {
                showDialog<void>(
                  context: context,
                  builder: (_) => const LoadingDialog(),
                );
              }
            },
            onLoadStop: (controller, url) {
              context.router.pop();
              if (viewmodel.postCode.isEmpty && url == _communityURI) {
                Future.delayed(const Duration(milliseconds: 500), () {
                  showDialog<void>(
                    context: context,
                    builder: (_) => const PostCodeDialog(),
                  );
                });
              }
            },
            onWebViewCreated: (controller) {
              webViewController = controller;
              controller
                ..addJavaScriptHandler(
                  handlerName: 'getUserInformation',
                  callback: (list) {
                    return {
                      'walletAddress': viewmodel.walletAddress,
                      'displayName': viewmodel.displayName,
                      'phoneNumber': viewmodel.phoneNumber,
                      'postcode': viewmodel.postCode,
                      'gbpBalance': viewmodel.currentGbpxBalance,
                      'pplBalance': viewmodel.currentPplBalance,
                    };
                  },
                )
                ..addJavaScriptHandler(
                  handlerName: 'callPaymentHandlerOnDevice',
                  callback: (values) {
                    if (values.isEmpty) return;

                    viewmodel
                        .updatePaymentIntentId(values[0][0] as String? ?? '');
                    viewmodel.getOrderDetails(
                      context: context,
                      selectedPaymentMethod:
                          values[0][1] as String? ?? 'stripe',
                    );
                  },
                )
                ..addJavaScriptHandler(
                  handlerName: 'getSelectedPaymentAmounts',
                  callback: (values) {
                    return viewmodel.getSelectedPaymentAmounts();
                  },
                )
                ..addJavaScriptHandler(
                  handlerName: 'getPostcode',
                  callback: (values) {
                    return viewmodel.postCode;
                  },
                );
            },
          ),
        );
      },
    );
  }
}

Future<JsAlertResponse> onJsAlert(
  InAppWebViewController controller,
  JsAlertRequest jsAlertRequest,
) async {
  return JsAlertResponse(
    message: jsAlertRequest.message ?? 'message',
  );
}

class NetworkTabAppBar extends StatefulWidget implements PreferredSizeWidget {
  const NetworkTabAppBar({
    Key? key,
    required this.height,
    required this.webViewController,
  }) : super(key: key);

  final double height;
  final InAppWebViewController? webViewController;

  @override
  State<NetworkTabAppBar> createState() => _NetworkTabAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class _NetworkTabAppBarState extends State<NetworkTabAppBar> {
  String _imageName = '0';
  late Timer imageTimer;

  @override
  void initState() {
    imageTimer = Timer.periodic(const Duration(seconds: 4), (timer) {
      setState(() {
        _imageName = Variables.peeplLogos[Random().nextInt(
          Variables.peeplLogos.length,
        )];
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    imageTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, String>(
      converter: (store) {
        return store.state.networkTabState.currentUrl;
      },
      builder: (_, String currentUrl) {
        return AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          iconTheme: IconThemeData(
            color: Theme.of(context)
                .colorScheme
                .onSurface, //change your color here
          ),
          leadingWidth: 150,
          leading: OutlinedButton(
            style: OutlinedButton.styleFrom(side: BorderSide.none),
            onPressed: () {
              backButtonAction(currentUrl);
            },
            child: SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.arrow_back_ios,
                    size: 15,
                  ),
                  Text(
                    getBackButtonString(currentUrl),
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: SizedBox(
            height: kToolbarHeight - 10,
            width: MediaQuery.of(context).size.width * 0.2,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(opacity: animation, child: child);
              },
              child: Image.asset(
                getTitleImage(currentUrl),
                height: kToolbarHeight - 10,
                key: ValueKey<String>(_imageName),
              ),
            ),
          ),
        );
      },
    );
  }

  String getBackButtonString(String url) {
    if (url.contains('vegi') || url.contains('shocal')) {
      return 'Peepl';
    } else
      return 'The Guide';
  }

  void backButtonAction(String url) async {
    if (url.contains('vegi') || url.contains('shocal')) {
      await widget.webViewController!
          .loadUrl(urlRequest: URLRequest(url: _communityURI));
    } else
      await context.router.navigate(const GuideHomeTab());
  }

  String getTitleImage(String url) {
    if (url.contains('vegi')) {
      return 'assets/images/Vegi-Logo-horizontal.png';
    } else if (url.contains('shocal')) {
      return 'assets/images/shocal-logo.png';
    } else
      return 'assets/Peepl-Logos/$_imageName.png';
  }
}
