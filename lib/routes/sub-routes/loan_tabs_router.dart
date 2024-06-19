import 'package:go_router/go_router.dart';
import 'package:web_navigation/screens/loan_sections.dart';
import 'package:web_navigation/routes/routes_base.dart';

abstract class LoanApplicationRoutes {

  static const loans = '/loans';
  static const loanTab1 = 'tab1';
  static const loanTab2 = 'tab2';
  static const loanTab3 = 'tab3';
}

class LoanTabRouter implements ScreenRouter {

  static final instance = LoanTabRouter._internal();
  LoanTabRouter._internal();

  factory LoanTabRouter() {
    return instance;
  }

  @override
  RouteBase route() {
    return ShellRoute(
      builder: (context, state, child) {
        final String routeName = GoRouterState.of(context).matchedLocation;
        final int pageIndex = switch(routeName) {
          '${LoanApplicationRoutes.loans}/${LoanApplicationRoutes.loanTab1}' => 0,
          '${LoanApplicationRoutes.loans}/${LoanApplicationRoutes.loanTab2}' => 1,
          '${LoanApplicationRoutes.loans}/${LoanApplicationRoutes.loanTab3}' => 2,
          _ => -1,
        };
        loanTabIndexNotifier.value = pageIndex;
        return LoanSections(child: child);
      }, routes: [
      GoRoute(
          path: LoanApplicationRoutes.loans,
          redirect: (context, state) {
            print('loan sub route = ${state.uri}');
            if(state.uri.toString() == LoanApplicationRoutes.loans) {
              return '${LoanApplicationRoutes.loans}/${LoanApplicationRoutes.loanTab1}';
            }
            return null;
          },
          routes: [
            GoRoute(
              path: LoanApplicationRoutes.loanTab1,
              builder: (context, state) => const LoanTab1(),
            ),
            GoRoute(
              path: LoanApplicationRoutes.loanTab2,
              builder: (context, state) => const LoanTab2(),
            ),
            GoRoute(
              path: LoanApplicationRoutes.loanTab3,
              builder: (context, state) => const LoanTab3(),
            ),
          ]
      ),
    ]
    );
  }
}