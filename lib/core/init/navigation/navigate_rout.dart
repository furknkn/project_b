import 'package:project_b/feature/home_page/view/pages/home_page.dart';
import 'package:project_b/feature/home_page/view/pages/search_page.dart';
import 'package:project_b/feature/login/_feature_exports.dart';

import '../../_core_exports.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.SING_IN:
        return normalNavigate(const LoginPage());
      case NavigationConstants.SING_UP:
        return normalNavigate(const LoginPage());
      case NavigationConstants.HOME_PAGE:
        return normalNavigate(const HomePagePage());
      case NavigationConstants.SEARCH_PAGE:
        return normalNavigate(const SearchPage());
      default:
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}
