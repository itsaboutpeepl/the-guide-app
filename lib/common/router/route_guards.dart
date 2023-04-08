import 'package:auto_route/auto_route.dart';
import 'package:guide_liverpool/common/router/routes.dart';

bool isAuthenticated = false;

class LoginAuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (isAuthenticated) {
      resolver.next(true);
    } else {
      router.push(
        SplashRoute(onLoginResult: (bool isLoggedIn) {
          isAuthenticated = isLoggedIn;
          resolver.next(isLoggedIn);
        }),
      );
    }
  }
}
