import 'dart:core';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guide_liverpool/common/router/routes.dart';
import 'package:guide_liverpool/common/router/routes.gr.dart';
import 'package:guide_liverpool/constants/theme.dart';
import 'package:guide_liverpool/features/account/widgets/avatar.dart';
import 'package:guide_liverpool/features/account/widgets/menu_tile.dart';
import 'package:guide_liverpool/features/guideHome/helpers/UrlLaunch.dart';
import 'package:guide_liverpool/generated/l10n.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/redux/viewsmodels/account.dart';
import 'package:guide_liverpool/features/shared/widgets/my_scaffold.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: I10n.of(context).account,
      body: StoreConnector<AppState, AccountViewModel>(
        distinct: true,
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
                              label: I10n.of(context).settings,
                              menuIcon: 'settings_icon.svg',
                              onTap: () {
                                context.router.push(SettingsScreen());
                              },
                            ),
                            MenuTile(
                              label: I10n.of(context).protect_wallet,
                              menuIcon: 'protect_wallet.svg',
                              onTap: () {
                                context.router.push(ProtectYourWallet());
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
                              label: I10n.of(context).legal,
                              menuIcon: 'legal_icon.svg',
                              onTap: () {
                                context.router.root.push(
                                  Webview(
                                    title: I10n.of(context).legal,
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
                                  Webview(
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
                                showBarModalBottomSheet(
                                    useRootNavigator: true,
                                    backgroundColor: Colors.cyan,
                                    context: context,
                                    builder: (context) => aboutModal(context));
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
                                            "mailto:info@theguideliverpool.com")),
                                  WidgetSpan(
                                      child: SizedBox(
                                    height: 23,
                                  )),
                                  TextSpan(
                                      text: "+44 1517020143",
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () => UrlLaunch.launchPhone(
                                            "tel:+441517020143"))
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
