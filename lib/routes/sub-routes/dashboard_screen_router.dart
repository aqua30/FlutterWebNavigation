import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_navigation/routes/routes_base.dart';

import '../../screens/dashboard_screen.dart';
import 'loan_tabs_router.dart';

abstract class DashboardRoute {

  static const posts = '/posts';
  static const details = 'details';
  static const events = '/events';
  static const users = '/users';
  static const loans = '/loans';
}

class DashboardScreenRouter implements ScreenRouter {

  static final instance = DashboardScreenRouter._internal();
  DashboardScreenRouter._internal();

  factory DashboardScreenRouter() {
    return instance;
  }

  @override
  RouteBase route() {
    return ShellRoute(
        builder: (context, state, child) {
          final String routeName = GoRouterState.of(context).matchedLocation;
          final int pageIndex = switch(routeName) {
            DashboardRoute.posts => 1,
            '${DashboardRoute.posts}/${DashboardRoute.details}' => 1,
            DashboardRoute.events => 2,
            '${DashboardRoute.events}/${DashboardRoute.details}' => 2,
            LoanApplicationRoutes.loans => 3,
            '${LoanApplicationRoutes.loans}/${LoanApplicationRoutes.loanTab1}' => 3,
            '${LoanApplicationRoutes.loans}/${LoanApplicationRoutes.loanTab2}' => 3,
            '${LoanApplicationRoutes.loans}/${LoanApplicationRoutes.loanTab3}' => 3,
            DashboardRoute.users => 4,
            '${DashboardRoute.users}/${DashboardRoute.details}' => 4,
            _ => -1,
          };
          return DashboardScreen(pageIndex: pageIndex, child: child,);
        },
        routes: [
          GoRoute(
              path: DashboardRoute.posts,
              builder: (context, state) => Container(color: Colors.brown,),
              routes: [
                GoRoute(
                  path: DashboardRoute.details,
                  builder: (context, state) => const Text('Post details', style: TextStyle(fontSize: 24, color: Colors.black),),
                ),
              ]
          ),
          GoRoute(
              path: DashboardRoute.events,
              builder: (context, state) => Container(color: Colors.red,),
              routes: [
                GoRoute(
                  path: DashboardRoute.details,
                  builder: (context, state) => const Text('Events details', style: TextStyle(fontSize: 24, color: Colors.black),),
                ),
              ]
          ),
          GoRoute(
              path: DashboardRoute.loans,
              builder: (context, state) => Container(color: Colors.indigo,),
              routes: [
                GoRoute(
                  path: DashboardRoute.details,
                  builder: (context, state) => const Text('Loan details', style: TextStyle(fontSize: 24, color: Colors.black),),
                ),
              ]
          ),
          GoRoute(
              path: DashboardRoute.users,
              builder: (context, state) => Container(color: Colors.deepPurple,),
              routes: [
                GoRoute(
                  path: DashboardRoute.details,
                  builder: (context, state) => const Text('User details', style: TextStyle(fontSize: 24, color: Colors.black),),
                ),
              ]
          ),
        ]
    );
  }
}
