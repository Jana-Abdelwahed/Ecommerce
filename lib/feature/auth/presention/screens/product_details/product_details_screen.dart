import 'package:ecommerce/core/constant/app_colors.dart';
import 'package:ecommerce/core/constant/app_routes.dart';
import 'package:ecommerce/core/constant/app_text_style.dart';
import 'package:ecommerce/core/widgets/cart_app_bar.dart';
import 'package:ecommerce/feature/auth/presention/screens/cart/cubit/cart_cubit.dart';
import 'package:ecommerce/feature/auth/presention/screens/product_details/widgets/color_selector.dart';
import 'package:ecommerce/feature/auth/presention/screens/product_details/widgets/expandable_text.dart';
import 'package:ecommerce/feature/auth/presention/screens/product_details/widgets/product_images.dart';
import 'package:ecommerce/feature/auth/presention/screens/product_details/widgets/product_size.dart';
import 'package:ecommerce/feature/auth/presention/screens/product_details/widgets/quantity_counter.dart';
import 'package:ecommerce/feature/auth/presention/screens/wishlist_screen/cubit/wishlist_cubit.dart';
import 'package:ecommerce/feature/auth/presention/screens/wishlist_screen/cubit/wishlist_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Map<String, dynamic>? product;

  const ProductDetailsScreen({super.key, this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int quantity = 1;
  String selectedSize = "40";
  Color selectedColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    final String id = widget.product?['id']?.toString() ?? "1";
    final String title = widget.product?['title'] ?? "Nike Air Jordan";
    final String image = widget.product?['image'] ?? "";
    final String rawPrice = widget.product?['price']?.toString() ?? "3,500";
    final String description =
        widget.product?['description'] ??
        "Nike is a multinational corporation that designs, develops, and sells athletic footwear, apparel, and accessories.";
    final String soldCount =
        widget.product?['soldCount']?.toString() ?? "3,230";
    final double rating =
        (widget.product?['rating'] as num?)?.toDouble() ?? 4.8;

    final List<String> images =
        (widget.product?['images'] as List<dynamic>?)
            ?.map((e) => e.toString())
            .toList() ??
        (image.isNotEmpty ? [image] : []);

    final double unitPrice =
        double.tryParse(
          rawPrice.replaceAll(',', '').replaceAll('EGP', '').trim(),
        ) ??
        3500.0;
    final double totalPrice = unitPrice * quantity;

    return Scaffold(
      appBar: const CartAppBar(title: "Product Details"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: BlocBuilder<WishlistCubit, WishlistState>(
            builder: (context, state) {
              final wishlistCubit = context.read<WishlistCubit>();
              final isFav = wishlistCubit.isFavorite(id);

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductImageSlider(
                    images: images,
                    isFavorite: isFav,
                    onFavoriteTap: () {
                      wishlistCubit.toggleFavorite(widget.product ?? {});
                    },
                  ),
                  SizedBox(height: 16.h),

                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: AppTextStyle.poppins18PrimaryColor500,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        "EGP $rawPrice",
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
                          "$soldCount Sold",
                          style: AppTextStyle.poppins14PrimaryColor500,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Icon(Icons.star, color: AppColors.startColor, size: 24.r),
                      SizedBox(width: 4.w),
                      Text(
                        "($rating)",
                        style: AppTextStyle.poppins14PrimaryColor500,
                      ),
                      const Spacer(),
                      QuantityCounter(
                        quantity: quantity,
                        onQuantityChanged: (newQty) {
                          setState(() {
                            quantity = newQty;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),

                  Text(
                    "Description",
                    style: AppTextStyle.poppins18PrimaryColor500,
                  ),
                  SizedBox(height: 4.h),
                  ExpandableText(text: description),
                  SizedBox(height: 16.h),

                  Text("Size", style: AppTextStyle.poppins18PrimaryColor500),
                  SizedBox(height: 8.h),
                  ProductSizeSelector(
                    onSizeSelected: (size) {
                      setState(() {
                        selectedSize = size;
                      });
                    },
                  ),
                  SizedBox(height: 16.h),

                  Text("Color", style: AppTextStyle.poppins18PrimaryColor500),
                  SizedBox(height: 8.h),
                  ProductColorSelector(
                    onColorSelected: (color) {
                      setState(() {
                        selectedColor = color;
                      });
                    },
                  ),
                  SizedBox(height: 40.h),

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
                        onPressed: () {
                          final cartItem = {
                            "id": id,
                            "title": title,
                            "image": image,
                            "price": rawPrice,
                            "quantity": quantity,
                            "size": selectedSize,
                            "color": selectedColor.toARGB32(),
                          };

                          context.read<CartCubit>().addToCart(cartItem);
                          Navigator.pushNamed(context, AppRoutes.cartScreen);
                        },
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
                            const Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.white,
                            ),
                            SizedBox(width: 12.w),
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
              );
            },
          ),
        ),
      ),
    );
  }
}
