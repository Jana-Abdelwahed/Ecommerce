import 'package:ecommerce/feature/auth/presention/screens/shop/shop_screen.dart';
import 'package:flutter/material.dart';

import 'category_screen.dart';

class CategoriesTabNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  const CategoriesTabNavigator({super.key, required this.navigatorKey});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        Widget builder;
        switch (settings.name) {
          case '/shop':
            final categoryTitle = settings.arguments as String?;
            builder = ShopScreen(categoryTitle: categoryTitle);
            break;
          case '/':
          default:
            builder = const CategoriesScreen();
            break;
        }

        return MaterialPageRoute(
          builder: (context) => builder,
          settings: settings,
        );
      },
    );
  }
}
