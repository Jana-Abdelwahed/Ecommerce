import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/app_assets.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/app_text_style.dart';
import '../../../product_details/presentation/widgets/quantity_counter.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 118.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 118.w,
            height: 118.h,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.strokeColor, width: 1.sp),
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14.r),
              child: Image.asset(
                AppAssets.footWearcart,
                width: 118.w,
                height: 118.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 8.w),

          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 4.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Nike Air Jordan",
                    style: AppTextStyle.poppins18PrimaryColor500,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 15.w,
                        height: 15.h,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFBB3219),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: Text(
                          "Orange | Size: 40",
                          style: AppTextStyle.poppins14DescriptionColor400,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "EGP 3,500",
                    style: AppTextStyle.poppins18PrimaryColor500,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 8.w),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 4.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    AppAssets.removeIcon,
                    width: 24.w,
                    height: 24.h,
                  ),
                ),
                const QuantityCounter(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
