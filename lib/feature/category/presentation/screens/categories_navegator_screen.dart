import 'package:flutter/material.dart';

import 'category_screen.dart';

class CategoriesTabNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  const CategoriesTabNavigator({super.key, required this.navigatorKey});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (context) {
            return const CategoriesScreen();
          },
        );
      },
    );
  }
}
