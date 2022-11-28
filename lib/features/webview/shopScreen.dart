import 'dart:async';
import 'dart:math';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:guide_liverpool/common/router/routes.dart';
import 'package:guide_liverpool/features/webview/post_code_dialog.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/redux/viewsmodels/shop_screen.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  String _imageName = "0";
  late InAppWebViewController webView;
  List<String> peeplLogos = [
    "0",
    "1",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "15",
    "16",
    "18",
    "19",
    "20",
    "22",
    "23",
    "24",
    "25",
    "26",
    "27",
    "30",
    "31",
    "32",
    "34",
  ];

  late Timer imageTimer;

  @override
  void initState() {
    imageTimer = Timer.periodic(Duration(seconds: 4), (timer) {
      setState(() {
        _imageName = peeplLogos[Random().nextInt(peeplLogos.length)];
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
    return StoreConnector<AppState, ShopScreenViewModel>(
      converter: ShopScreenViewModel.fromStore,
      onInit: (store) {
        if (store.state.userState.postCode.isEmpty) {
          Future.delayed(const Duration(seconds: 2), () {
            showDialog(context: context, builder: (_) => PostCodeDialog());
          });
        }
      },
      builder: (_, viewmodel) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            iconTheme: IconThemeData(
              color: Theme.of(context)
                  .colorScheme
                  .onSurface, //change your color here
            ),
            // leading: IconButton(
            //     onPressed: () {
            //       context.router.navigate(GuideHomeTab());
            //     },
            //     icon: Icon(Icons.arrow_back_ios)),
            backgroundColor: Theme.of(context).colorScheme.secondary,
            centerTitle: true,
            title: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(opacity: animation, child: child);
              },
              child: Image.asset(
                "assets/Peepl-Logos/$_imageName.png",
                height: kToolbarHeight + 5,
                key: ValueKey<String>(_imageName),
              ),
            ),
          ),
          body: InAppWebView(
            onJsAlert: (controller, jsAlertRequest) {
              return Future<JsAlertResponse>(
                () {
                  return JsAlertResponse(
                      message: jsAlertRequest.message ?? "message");
                },
              );
            },
            initialUrlRequest: URLRequest(
              url: Uri.parse("https://itsaboutpeepl.com/community/#"),
              //TODO:
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
                  viewmodel.updatePaymentIntentId(values[0][0]);
                  viewmodel.getOrderDetails(context);
                },
              );
              webView.addJavaScriptHandler(
                handlerName: "getOrderAmounts",
                callback: (values) {
                  return {
                    "gbpAmount": viewmodel.selectedGbpxAmount,
                    "pplAmount": viewmodel.selectedPplAmount
                  };
                },
              );
              webView.addJavaScriptHandler(
                handlerName: "storePostcode",
                callback: (values) {
                  viewmodel.storePostcode(values[0][0]);
                },
              );
              webView.addJavaScriptHandler(
                handlerName: "getPostcode",
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

// Old Code

// SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Card(
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20)),
//                 color: Color(0xFF0D2A21),
//                 child: SizedBox(
//                   width: double.infinity,
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                       vertical: 30,
//                       horizontal: 20,
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Align(
//                           alignment: Alignment.centerRight,
//                           child: Image.asset(
//                             "assets/images/Vegi-Logo-horizontal.png",
//                             width: MediaQuery.of(context).size.width * 0.5,
//                           ),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Text(
//                           "Shop vegan on vegi!",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 22,
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                         SizedBox(
//                           height: 5,
//                         ),
//                         Text(
//                           "Buy groceries, takeaways and plant-based products from independent businesses using your vegi wallet. vegi brings you the vegan food that you love and know, all from the ease of your phone.",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 18,
//                           ),
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         ShimmerButton(
//                           buttonContent: Center(
//                             child: Text(
//                               "Coming Soon",
//                               style: TextStyle(
//                                 fontSize: 22,
//                                 fontWeight: FontWeight.w900,
//                               ),
//                             ),
//                           ),
//                           buttonAction: () {
//                             //context.router.push(VegiWebView());
//                           },
//                           baseColor: Color(0xFF8AC479),
//                           highlightColor: Color(0xFFA8D39B),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Card(
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20)),
//                 color: Color(0xFF773094),
//                 child: SizedBox(
//                   width: double.infinity,
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                       vertical: 30,
//                       horizontal: 20,
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Align(
//                           alignment: Alignment.centerRight,
//                           child: Image.asset(
//                             "assets/images/shocal-logo.png",
//                             width: MediaQuery.of(context).size.width * 0.5,
//                           ),
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         Text(
//                           "Saving The High Street",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 22,
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                         SizedBox(
//                           height: 5,
//                         ),
//                         Text(
//                           "We understand that time is of the essence, so we increasingly find ourselves choosing convenience. Shocal brings you the best of your local, independent shops and businesses right at your fingertips.",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 18,
//                           ),
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         ShimmerButton(
//                           buttonContent: Center(
//                             child: Text(
//                               "Coming Soon",
//                               style: TextStyle(
//                                 fontSize: 22,
//                                 fontWeight: FontWeight.w900,
//                               ),
//                             ),
//                           ),
//                           buttonAction: () {
//                             //context.router.push(ShocalWebView());
//                           },
//                           baseColor: Colors.amber,
//                           highlightColor: Colors.amber[100]!,
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
