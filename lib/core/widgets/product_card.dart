import 'package:ecommerce/core/constant/app_colors.dart';
import 'package:ecommerce/core/constant/app_text_style.dart';
import 'package:ecommerce/core/widgets/favouries_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../feature/product_details/presentation/screens/product_details_screen.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final String price;
  final String? oldPrice;
  final double rating;
  final VoidCallback? onAddToCart;
  final VoidCallback? onFavoriteTap;

  const ProductCard({
    super.key,
    required this.title,
    this.description = "Nike shoes flexible for wo..", // Restored default value
    required this.imagePath,
    required this.price,
    this.oldPrice,
    required this.rating,
    this.onAddToCart,
    this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(
          context,
          rootNavigator: true,
        ).push(MaterialPageRoute(builder: (_) => const ProductDetailsScreen()));
      },
      child: Container(
        width: 190.w, // Keeps proper sizing in horizontal lists (HomeScreen)
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(
            color: AppColors.primaryColor.withOpacity(0.3),
            width: 1.sp,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image with Favorite Button Overlay
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(14.r),
                    topRight: Radius.circular(14.r),
                  ),
                  child: Image.asset(
                    imagePath,
                    width: double.infinity,
                    height: 120.h,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 120.h,
                      color: Colors.grey[200],
                      child: const Icon(
                        Icons.image_not_supported,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 8.h,
                  right: 8.w,
                  child: GestureDetector(
                    onTap: onFavoriteTap,
                    child: const FavouriesButton(),
                  ),
                ),
              ],
            ),

            // Details Section
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Title & Description
                    // Title & Description Section inside ProductCard
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: AppTextStyle.poppins14PrimaryColor500.copyWith(
                            fontSize: 13.sp,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        // Only display description if it is not empty
                        if (description.isNotEmpty) ...[
                          SizedBox(height: 2.h),
                          Text(
                            description,
                            style: AppTextStyle.poppins14DescriptionColor400
                                .copyWith(fontSize: 11.sp),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ],
                    ),

                    // Price & Old Price
                    Row(
                      children: [
                        Text(
                          "EGP $price",
                          style: AppTextStyle.poppins14PrimaryColor500.copyWith(
                            fontSize: 12.sp,
                          ),
                        ),
                        if (oldPrice != null) ...[
                          SizedBox(width: 4.w),
                          Text(
                            "$oldPrice EGP",
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: AppColors.primaryColor.withOpacity(0.6),
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ],
                    ),

                    // Rating & Add to Cart Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Review ($rating)",
                              style: AppTextStyle.poppins12PrimaryColor400
                                  .copyWith(fontSize: 11.sp),
                            ),
                            SizedBox(width: 4.w),
                            Icon(
                              Icons.star,
                              color: const Color(0xFFFDD835),
                              size: 15.sp,
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: onAddToCart,
                          child: Container(
                            padding: EdgeInsets.all(4.r),
                            decoration: const BoxDecoration(
                              color: AppColors.primaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 18.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
