import 'package:auto_route/auto_route.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:guide_liverpool/common/router/route_logger.dart';
import 'package:guide_liverpool/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:guide_liverpool/common/di/di.dart';
import 'package:guide_liverpool/common/router/route_guards.dart';
import 'package:guide_liverpool/constants/strings.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/redux/actions/home_page_actions.dart';
import 'package:guide_liverpool/services.dart';
import 'package:guide_liverpool/utils/log/log.dart';
import 'package:redux/redux.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';

class MyApp extends StatefulWidget {
  const MyApp(this.store, {Key? key}) : super(key: key);
  final Store<AppState> store;

  static void setLocale(BuildContext context, Locale newLocale) {
    final _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state!.setLocale(newLocale);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  //Authentication token used for calls with Fuse
  void setJwtToken(Store<AppState> store) {
    final String jwtToken = store.state.userState.jwtToken;
    if (![null, ''].contains(jwtToken)) {
      isAuthenticated = true;
      log.info('JWT: $jwtToken');
      chargeApi.setJwtToken(jwtToken);
    }
  }

  @override
  void initState() {
    super.initState();
    setJwtToken(widget.store);
    widget.store.dispatch(fetchHomePageData());
    _locale = widget.store.state.userState.locale;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getIt.allReady(),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.hasData) {
          return StoreProvider<AppState>(
            store: widget.store,
            child: MaterialApp.router(
              routerConfig: rootRouter.config(
                navigatorObservers: () => [
                  AutoRouteObserver(),
                  SentryNavigatorObserver(),
                  RouteLogger(),
                ],
              ),
              debugShowCheckedModeBanner: false,
              locale: _locale,
              title: Strings.appName,
              theme: flexColorSchemeLight.toTheme,
              builder: (_, router) => ResponsiveWrapper.builder(
                router,
                maxWidth: 1200,
                minWidth: 400,
                defaultScale: true,
                breakpoints: [
                  const ResponsiveBreakpoint.resize(480, name: MOBILE),
                  const ResponsiveBreakpoint.autoScale(800, name: TABLET),
                  const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
                  const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
                  const ResponsiveBreakpoint.autoScale(2460, name: '4K'),
                ],
              ),
              localizationsDelegates: const [
                CountryLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              localeListResolutionCallback: (locales, supportedLocales) {
                for (final Locale locale in locales!) {
                  if (supportedLocales.contains(locale)) {
                    return locale;
                  }
                }
                return const Locale('en', 'US');
              },
              localeResolutionCallback: (locale, supportedLocales) {
                for (final supportedLocale in supportedLocales) {
                  if (supportedLocale.languageCode == locale?.languageCode &&
                      supportedLocale.countryCode == locale?.countryCode) {
                    return supportedLocale;
                  }
                }
                return supportedLocales.first;
              },
            ),
          );
        } else {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      flexColorSchemeLight.primary!,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Center(
                  child: Image.asset(
                    'assets/images/guide-logo.png',
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
