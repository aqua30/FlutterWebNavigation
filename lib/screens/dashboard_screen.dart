import 'package:flutter/material.dart';
import 'package:web_navigation/screens/side_drawer_widget.dart';

import 'header_widget.dart';

class DashboardScreen extends StatelessWidget {
  final Widget child;
  final int pageIndex;
  const DashboardScreen({super.key, required this.child, required this.pageIndex});

  @override
  Widget build(BuildContext context) {
    print('dashboard screen called');
    indexNotifier.value = pageIndex;
    return Material(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const HeaderWidget(),
            Expanded(
              child: Row(
                children: [
                  const SideDrawerWidget(),
                  Expanded(
                    child: child,
                  )
                ],
              ),
            ),
          ],
       ),
    );
  }
}