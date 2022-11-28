import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:guide_liverpool/app.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/common/di/di.dart';
import 'package:guide_liverpool/utils/log/log.dart';
import 'package:guide_liverpool/utils/storage.dart';
import 'package:guide_liverpool/utils/stripe.dart';
import 'package:redux/redux.dart';
import 'package:flutter/services.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:guide_liverpool/redux/reducers/app_reducer.dart';
import 'package:redux_persist/redux_persist.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:redux_logging/redux_logging.dart';

Future<AppState> loadState(Persistor<AppState> persistor) async {
  try {
    final initialState = await persistor.load();
    if (initialState == null) throw Exception('InitialState is null');
    return initialState;
  } catch (e, s) {
    print('Load AppState failed ${e.toString()} ${s.toString()}');
    return AppState.initial();
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  await dotenv.load(fileName: 'environment/.env');

  StripeService().init();

  await configureDependencies();

  final Persistor<AppState> persistor = Persistor<AppState>(
    storage: SecureStorage(FlutterSecureStorage()),
    serializer: JsonSerializer<AppState>((json) => AppState.fromJson(json)),
    debug: kDebugMode,
  );

  final AppState initialState = await loadState(persistor);

  final List<Middleware<AppState>> wms = [
    thunkMiddleware,
    persistor.createMiddleware(),
  ];

  if (kDebugMode) {
    wms.add(LoggingMiddleware<AppState>.printer());
  }

  final Store<AppState> store = Store<AppState>(
    appReducer,
    initialState: initialState,
    middleware: wms,
  );

  await runZonedGuarded(() async {
    await SentryFlutter.init(
      (options) {
        options
          ..debug = !kReleaseMode
          ..dsn = dotenv.env['SENTRY_DSN']
          ..environment = 'prod';
      },
    );

    //Pass the store to the Main App which injects it into the entire tree.
    runApp(MyApp(store));
    if (Platform.isIOS) {
      await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    } else {
      await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    }
  }, (e, s) async {
    if (kReleaseMode) {
      await Sentry.captureException(e, stackTrace: s);
    } else {
      log
        ..error('FlutterError exception: ${e.toString()}')
        ..error('FlutterError stackTrace: ${s.toString()}');
    }
  });
}
