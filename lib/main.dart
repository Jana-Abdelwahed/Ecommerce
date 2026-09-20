import 'package:ecommerce/core/constant/app_routes.dart';
import 'package:ecommerce/feature/auth/presention/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/di/service_locator.dart';
import 'feature/auth/domin/use_cases/login_use_case.dart';
import 'feature/auth/domin/use_cases/signup_use_case.dart';
import 'feature/auth/presention/cubit/auth_cubit.dart';
import 'feature/auth/presention/screens/cart/cart_screen.dart';
import 'feature/auth/presention/screens/cart/cubit/cart_cubit.dart';
import 'feature/auth/presention/screens/category/category_screen.dart';
import 'feature/auth/presention/screens/create_account_screen.dart';
import 'feature/auth/presention/screens/layout/layout_screen.dart';
import 'feature/auth/presention/screens/product_details/product_details_screen.dart';
import 'feature/auth/presention/screens/shop/shop_screen.dart';
import 'feature/auth/presention/screens/wishlist_screen/cubit/wishlist_cubit.dart';

void main() {
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  AuthCubit(getIt<LoginUseCase>(), getIt<SignupUseCase>()),
            ),
            BlocProvider(create: (context) => WishlistCubit()),
            BlocProvider(create: (context) => CartCubit()),
          ],
          child: MaterialApp(
            initialRoute: AppRoutes.loginScreen,
            routes: {
              AppRoutes.loginScreen: (context) => LoginScreen(),
              AppRoutes.createAccountScreen: (context) =>
                  const CreateAccountScreen(),
              AppRoutes.layoutScreen: (context) => const LayoutScreen(),
              AppRoutes.categoryScreen: (context) => const CategoriesScreen(),
              AppRoutes.shopScreen: (context) => const ShopScreen(),
              AppRoutes.productDetailsScreen: (context) =>
                  const ProductDetailsScreen(),
              AppRoutes.cartScreen: (context) => const CartScreen(),
            },
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    );
  }
}
