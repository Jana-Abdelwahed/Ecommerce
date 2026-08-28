import 'package:ecommerce/core/constant/app_colors.dart';
import 'package:ecommerce/feature/cart/presentation/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constant/app_text_style.dart';
import '../../../../core/widgets/cart_app_bar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CartAppBar(title: "Cart"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 27.h),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(right: 8.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                border: Border.all(color: AppColors.strokeColor,width: 1.sp)
              ),
              child: CartItem()
            ),
            Spacer(),
            Row(
              children: [
                Column(
                  children: [
                    Text("Total Price",style: AppTextStyle.poppins18Gray500,),
                    Text("EGP 3,500",style: AppTextStyle.poppins18PrimaryColor500,),
                  ],
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 12.h,horizontal: 32.w),
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                  child: Row(
                    children: [
                      Text(
                        "Check Out",
                        style: AppTextStyle.poppins20White500,
                      ),
                      SizedBox(width: 24.w,),
                      Icon(Icons.arrow_forward,color: Colors.white,),

                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 98.h,),
          ]
        )
      )
    );
  }
}
