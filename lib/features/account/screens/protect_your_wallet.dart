import 'package:auto_route/auto_route.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guide_liverpool/common/router/routes.dart';
import 'package:guide_liverpool/constants/enums.dart';
import 'package:guide_liverpool/features/account/widgets/menu_tile.dart';
import 'package:guide_liverpool/features/screens/set_up_pincode.dart';
import 'package:guide_liverpool/redux/viewsmodels/security.dart';
import 'package:guide_liverpool/utils/biometric_local_auth.dart';
import 'package:guide_liverpool/features/shared/widgets/my_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:guide_liverpool/models/app_state.dart';

@RoutePage()
class ProtectWalletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: 'Protect Wallet',
      body: StoreConnector<AppState, SecurityViewModel>(
        distinct: true,
        converter: SecurityViewModel.fromStore,
        builder: (_, viewModel) {
          final isBiometric = viewModel.authType == BiometricAuth.faceID ||
              viewModel.authType == BiometricAuth.touchID;
          return Container(
            padding: EdgeInsets.all(20),
            child: ListView(
              shrinkWrap: true,
              primary: false,
              children: <Widget>[
                ListTile(
                  contentPadding: EdgeInsets.only(
                    top: 5,
                    bottom: 5,
                  ),
                  onTap: () {
                    context.router.push(MnemonicRoute());
                  },
                  title: Row(
                    children: <Widget>[
                      SvgPicture.asset(
                        'assets/images/backup_icon.svg',
                        width: 18,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Backup',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                Divider(),
                Padding(
                  padding: EdgeInsets.only(
                    top: 20,
                    bottom: 20,
                  ),
                  child: Text('Please choose a security option'),
                ),
                MenuTile(
                  label: BiometricUtils.getBiometricString(
                    viewModel.authType,
                  ),
                  menuIcon:
                      '${BiometricAuth.faceID == viewModel.authType ? 'face_id' : 'fingerprint'}.svg',
                  trailing: isBiometric
                      ? SvgPicture.asset(
                          'assets/images/checkmark.svg',
                        )
                      : null,
                  onTap: () async {
                    final BiometricAuth biometricAuth =
                        await BiometricUtils.getAvailableBiometrics();
                    final String biometric = BiometricUtils.getBiometricString(
                      biometricAuth,
                    );
                    await BiometricUtils.showDefaultPopupCheckBiometricAuth(
                      message: 'Please use $biometric to unlock',
                      callback: (bool result) {
                        if (result) {
                          viewModel.setSecurityType(biometricAuth);
                          Navigator.of(context).pop();
                        }
                      },
                    );
                  },
                ),
                Divider(),
                MenuTile(
                  label: 'Pincode',
                  menuIcon: 'pincode.svg',
                  trailing: !isBiometric
                      ? SvgPicture.asset(
                          'assets/images/checkmark.svg',
                        )
                      : null,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SetUpPinCodeScreen(
                          onSuccess: () {
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
