import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_navigation/routes/sub-routes/dashboard_screen_router.dart';
import 'package:web_navigation/routes/sub-routes/loan_tabs_router.dart';

ValueNotifier<int> indexNotifier = ValueNotifier(1);

class SideDrawerWidget extends StatefulWidget {
  const SideDrawerWidget({super.key});

  @override
  State<StatefulWidget> createState() => _SideDrawerWidget();
}

class _SideDrawerWidget extends State<SideDrawerWidget> {

  int currentIndex = 1;

  @override
  void initState() {
    super.initState();
    currentIndex = indexNotifier.value;
    indexNotifier.addListener(() {
      print('side drawer : ${indexNotifier.value}');
      currentIndex = indexNotifier.value > -1 ? indexNotifier.value : currentIndex;
      setState(() {});
    });
  }

  @override
  void dispose() {
    indexNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      width: 200,
      child: Column(
        children: [
          drawerItem(context, 1, 'Posts'),
          drawerItem(context, 2, 'Events'),
          drawerItem(context, 3, 'Loans'),
          drawerItem(context, 4, 'Users'),
        ],
      ),
    );
  }

  _itemClick(BuildContext context, int index) {
    switch(index) {
      case 1:
        GoRouter.of(context).go(DashboardRoute.posts);
        break;
      case 2:
        GoRouter.of(context).go(DashboardRoute.events);
        break;
      case 3:
        GoRouter.of(context).go(LoanApplicationRoutes.loans);
        break;
      case 4:
        GoRouter.of(context).go(DashboardRoute.users);
        break;
    }
    setState(() {
      currentIndex = index;
    });
  }

  Widget drawerItem(BuildContext context, int index, String title) {
    return InkWell(
      onTap: () {
        _itemClick(context, index);
      },
      child: Container(
        width: double.infinity,
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        color: currentIndex == index ? Colors.blueGrey : null,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: const TextStyle(
                fontSize: 16,
                color: Colors.black
            ),
          ),
        ),
      ),
    );
  }
}