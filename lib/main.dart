import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:guide_liverpool/app.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/common/di/di.dart';
import 'package:guide_liverpool/services.dart';
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

Future<AppState> loadState(persistor) async {
  try {
    final initialState = await persistor.load();
    return initialState;
  } catch (e, s) {
    print('Load AppState failed ${e.toString()} ${s.toString()}');
    return AppState.initial();
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Makes it so that you cannot use the app in landscape mode
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  //choose a dev environment and load that file from .env folder
  // final envFile = env == 'prod' ? '.env' : '.env_qa';
  await dotenv.load(fileName: 'environment/.env');

// initialize stripe for payment
  new StripeService()..init();

  configureDependencies();

//gets the entire app state from the user device storage.
  final Persistor<AppState> persistor = Persistor<AppState>(
    storage: SecureStorage(FlutterSecureStorage()),
    serializer: JsonSerializer<AppState>((json) => AppState.fromJson(json)),
    debug: kDebugMode,
  );

//initial state is taken from the device storage
  AppState initialState = await loadState(persistor);

//TODO: Ask what is this for?
  final List<Middleware<AppState>> wms = [
    thunkMiddleware,
    persistor.createMiddleware(),
  ];

// If the app is built in Debug mode, you want to add a logger which prints
  if (kDebugMode) {
    wms.add(LoggingMiddleware.printer());
  }

// Initialize the Redux Store with the initial state from the user device (if it exists)
  final Store<AppState> store = Store<AppState>(
    appReducer,
    initialState: initialState,
    middleware: wms,
  );

//Sentry initialization for logging
  runZonedGuarded(() async {
    await SentryFlutter.init(
      (options) {
        options.debug = !kReleaseMode;
        options.dsn = dotenv.env['SENTRY_DSN'];
        options.environment = "prod";
      },
    );

    //Pass the store to the Main App which injects it into the entire tree.
    runApp(MyApp(store));
  }, (exception, stackTrace) async {
    if (kReleaseMode) {
      await Sentry.captureException(exception, stackTrace: stackTrace);
    } else {
      log.error('FlutterError exception: ${exception.toString()}');
      log.error('FlutterError stackTrace: ${stackTrace.toString()}');
    }
  });
}
