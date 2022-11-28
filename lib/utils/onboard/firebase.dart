import 'package:firebase_auth/firebase_auth.dart';
import 'package:guide_liverpool/common/router/routes.dart';
import 'package:guide_liverpool/constants/enums.dart';
import 'package:guide_liverpool/constants/strings.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/redux/actions/user_actions.dart';
import 'package:guide_liverpool/services.dart';
import 'package:guide_liverpool/utils/log/log.dart';
import 'package:guide_liverpool/utils/onboard/Istrategy.dart';
import 'package:redux/redux.dart';

class FirebaseStrategy implements IOnBoardStrategy {
  FirebaseStrategy({this.strategy = OnboardStrategy.firebase});

  @override
  OnboardStrategy strategy;

  @override
  Future<void> login(
    Store<AppState> store,
    String? phoneNumber,
    void Function() onSuccess,
    void Function(dynamic error) onError,
  ) async {
    Future<void> verificationCompleted(
      PhoneAuthCredential credentials,
    ) async {
      store.dispatch(SetCredentials(credentials));
      final UserCredential userCredential =
          await firebaseAuth.signInWithCredential(
        credentials,
      );
      final User? user = userCredential.user;
      final User currentUser = firebaseAuth.currentUser!;
      assert(user?.uid == currentUser.uid, 'User IDs not same.');
      final String accountAddress = store.state.userState.accountAddress;
      final String identifier = store.state.userState.identifier;
      final String token = await user!.getIdToken();
      try {
        final String jwtToken = await chargeApi.loginWithFirebase(
          token,
          accountAddress,
          identifier,
          appName: Strings.appName,
        );
        onSuccess();
        store.dispatch(LoginVerifySuccess(jwtToken));
        await rootRouter.push(UserNameScreen());
      } catch (e) {
        onError(e.toString());
      }
    }

    Future<void> verificationFailed(FirebaseAuthException authException) async {
      log
        ..info('Phone number verification failed.')
        ..info('Code: ${authException.code}.')
        ..info('Message: ${authException.message}');
      onError(authException.message);
    }

    void codeSent(
      String verificationId, [
      int? forceResendingToken,
    ]) {
      log.info('PhoneCodeSent verificationId: $verificationId');
      onSuccess();
      store
        ..dispatch(SetCredentials(null))
        ..dispatch(SetVerificationId(verificationId));
      rootRouter.push(VerifyPhoneNumber(verificationId: verificationId));
      onSuccess();
    }

    await firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      codeAutoRetrievalTimeout: (String verificationId) {},
      codeSent: codeSent,
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
    );
  }

  @override
  Future<void> verify(
    Store<AppState> store,
    String verificationCode,
    void Function(String jwtToken) onSuccess,
  ) async {
    PhoneAuthCredential? credential = store.state.userState.credentials;
    final String verificationId = store.state.userState.verificationId ?? '';
    credential ??= PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: verificationCode,
    );
    try {
      final UserCredential userCredential =
          await firebaseAuth.signInWithCredential(
        credential,
      );
      final User? currentUser = firebaseAuth.currentUser;
      assert(
        userCredential.user?.uid == currentUser?.uid,
        'User does not match',
      );
      final String accountAddress = store.state.userState.accountAddress;
      final String identifier = store.state.userState.identifier;
      final String token = await userCredential.user!.getIdToken();
      final String jwtToken = await chargeApi.loginWithFirebase(
        token,
        accountAddress,
        identifier,
        appName: Strings.appName,
      );
      onSuccess(jwtToken);
    } on FirebaseAuthException catch (e) {
      print('ERROR ${e.code} MESSAGE ${e.message}');
    } catch (e) {
      print(e);
    }
  }
}
