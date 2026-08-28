import 'package:ecommerce/feature/home/presentation/screens/home_screen.dart';
import 'package:ecommerce/feature/wishlist_screen/presentation/screens/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constant/app_size.dart';
import '../../../category/presentation/screens/categories_navegator_screen.dart';
import '../../../profile/presentaton/screens/profile_screen.dart';
import '../widgets/custom_nav_bar.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int _currentIndex = 0;
  final GlobalKey<NavigatorState> _categoriesNavigatorKey = GlobalKey<NavigatorState>();

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
        child: IndexedStack(
          index: _currentIndex,
          children: _screens,
        ),
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
          }
      ),
    );
  }
}