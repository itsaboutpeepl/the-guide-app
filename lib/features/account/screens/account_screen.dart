import 'dart:core';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guide_liverpool/common/router/routes.dart';
import 'package:guide_liverpool/common/router/routes.gr.dart';
import 'package:guide_liverpool/constants/theme.dart';
import 'package:guide_liverpool/features/account/widgets/avatar.dart';
import 'package:guide_liverpool/features/account/widgets/menu_tile.dart';
import 'package:guide_liverpool/features/guideHome/helpers/UrlLaunch.dart';
import 'package:guide_liverpool/features/shared/widgets/snackbars.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/redux/viewsmodels/account.dart';
import 'package:guide_liverpool/features/shared/widgets/my_scaffold.dart';
import 'package:guide_liverpool/services.dart';

@RoutePage()
class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: 'Account',
      body: StoreConnector<AppState, AccountViewModel>(
        distinct: true,
        onInit: (store) {
          //store.dispatch(getUserVestingCount());
        },
        converter: AccountViewModel.fromStore,
        builder: (_, viewModel) {
          return Container(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Avatar(),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 10,
                        ),
                        child: Column(
                          children: [
                            MenuTile(
                              label: 'Settings',
                              menuIcon: 'settings_icon.svg',
                              onTap: () {
                                context.router.push(SettingsRoute());
                              },
                            ),
                            MenuTile(
                              label: 'Topup',
                              menuIcon: 'top_up_icon.svg',
                              onTap: () {
                                context.router.push(TopupRoute());
                              },
                            ),
                            MenuTile(
                              label: 'Protect Wallet',
                              menuIcon: 'protect_wallet.svg',
                              onTap: () {
                                context.router.push(ProtectWalletRoute());
                              },
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  !viewModel.isBackup
                                      ? Flexible(
                                          child: SvgPicture.asset(
                                            'assets/images/back_up_icon.svg',
                                            width: 12,
                                          ),
                                        )
                                      : SizedBox.shrink(),
                                  !viewModel.isBackup
                                      ? Flexible(
                                          child: SizedBox(
                                            width: 10,
                                          ),
                                        )
                                      : SizedBox.shrink(),
                                  Flexible(
                                    child: Icon(
                                      Icons.navigate_next,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // MenuTile(
                            //   label: '${I10n.of(context).top_up} £',
                            //   menuIcon: 'top_up_icon.svg',
                            //   onTap: () {
                            //     context.navigateTo(TopupScreen());
                            //   },
                            // ),
                            MenuTile(
                              label: 'Legal',
                              menuIcon: 'legal_icon.svg',
                              onTap: () {
                                context.router.root.push(
                                  WebViewRoute(
                                    title: 'Legal',
                                    url:
                                        'https://theguideliverpool.com/the-guide-liverpool-app-privacy-policy/',
                                  ),
                                );
                              },
                            ),
                            MenuTile(
                              label: "Contact",
                              menuIcon: 'contact_us_icon.svg',
                              onTap: () {
                                context.router.root.push(
                                  WebViewRoute(
                                    title: "Contact",
                                    url:
                                        'https://theguideliverpool.com/contact-us/',
                                  ),
                                );
                              },
                            ),
                            MenuTile(
                              label: "About",
                              menuIcon: 'info_black.svg',
                              onTap: () {
                                showModalBottomSheet(
                                    useRootNavigator: true,
                                    backgroundColor: Colors.white,
                                    context: context,
                                    builder: (context) => aboutModal(context));
                              },
                            ),
                            if (kDebugMode)
                              MenuTile(
                                label: "Copy FCM Token",
                                menuIcon: 'info_black.svg',
                                onTap: () async {
                                  Clipboard.setData(
                                    ClipboardData(
                                        text: await firebaseMessaging
                                                .getToken() ??
                                            ''),
                                  );
                                  showCopiedFlushbar(context);
                                },
                              ),
                            SizedBox(),
                            Text.rich(
                              TextSpan(
                                text: "See something wrong? Contact Us \n",
                                children: [
                                  TextSpan(
                                      text: "info@theguideliverpool.com \n",
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () => UrlLaunch.launchEmail(
                                            email:
                                                'info@theguideliverpool.com')),
                                  WidgetSpan(
                                      child: SizedBox(
                                    height: 23,
                                  )),
                                  TextSpan(
                                      text: '+44 1517020143',
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () => UrlLaunch.launchPhone(
                                            phone: '+441517020143'))
                                ],
                              ),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

Widget aboutModal(BuildContext context) {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Image.asset("assets/images/logo-color.png"),
          Divider(
            thickness: 3,
            height: 50,
            indent: 50,
            endIndent: 50,
          ),
          Text(
            "Liverpool's premier what's on platform",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: flexColorSchemeLight.primary,
                fontSize: 30,
                fontFamily: "Europa",
                fontWeight: FontWeight.w900),
          ),
          SizedBox(
            height: 20,
          ),
          RichText(
            text: TextSpan(
              style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 19,
                  fontFamily: "Europa",
                  fontWeight: FontWeight.w500),
              children: [
                TextSpan(
                  text:
                      "We shout loud and proud about the latest good news from the world’s greatest city, so you never miss a moment. \n\n",
                ),
                TextSpan(
                  text:
                      "From events and attractions to bars and restaurants and all the important stuff in between - if it’s on in Liverpool - it’s on The Guide Liverpool.\n\n",
                ),
                TextSpan(
                  text:
                      "To bring you closer to the city than ever before, we’ve teamed up with Peepl so you can buy your favorite things from your best loved independent retailers in a socially conscious way.\n\n",
                ),
                TextSpan(
                  text:
                      "Buy from local businesses using your Peepl wallet and, not only will you help them thrive, you’ll be rewarded too.\n\n",
                ),
                TextSpan(
                  style: TextStyle(fontWeight: FontWeight.w900),
                  text: "What’s not to love?",
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    ),
  );
}
