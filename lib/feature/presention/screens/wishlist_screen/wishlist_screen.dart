import 'package:ecommerce/core/constant/app_colors.dart';
import 'package:ecommerce/core/constant/app_text_style.dart';
import 'package:ecommerce/core/widgets/app_bar.dart';
import 'package:ecommerce/feature/presention/screens/cart/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'cubit/wishlist_cubit.dart';
import 'cubit/wishlist_state.dart';
import 'wishlist_item.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(),
      body: BlocBuilder<WishlistCubit, WishlistState>(
        builder: (context, state) {
          final cubit = context.read<WishlistCubit>();
          final wishlistItems = cubit.items;

          if (wishlistItems.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_outline,
                    size: 80.r,
                    color: AppColors.strokeColor,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    "Your Wishlist is Empty",
                    style: AppTextStyle.poppins18PrimaryColor500,
                  ),
                  SizedBox(height: 8.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    child: Text(
                      "Explore products and save your favorites here!",
                      style: AppTextStyle.poppins14DescriptionColor400,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            );
          }

          return ListView.separated(
            padding: EdgeInsets.all(16.r),
            itemCount: wishlistItems.length,
            separatorBuilder: (context, index) => SizedBox(height: 16.h),
            itemBuilder: (context, index) {
              final item = wishlistItems[index];
              return WishlistItem(
                title: item["title"] ?? "Product",
                imagePath: item["image"] ?? "",
                colorName: item["colorName"] ?? "Black color",
                colorCode: item["colorCode"] is Color
                    ? item["colorCode"]
                    : const Color(0xFF2B2B2B),
                price: item["price"] ?? "0",
                oldPrice: item["oldPrice"],
                onRemove: () => cubit.removeFromWishlist(index),
                onAddToCart: () {
                  context.read<CartCubit>().addToCart(item);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Added to cart")),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
