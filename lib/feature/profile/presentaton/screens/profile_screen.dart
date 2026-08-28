import 'package:ecommerce/core/constant/app_assets.dart';
import 'package:ecommerce/core/constant/app_text_style.dart';
import 'package:ecommerce/feature/profile/presentaton/widgets/form_filed_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: Image.asset(AppAssets.blueLogo)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Welcome, Jana", style: AppTextStyle.poppins18PrimaryColor500),
          Text(
            "Janjon17000@gmail.com",
            style: AppTextStyle.poppins14DescriptionColor400,
          ),
          SizedBox(height: 40.h),
          FormFiledWidget(lable: "Your full name", data: "Jana Abdelwahed"),
          SizedBox(height: 24.h),
          FormFiledWidget(lable: "Your E-mail", data: "janjon17000@gmail.com"),
          SizedBox(height: 24.h),
          FormFiledWidget(
            lable: "Your password",
            data: "**********************",
          ),
          SizedBox(height: 24.h),
          FormFiledWidget(lable: "Your mobile number", data: "01000000000"),
          SizedBox(height: 24.h),
          FormFiledWidget(
            lable: "Your Address",
            data: "Fifth Settlement, street 30.....",
          ),
        ],
      ),
    );
  }
}
