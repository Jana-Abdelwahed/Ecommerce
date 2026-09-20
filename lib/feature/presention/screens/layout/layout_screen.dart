import 'package:ecommerce/core/constant/app_size.dart';
import 'package:ecommerce/feature/presention/screens/category/categories_navegator_screen.dart';
import 'package:ecommerce/feature/presention/screens/home/home_screen.dart';
import 'package:ecommerce/feature/presention/screens/profile/profile_screen.dart';
import 'package:ecommerce/feature/presention/screens/wishlist_screen/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_nav_bar.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int _currentIndex = 0;
  final GlobalKey<NavigatorState> _categoriesNavigatorKey =
      GlobalKey<NavigatorState>();

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      const HomeScreen(),
      CategoriesTabNavigator(navigatorKey: _categoriesNavigatorKey),
      const WishlistScreen(),
      const ProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSize.horizontalPadding.w),
        child: IndexedStack(index: _currentIndex, children: _screens),
      ),

      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _currentIndex,
        onTabSelected: (index) {
          if (_currentIndex == 1 && index != 1) {
            _categoriesNavigatorKey.currentState?.popUntil(
              (route) => route.isFirst,
            );
          }

          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
