import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/app_text_style.dart';

class QuantityCounter extends StatefulWidget {
  const QuantityCounter({super.key});

  @override
  State<QuantityCounter> createState() => _QuantityCounterState();
}

class _QuantityCounterState extends State<QuantityCounter> {
  int _counter = 1;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  void _decrement() {
    if (_counter > 1) {
      setState(() {
        _counter--;
      });
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
            child: Text(
              '$_counter',
              style: AppTextStyle.poppins18White500,
            ),
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