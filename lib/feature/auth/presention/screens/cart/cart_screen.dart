import 'package:ecommerce/core/constant/app_colors.dart';
import 'package:ecommerce/core/constant/app_text_style.dart';
import 'package:ecommerce/core/widgets/cart_app_bar.dart';
import 'package:ecommerce/feature/auth/presention/screens/cart/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'cubit/cart_cubit.dart';
import 'cubit/cart_state.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CartAppBar(title: "Cart"),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          final cartCubit = context.read<CartCubit>();
          final items = cartCubit.items;

          if (items.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 80.r,
                    color: AppColors.strokeColor,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    "Your Cart is Empty",
                    style: AppTextStyle.poppins18PrimaryColor500,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "Looks like you haven't added anything to your cart yet.",
                    style: AppTextStyle.poppins14DescriptionColor400,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }

          double totalPrice = 0.0;
          for (var item in items) {
            final rawPrice = (item['price'] as String? ?? '0')
                .replaceAll(',', '')
                .replaceAll('EGP', '')
                .trim();
            final price = double.tryParse(rawPrice) ?? 0.0;
            final quantity = (item['quantity'] as num?)?.toInt() ?? 1;
            totalPrice += price * quantity;
          }

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemCount: items.length,
                    separatorBuilder: (_, __) => SizedBox(height: 16.h),
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return Container(
                        padding: EdgeInsets.only(right: 8.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          border: Border.all(
                            color: AppColors.strokeColor,
                            width: 1.sp,
                          ),
                        ),
                        child: CartItem(
                          item: item,
                          onQuantityChanged: (newQty) {
                            cartCubit.updateQuantityAtIndex(index, newQty);
                          },
                          onDelete: () {
                            cartCubit.removeFromCartAtIndex(index);
                          },
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total Price",
                          style: AppTextStyle.poppins18Gray500,
                        ),
                        Text(
                          "EGP ${totalPrice.toStringAsFixed(0)}",
                          style: AppTextStyle.poppins18PrimaryColor500,
                        ),
                      ],
                    ),
                    const Spacer(),
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
                          Text(
                            "Check Out",
                            style: AppTextStyle.poppins20White500,
                          ),
                          SizedBox(width: 24.w),
                          const Icon(Icons.arrow_forward, color: Colors.white),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
              ],
            ),
          );
        },
      ),
    );
  }
}
