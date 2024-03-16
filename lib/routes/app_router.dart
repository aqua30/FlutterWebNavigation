import 'package:go_router/go_router.dart';
import 'package:web_navigation/routes/sub-routes/dashboard_screen_router.dart';
import 'package:web_navigation/routes/sub-routes/home_screen_router.dart';

abstract class AppRouter {

  static final GoRouter dashboardRouter = GoRouter(
      initialLocation: DashboardRoute.posts,
      routes: [
        HomeScreenRouter.instance.route(),
        DashboardScreenRouter.instance.route(),
      ]
  );
}