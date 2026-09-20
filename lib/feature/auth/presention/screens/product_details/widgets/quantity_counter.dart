import 'package:ecommerce/core/constant/app_colors.dart';
import 'package:ecommerce/core/constant/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuantityCounter extends StatelessWidget {
  final int quantity;
  final ValueChanged<int> onQuantityChanged;

  const QuantityCounter({
    super.key,
    required this.quantity,
    required this.onQuantityChanged,
  });

  void _increment() {
    onQuantityChanged(quantity + 1);
  }

  void _decrement() {
    if (quantity > 1) {
      onQuantityChanged(quantity - 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: _decrement,
            behavior: HitTestBehavior.opaque,
            child: Icon(
              Icons.remove_circle_outline_rounded,
              color: Colors.white,
              size: 24.r,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text('$quantity', style: AppTextStyle.poppins18White500),
          ),
          GestureDetector(
            onTap: _increment,
            behavior: HitTestBehavior.opaque,
            child: Icon(
              Icons.add_circle_outline_rounded,
              color: Colors.white,
              size: 24.r,
            ),
          ),
        ],
      ),
    );
  }
}
