import 'dart:io';
import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseConfig {
  static FirebaseOptions get platformOptions {
    if (Platform.isIOS || Platform.isMacOS) {
      // iOS and MacOS
      return const FirebaseOptions(
        apiKey: 'AIzaSyCnC7_1Ot4mxPieD1AaeCWm-4K3X_GIx5s',
        appId: '1:1044608870893:ios:c472d230ab798a35021fe4',
        messagingSenderId: '1044608870893',
        projectId: 'theguideliverpool-51e81',
        iosBundleId: 'com.theguideliverpool.theguideapp',
      );
    } else {
      // Android
      return const FirebaseOptions(
        apiKey: 'AIzaSyCnC7_1Ot4mxPieD1AaeCWm-4K3X_GIx5s',
        appId: '1:1044608870893:android:90102b42e9de1178021fe4',
        projectId: 'theguideliverpool-51e81',
        messagingSenderId: '1044608870893',
      );
    }
  }
}
