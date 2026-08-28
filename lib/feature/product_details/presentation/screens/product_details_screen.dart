import 'package:ecommerce/core/widgets/cart_app_bar.dart';
import 'package:ecommerce/feature/product_details/presentation/widgets/product_images.dart';
import 'package:ecommerce/feature/product_details/presentation/widgets/quantity_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/app_text_style.dart';
import '../widgets/color_selector.dart';
import '../widgets/expandable_text.dart';
import '../widgets/product_size.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CartAppBar(title: "Product Details"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            spacing: 8.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductImageSlider(),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Text(
                    "Nike Air Jordon",
                    style: AppTextStyle.poppins18PrimaryColor500,
                  ),
                  Spacer(),
                  Text(
                    "EGP 3,500",
                    style: AppTextStyle.poppins18PrimaryColor500,
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 8.h,
                      horizontal: 16.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border.all(
                        color: AppColors.primaryColor,
                        width: 1.sp,
                      ),
                    ),
                    child: Text(
                      "3,230 Sold",
                      style: AppTextStyle.poppins14PrimaryColor500,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Icon(Icons.star, color: AppColors.startColor, size: 24.r),
                  Text(
                    "Review (4.8)",
                    style: AppTextStyle.poppins14PrimaryColor500,
                  ),
                  Spacer(),
                  QuantityCounter(),
                ],
              ),
              Text("Description", style: AppTextStyle.poppins18PrimaryColor500),
              ExpandableText(
                text:
                    "Nike is a multinational corporation that designs, develops, and sells athletic footwear ,apparel, and accessories",
              ),
              SizedBox(height: 8.h),
              Text("Size", style: AppTextStyle.poppins18PrimaryColor500),
              ProductSizeSelector(),
              SizedBox(height: 8.h),
              Text("Color", style: AppTextStyle.poppins18PrimaryColor500),
              ProductColorSelector(),
              SizedBox(height: 40.h),
              Row(
                children: [
                  Column(
                    children: [
                      Text("Total Price", style: AppTextStyle.poppins18Gray500),
                      Text(
                        "EGP 3,500",
                        style: AppTextStyle.poppins18PrimaryColor500,
                      ),
                    ],
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: 12.h,
                        horizontal: 32.w,
                      ),
                      backgroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.shopping_cart_outlined, color: Colors.white),
                        SizedBox(width: 24.w),
                        Text(
                          "Add to Cart",
                          style: AppTextStyle.poppins20White500,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }
}
