import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/app_text_style.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  final int trimLines;

  const ExpandableText({
    super.key,
    required this.text,
    this.trimLines = 2,
  });

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedSize(
          duration: const Duration(milliseconds: 200), // Smoothly animates size changes
          curve: Curves.easeInOut,
          child: Text(
            widget.text,
            style: AppTextStyle.poppins14PrimaryColor400,
            maxLines: _isExpanded ? null : widget.trimLines,
            overflow: _isExpanded ? TextOverflow.clip : TextOverflow.ellipsis,
          ),
        ),

        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Padding(
            padding: EdgeInsets.only(top: 4.h),
            child: Text(
              _isExpanded ? "Read Less" : ".....Read More",
              style: AppTextStyle.poppins14PrimaryColor500,
            ),
          ),
        ),
      ],
    );
  }
}