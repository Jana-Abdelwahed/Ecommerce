import 'package:ecommerce/core/constant/app_colors.dart';
import 'package:ecommerce/core/constant/app_text_style.dart';
import 'package:ecommerce/core/widgets/favouries_button.dart';
import 'package:ecommerce/feature/auth/presention/screens/product_details/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final String price;
  final String? oldPrice;
  final double rating;
  final bool isFavorite;
  final VoidCallback? onAddToCart;
  final VoidCallback? onFavoriteTap;
  final VoidCallback? onTap;

  const ProductCard({
    super.key,
    required this.title,
    this.description = "Nike shoes flexible for wo..",
    required this.imagePath,
    required this.price,
    this.oldPrice,
    required this.rating,
    this.isFavorite = false,
    this.onAddToCart,
    this.onFavoriteTap,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:
          onTap ??
          () {
            Navigator.of(context, rootNavigator: true).push(
              MaterialPageRoute(
                builder: (_) => ProductDetailsScreen(
                  product: {
                    'title': title,
                    'image': imagePath,
                    'price': price,
                    'description': description,
                    'rating': rating,
                  },
                ),
              ),
            );
          },
      child: Container(
        width: 190.w,
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
                  child: FavouriesButton(
                    isFavorite: isFavorite,
                    onTap: onFavoriteTap,
                  ),
                ),
              ],
            ),

            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
