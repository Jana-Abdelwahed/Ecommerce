import 'package:ecommerce/core/constant/app_assets.dart';
import 'package:ecommerce/core/constant/app_colors.dart';
import 'package:ecommerce/core/constant/app_text_style.dart';
import 'package:ecommerce/feature/presention/screens/product_details/widgets/quantity_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItem extends StatelessWidget {
  final Map<String, dynamic> item;
  final ValueChanged<int> onQuantityChanged;
  final VoidCallback onDelete;

  const CartItem({
    super.key,
    required this.item,
    required this.onQuantityChanged,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final String title = item['title'] ?? 'Nike Air Jordan';
    final String image = item['image'] ?? AppAssets.footWearcart;
    final String price = item['price'] ?? 'EGP 3,500';
    final int quantity = (item['quantity'] as num?)?.toInt() ?? 1;
    final String size = item['size'] ?? '40';
    final int colorValue = (item['color'] as num?)?.toInt() ?? 0xFFBB3219;

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
              child: image.startsWith('http')
                  ? Image.network(
                      image,
                      width: 118.w,
                      height: 118.h,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Image.asset(
                        AppAssets.footWearcart,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Image.asset(
                      image.isNotEmpty ? image : AppAssets.footWearcart,
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
                    title,
                    style: AppTextStyle.poppins18PrimaryColor500,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 15.w,
                        height: 15.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(colorValue),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: Text(
                          "Size: $size",
                          style: AppTextStyle.poppins14DescriptionColor400,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    price.startsWith('EGP') ? price : "EGP $price",
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
                  onTap: onDelete,
                  child: Image.asset(
                    AppAssets.removeIcon,
                    width: 24.w,
                    height: 24.h,
                  ),
                ),
                QuantityCounter(
                  quantity: quantity,
                  onQuantityChanged: onQuantityChanged,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
