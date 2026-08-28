import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constant/app_colors.dart';

class FavouriesButton extends StatelessWidget {
  final bool isFavouries;
  const FavouriesButton({super.key,this.isFavouries=false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.0.r),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Icon(isFavouries?
          Icons.favorite
          :Icons.favorite_border_outlined,color: AppColors.primaryColor),
    );
  }
}
