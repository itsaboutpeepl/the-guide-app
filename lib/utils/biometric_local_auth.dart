import 'package:local_auth/local_auth.dart';
import 'package:guide_liverpool/constants/enums.dart';

class BiometricUtils {
  static Future<BiometricAuth> getAvailableBiometrics({
    BiometricType type = BiometricType.fingerprint,
  }) async {
    final List<BiometricType> availableBiometrics =
        await LocalAuthentication().getAvailableBiometrics();
    if (availableBiometrics.contains(BiometricType.face)) {
      return BiometricAuth.faceID;
    } else if (availableBiometrics.contains(BiometricType.fingerprint)) {
      return BiometricAuth.touchID;
    }
    return BiometricAuth.none;
  }

  static Future<bool> authenticateIsAvailable() async {
    final localAuth = LocalAuthentication();
    final isAvailable = await localAuth.canCheckBiometrics;
    final isDeviceSupported = await localAuth.isDeviceSupported();
    return isAvailable && isDeviceSupported;
  }

  static Future<void> showDefaultPopupCheckBiometricAuth({
    String message = '',
    required void Function(bool) callback,
    bool stickyAuth = false,
  }) async {
    final localAuth = LocalAuthentication();
    final bool result = await localAuth.authenticate(
      localizedReason: message,
    );
    callback.call(result);
  }

  static String getBiometricString(
    BiometricAuth? type,
  ) {
    switch (type) {
      case BiometricAuth.faceID:
        return 'Face ID';
      case BiometricAuth.touchID:
        return 'Touch ID';
      case BiometricAuth.pincode:
        return '';
      case BiometricAuth.none:
        return '';
      case null:
        return '';
    }
  }
}
