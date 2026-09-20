import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/app_assets.dart';
import '../constant/app_colors.dart';
import '../constant/app_routes.dart';
import 'product_search_delegate.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});
  @override
  Size get preferredSize => Size.fromHeight(120.h);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      leading: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 18.h,
        children: [
          Row(
            children: [
              if (Navigator.canPop(context))
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back),
                  color: AppColors.primaryColor,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              Image.asset(AppAssets.blueLogo),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    showSearch(
                      context: context,
                      delegate: ProductSearchDelegate(),
                    );
                  },
                  child: AbsorbPointer(
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        hintText: "what do you search for?",
                        prefixIcon: Icon(
                          Icons.search,
                          color: AppColors.primaryColor,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.r),
                          borderSide: BorderSide(
                            color: AppColors.primaryColor,
                            width: 1.sp,
                          ),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.r),
                          borderSide: BorderSide(
                            color: AppColors.primaryColor,
                            width: 1.sp,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.r),
                          borderSide: BorderSide(
                            color: AppColors.primaryColor,
                            width: 1.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(
                    context,
                    rootNavigator: true,
                  ).pushNamed(AppRoutes.cartScreen);
                },
                style: IconButton.styleFrom(minimumSize: Size(24.w, 24.h)),
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
      leadingWidth: double.infinity,
      toolbarHeight: 120.h,
      backgroundColor: Colors.transparent,
    );
  }
}
