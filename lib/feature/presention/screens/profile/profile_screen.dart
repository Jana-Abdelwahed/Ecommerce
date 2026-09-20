import 'package:ecommerce/core/constant/app_assets.dart';
import 'package:ecommerce/core/constant/app_text_style.dart';
import 'package:ecommerce/feature/presention/cubit/auth_cubit.dart';
import 'package:ecommerce/feature/presention/cubit/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'form_filed_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: Image.asset(AppAssets.blueLogo)),
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          final user = context.read<AuthCubit>().currentUser;

          final userName = user?.name ?? "User";
          final userEmail = user?.email ?? "No E-mail Provided";
          final userPhone = user?.phone ?? "No Mobile Provided";

          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome, $userName",
                  style: AppTextStyle.poppins18PrimaryColor500,
                ),
                SizedBox(height: 4.h),
                Text(
                  userEmail,
                  style: AppTextStyle.poppins14DescriptionColor400,
                ),
                SizedBox(height: 40.h),

                FormFiledWidget(lable: "Your full name", data: userName),
                SizedBox(height: 24.h),

                FormFiledWidget(lable: "Your E-mail", data: userEmail),
                SizedBox(height: 24.h),

                FormFiledWidget(
                  lable: "Your password",
                  data: "**********************",
                ),
                SizedBox(height: 24.h),

                FormFiledWidget(lable: "Your mobile number", data: userPhone),
                SizedBox(height: 24.h),

                const FormFiledWidget(
                  lable: "Your Address",
                  data: "Fifth Settlement, street 30.....",
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
