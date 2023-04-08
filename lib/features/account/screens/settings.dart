import 'dart:core';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guide_liverpool/common/di/package_info.dart';
import 'package:guide_liverpool/features/account/widgets/menu_tile.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/redux/actions/user_actions.dart';
import 'package:guide_liverpool/common/router/routes.dart';
import 'package:guide_liverpool/features/shared/widgets/my_scaffold.dart';
import 'package:guide_liverpool/services.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return MyScaffold(
      title: 'Settings',
      body: StoreConnector<AppState, void Function()>(
        converter: (store) {
          return () => store.dispatch(LogoutRequestSuccess());
        },
        builder: (_, logout) => Container(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: <Widget>[
              Divider(),
              MenuTile(
                label: 'App Version',
                menuIcon: 'app_version.svg',
                trailing: Text(
                  "${packageInfo.version} ${(packageInfo.buildNumber)}",
                  style: TextStyle(color: Color(0xFF7E7E7E)),
                ),
              ),
              Divider(),
              ListTile(
                contentPadding: EdgeInsets.only(
                  top: 5,
                  bottom: 5,
                ),
                title: Row(
                  children: <Widget>[
                    SvgPicture.asset(
                      'assets/images/social_icon.svg',
                      width: 15,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Enable Notifications",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                onTap: () {
                  firebaseMessaging
                      .requestPermission()
                      .then((value) => print(value.authorizationStatus));
                },
              ),
              Divider(),
              ListTile(
                contentPadding: EdgeInsets.only(
                  top: 5,
                  bottom: 5,
                ),
                onTap: () {
                  logout();
                  context.router.replace(OnboardRoute());
                },
                title: Row(
                  children: <Widget>[
                    SvgPicture.asset(
                      'assets/images/log-out.svg',
                      width: 15,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Logout',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
