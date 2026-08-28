import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/app_text_style.dart';

class PrimaryTextFormField extends StatefulWidget {
  final bool isPassword;
  final String? hintText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const PrimaryTextFormField({
    super.key,
    this.isPassword = false,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.validator,
  });

  @override
  State<PrimaryTextFormField> createState() => _PrimaryTextFormFieldState();
}

class _PrimaryTextFormFieldState extends State<PrimaryTextFormField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      cursorColor: AppColors.primaryColor,
      obscureText: _obscureText,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: 16.w,
          horizontal: 32.h,
        ),
        hintText: widget.hintText,
        hintStyle: AppTextStyle.poppins18Gray300,
        suffixIcon: widget.isPassword
            ? IconButton(
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          icon: Icon(
            _obscureText
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
            color: const Color(0xFF808080),
          ),
        )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}