import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_navigation/routes/sub-routes/loan_tabs_router.dart';

ValueNotifier<int> loanTabIndexNotifier = ValueNotifier(1);

class LoanSections extends StatefulWidget {
  final Widget child;
  const LoanSections({super.key, required this.child});

  @override
  State<StatefulWidget> createState() => _LoanSections();
}

class _LoanSections extends State<LoanSections> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    print('loan section rebuild');
    _tabController = TabController(length: 3, vsync: this);
    loanTabIndexNotifier.addListener(() {
      _tabController.index = loanTabIndexNotifier.value;
    });
    _tabController.addListener(() {
      final tabIndex = _tabController.index;
      print('loan tab index = $tabIndex');
      switch(tabIndex) {
        case 0:
          GoRouter.of(context).go('${LoanApplicationRoutes.loans}/${LoanApplicationRoutes.loanTab1}');
          break;
        case 1:
          GoRouter.of(context).go('${LoanApplicationRoutes.loans}/${LoanApplicationRoutes.loanTab2}');
          break;
        case 2:
          GoRouter.of(context).go('${LoanApplicationRoutes.loans}/${LoanApplicationRoutes.loanTab3}');
          break;
      }
    });
  }

  @override
  void dispose() {
    loanTabIndexNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          SizedBox(
            height: 50,
            child: TabBar(
                isScrollable: true,
                controller: _tabController,
                indicatorColor: Colors.blueGrey,
                tabs: const [
                  Tab(
                    text: 'Tab 1',
                  ),
                  Tab(
                    text: 'Tab 2',
                  ),
                  Tab(
                    text: 'Tab 3',
                  )
                ]
            ),
          ),
          Expanded(child: widget.child),
        ],
      ),
    );
  }
}

class LoanTab1 extends StatelessWidget {
  const LoanTab1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.cyan,
        child: const Center(
            child: Text(
              'Tab 1',
              style: TextStyle(fontSize: 24, color: Colors.black),
            )));
  }
}

class LoanTab2 extends StatelessWidget {
  const LoanTab2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.cyan,
        child: const Center(
            child: Text(
              'Tab 2',
              style: TextStyle(fontSize: 24, color: Colors.black),
            )));
  }
}

class LoanTab3 extends StatelessWidget {
  const LoanTab3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.cyan,
        child: const Center(
            child: Text(
              'Tab 3',
              style: TextStyle(fontSize: 24, color: Colors.black),
            )));
  }
}