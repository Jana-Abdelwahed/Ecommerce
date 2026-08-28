import 'package:ecommerce/core/constant/app_assets.dart';
import 'package:ecommerce/core/constant/app_colors.dart';
import 'package:ecommerce/core/constant/app_routes.dart';
import 'package:ecommerce/core/constant/app_size.dart';
import 'package:ecommerce/core/constant/app_text_style.dart';
import 'package:ecommerce/feature/auth/presention/cubit/auth_cubit.dart';
import 'package:ecommerce/feature/auth/presention/cubit/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/primary_text_form_field.dart';
import '../widgets/secondary_button.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final rePasswordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSignupSuccess) {
          Navigator.pushNamed(context, AppRoutes.layoutScreen);
        }

        if (state is AuthSignupFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        final isLoading = state is AuthLoading;

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
                  spacing: 24.h,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AppAssets.logo, width: 235.w, height: 70.h),
                      ],
                    ),
                    SizedBox(height: 1),
                    Text("Full Name", style: AppTextStyle.poppins18White500),

                    PrimaryTextFormField(
                      hintText: "enter your full name",
                      controller: nameController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Please enter your full name";
                        }

                        if (value.trim().length < 3) {
                          return "Name must be at least 3 characters";
                        }

                        return null;
                      },
                    ),

                    SizedBox(height: 1),
                    Text(
                      "Mobile Number",
                      style: AppTextStyle.poppins18White500,
                    ),

                    PrimaryTextFormField(
                      hintText: "enter your mobile no.",
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Please enter your mobile number";
                        }

                        if (value.trim().length < 10) {
                          return "Please enter a valid mobile number";
                        }

                        return null;
                      },
                    ),

                    SizedBox(height: 1),
                    Text(
                      "E-mail address",
                      style: AppTextStyle.poppins18White500,
                    ),
                    PrimaryTextFormField(
                      hintText: "enter your email address",
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
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
                    SizedBox(height: 1.h),
                    Text("Password", style: AppTextStyle.poppins18White500),
                    PrimaryTextFormField(
                      hintText: "enter your password",
                      controller: passwordController,
                      isPassword: true,
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
                    SizedBox(height: 1),
                    Text(
                      "Confirm Password",
                      style: AppTextStyle.poppins18White500,
                    ),
                    PrimaryTextFormField(
                      hintText: "re-enter your password",
                      controller: rePasswordController,
                      isPassword: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please confirm your password";
                        }

                        if (value != passwordController.text) {
                          return "Passwords do not match";
                        }

                        return null;
                      },
                    ),
                    SizedBox(height: 1),
                    SecondaryButton(
                      text: isLoading ? "Creating Account..." : "Sign Up",
                      onPressed: isLoading
                          ? null
                          : () {
                              if (formKey.currentState!.validate()) {
                                context.read<AuthCubit>().signup(
                                  name: nameController.text.trim(),
                                  email: emailController.text.trim(),
                                  password: passwordController.text,
                                  rePassword: rePasswordController.text,
                                  phone: phoneController.text.trim(),
                                );
                              }
                            },
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
