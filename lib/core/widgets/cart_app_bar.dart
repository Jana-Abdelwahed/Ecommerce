import 'package:ecommerce/core/constant/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/app_colors.dart';
import '../constant/app_routes.dart';
import 'product_search_delegate.dart';

class CartAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CartAppBar({super.key, required this.title});
  @override
  Size get preferredSize => Size.fromHeight(70.h);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back, color: AppColors.primaryColor),
      ),
      title: Text(title, style: AppTextStyle.poppins20PrimaryColor600),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {
            showSearch(context: context, delegate: ProductSearchDelegate());
          },
          icon: Icon(Icons.search, color: AppColors.primaryColor),
        ),
        IconButton(
          onPressed: () {
            Navigator.of(
              context,
              rootNavigator: true,
            ).pushNamed(AppRoutes.cartScreen);
          },
          icon: Icon(
            Icons.shopping_cart_outlined,
            color: AppColors.primaryColor,
          ),
        ),
      ],
      toolbarHeight: 70.h,
      backgroundColor: Colors.transparent,
    );
  }
}
