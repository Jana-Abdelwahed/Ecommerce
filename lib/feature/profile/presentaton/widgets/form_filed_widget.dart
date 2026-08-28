import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/app_text_style.dart';

class FormFiledWidget extends StatelessWidget {
  final String lable;
  final String data;
  const FormFiledWidget({super.key,required this.lable,required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16.h,
      children: [
        Text(lable,style: AppTextStyle.poppins18PrimaryColor500,),
        TextFormField(
            decoration: InputDecoration(
              hintText: data,
              hintStyle: AppTextStyle.poppins14PrimaryColor500,
              suffixIcon: Icon(Icons.mode_edit_outlined,color: AppColors.primaryColor,),
              contentPadding: EdgeInsets.all(15.sp),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: BorderSide(color: AppColors.strokeColor,width: 1.sp),
              ),
            )
        )
      ],
    );
  }
}
