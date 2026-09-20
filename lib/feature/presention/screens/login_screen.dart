import 'package:ecommerce/core/constant/app_assets.dart';
import 'package:ecommerce/feature/presention/cubit/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/app_routes.dart';
import '../../../../core/constant/app_size.dart';
import '../../../../core/constant/app_text_style.dart';
import '../cubit/auth_cubit.dart';
import '../widgets/primary_text_form_field.dart';
import '../widgets/secondary_button.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoginSuccess) {
          Navigator.pushNamed(context, AppRoutes.layoutScreen);
        }

        if (state is AuthLoginFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSize.horizontalPadding.w,
              vertical: 90.h,
            ),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 5.h,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AppAssets.logo, width: 235.w, height: 70.h),
                      ],
                    ),
                    SizedBox(height: 70.h),
                    Text(
                      "Welcome Back To Route",
                      style: AppTextStyle.poppins24White600,
                    ),
                    Text(
                      "Please sign in with your mail",
                      style: AppTextStyle.poppins16White300,
                    ),
                    SizedBox(height: 30.h),
                    Text(
                      "E-mail address",
                      style: AppTextStyle.poppins18White500,
                    ),
                    SizedBox(height: 15.h),
                    PrimaryTextFormField(
                      hintText: "enter your email address",
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Please enter your email";
                        }

                        if (!value.contains('@')) {
                          return "Please enter a valid email";
                        }

                        return null;
                      },
                    ),
                    SizedBox(height: 25.h),
                    Text("Password", style: AppTextStyle.poppins18White500),
                    SizedBox(height: 15.h),
                    PrimaryTextFormField(
                      hintText: "enter your password",
                      isPassword: true,
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your password";
                        }

                        if (value.length < 6) {
                          return "Password must be at least 6 characters";
                        }

                        return null;
                      },
                    ),
                    SizedBox(height: 5.h),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        minimumSize: Size(double.infinity, 50.h),
                        alignment: Alignment.centerRight,
                      ),
                      child: Text(
                        "Forgot Password?",
                        style: AppTextStyle.poppins18White400,
                      ),
                    ),
                    SizedBox(height: 15.h),
                    SecondaryButton(
                      text: "Login",
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<AuthCubit>().login(
                            email: emailController.text.trim(),
                            password: passwordController.text,
                          );
                        }
                      },
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: AppTextStyle.poppins18White500,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              AppRoutes.createAccountScreen,
                            );
                          },
                          style: TextButton.styleFrom(padding: EdgeInsets.zero),
                          child: Text(
                            "Create Account",
                            style: AppTextStyle.poppins18White500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
