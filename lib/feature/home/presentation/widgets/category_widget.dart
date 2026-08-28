import 'package:ecommerce/core/constant/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryWidget extends StatelessWidget {
  final String imagePath;
  final String title;

  const CategoryWidget({
    super.key,
    required this.imagePath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      child: Column(
        spacing: 8.h,
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipOval(
            child: Image.asset(
              imagePath,
              width: 85.r,
              height: 85.r,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            title,
            style: AppTextStyle.poppins12PrimaryColor400,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
