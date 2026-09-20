import 'package:ecommerce/core/constant/app_colors.dart';
import 'package:ecommerce/core/constant/app_text_style.dart';
import 'package:ecommerce/core/widgets/favouries_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishlistItem extends StatelessWidget {
  final String title;
  final String imagePath;
  final String colorName;
  final Color colorCode;
  final String price;
  final String? oldPrice;
  final VoidCallback? onRemove;
  final VoidCallback? onAddToCart;

  const WishlistItem({
    super.key,
    required this.title,
    required this.imagePath,
    required this.colorName,
    required this.colorCode,
    required this.price,
    this.oldPrice,
    this.onRemove,
    this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: AppColors.strokeColor, width: 1.sp),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(14.r),
              bottomLeft: Radius.circular(14.r),
            ),
            child: imagePath.startsWith('http')
                ? Image.network(
                    imagePath,
                    width: 114.w,
                    height: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Icon(Icons.image, size: 40.r),
                  )
                : Image.asset(
                    imagePath,
                    width: 114.w,
                    height: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Icon(Icons.image, size: 40.r),
                  ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 6.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: AppTextStyle.poppins18PrimaryColor500.copyWith(
                            fontSize: 18.sp,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      GestureDetector(
                        onTap: onRemove,
                        child: const FavouriesButton(isFavorite: true),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 12.w,
                        height: 12.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: colorCode,
                        ),
                      ),
                      SizedBox(width: 6.w),
                      Expanded(
                        child: Text(
                          colorName,
                          style: AppTextStyle.poppins14DescriptionColor400,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Text(
                              "EGP $price",
                              style: AppTextStyle.poppins18PrimaryColor500
                                  .copyWith(fontSize: 15.sp),
                            ),
                            if (oldPrice != null) ...[
                              SizedBox(width: 4.w),
                              Text(
                                "EGP $oldPrice",
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                      SizedBox(width: 4.w),
                      ElevatedButton(
                        onPressed: onAddToCart,
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            vertical: 6.h,
                            horizontal: 10.w,
                          ),
                          backgroundColor: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                        ),
                        child: Text(
                          "Add to Cart",
                          style: AppTextStyle.poppins14White500.copyWith(
                            fontSize: 12.sp,
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
    );
  }
}
