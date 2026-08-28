import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/app_text_style.dart';

class ProductSizeSelector extends StatefulWidget {
  const ProductSizeSelector({super.key});

  @override
  State<ProductSizeSelector> createState() => _ProductSizeSelectorState();
}

class _ProductSizeSelectorState extends State<ProductSizeSelector> {
  final List<int> _sizes = [38, 39, 40, 41, 42];
  int _selectedSize = 40;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _sizes.map((size) {
        bool isSelected = _selectedSize == size;
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedSize = size;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: EdgeInsets.only(right: 16.w),
            width: 38.w,
            height: 38.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? AppColors.primaryColor : Colors.transparent,
            ),
            alignment: Alignment.center,
            child: Text(
              "$size",
              style: isSelected?AppTextStyle.poppins14White400:AppTextStyle.poppins14PrimaryColor400,
            ),
          ),
        );
      }).toList(),
    );
  }
}