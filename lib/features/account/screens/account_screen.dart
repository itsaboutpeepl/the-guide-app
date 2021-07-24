import 'dart:core';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:peepl/common/router/routes.dart';
import 'package:peepl/common/router/routes.gr.dart';
import 'package:peepl/features/account/widgets/avatar.dart';
import 'package:peepl/features/account/widgets/menu_tile.dart';
import 'package:peepl/generated/l10n.dart';
import 'package:peepl/models/app_state.dart';
import 'package:peepl/redux/viewsmodels/account.dart';
import 'package:peepl/features/shared/widgets/my_scaffold.dart';

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
                            MenuTile(
                              label: '${I10n.of(context).top_up} \$',
                              menuIcon: 'top_up_icon.svg',
                              onTap: () {
                                context.navigateTo(TopupScreen());
                              },
                            ),
                            MenuTile(
                              label: I10n.of(context).legal,
                              menuIcon: 'legal_icon.svg',
                              onTap: () {
                                context.router.root.push(
                                  Webview(
                                    title: I10n.of(context).legal,
                                    url: 'https://fuse.cash/privacy',
                                  ),
                                );
                              },
                            ),
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
