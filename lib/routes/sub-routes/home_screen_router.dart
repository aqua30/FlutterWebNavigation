import 'package:go_router/go_router.dart';
import 'package:web_navigation/routes/routes_base.dart';

import '../../screens/home_screen.dart';

abstract class HomeRoutes {

  static const home = '/home';
}

class HomeScreenRouter implements ScreenRouter {

  static final instance = HomeScreenRouter._internal();
  HomeScreenRouter._internal();

  factory HomeScreenRouter() {
    return instance;
  }

  @override
  RouteBase route() {
    return GoRoute(
      path: HomeRoutes.home,
      builder: (context, state) => const HomeScreen(),
    );
  }
}
