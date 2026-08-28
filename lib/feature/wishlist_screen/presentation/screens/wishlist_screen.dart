import 'package:ecommerce/core/constant/app_assets.dart';
import 'package:ecommerce/feature/wishlist_screen/presentation/widgets/wishlist_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/app_bar.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  final List<Map<String, dynamic>> _wishlistItems = [
    {
      "title": "Nike Air Jordan",
      "image": AppAssets.footWearfav,
      "colorName": "Black color",
      "colorCode": const Color(0xFF2B2B2B),
      "price": "1,200",
      "oldPrice": "1,500",
    },
    {
      "title": "Tall Cotton Dress",
      "image": AppAssets.footWearfav2,
      "colorName": "Orange color",
      "colorCode": const Color(0xFFE88A1A),
      "price": "600",
      "oldPrice": "750",
    },
    {
      "title": "GUESS Women’s",
      "image": AppAssets.footWearfav3,
      "colorName": "Gold Watch",
      "colorCode": const Color(0xFFE3C385),
      "price": "1,200",
      "oldPrice": "1,500",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(),
      body: ListView.separated(
        padding: EdgeInsets.all(16.r),
        itemCount: _wishlistItems.length,
        separatorBuilder: (context, index) => SizedBox(height: 16.h),
        itemBuilder: (context, index) {
          final item = _wishlistItems[index];
          return WishlistItem(
            title: item["title"],
            imagePath: item["image"],
            colorName: item["colorName"],
            colorCode: item["colorCode"],
            price: item["price"],
            oldPrice: item["oldPrice"],
          );
        },
      ),
    );
  }
}
