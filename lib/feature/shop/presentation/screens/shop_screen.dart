import 'package:ecommerce/core/constant/app_assets.dart';
import 'package:ecommerce/core/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/app_bar.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  final List<Map<String, dynamic>> products = const [
    {
      "title": "Nike Air Jordan",
      "image": AppAssets.footWear1,
      "price": "1,200",
      "rating": 4.6,
    },
    {
      "title": "Nike Air Jordan",
      "image": AppAssets.footWear2,
      "price": "1,100",
      "rating": 4.5,
    },
    {
      "title": "Nike Air Jordan",
      "image": AppAssets.footWear3,
      "price": "1,000",
      "rating": 4.8,
    },
    {
      "title": "Nike Air Jordan",
      "image": AppAssets.footWear4,
      "price": "1,500",
      "rating": 4.8,
    },
    {
      "title": "Nike Air Jordan",
      "image": AppAssets.footWear5,
      "price": "1,800",
      "rating": 4.0,
    },
    {
      "title": "Nike Air Jordan",
      "image": AppAssets.footWear6,
      "price": "1,900",
      "rating": 4.0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.w,
            mainAxisSpacing: 16.h,
            childAspectRatio: 0.72,
          ),
          itemBuilder: (context, index) {
            final product = products[index];
            return ProductCard(
              title: product["title"],
              imagePath: product["image"],
              price: product["price"],
              oldPrice: product["oldPrice"],
              rating: product["rating"],
            );
          },
        ),
      ),
    );
  }
}
