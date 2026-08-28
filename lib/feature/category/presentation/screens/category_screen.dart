import 'package:ecommerce/core/constant/app_assets.dart';
import 'package:ecommerce/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/app_text_style.dart';
import '../../../../core/widgets/app_bar.dart';
import '../../../shop/presentation/screens/shop_screen.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  int _selectedCategoryIndex = 0;

  final List<String> _mainCategories = [
    "Men’s Fashion",
    "Women’s Fashion",
    "Skincare",
    "Beauty",
    "Headphones",
    "Cameras",
    "Laptops & Electronics",
    "Baby & Toys",
  ];

  final Map<int, String> _categoryBanners = {
    0: AppAssets.category1,
    1: AppAssets.category2,
  };

  final Map<int, List<Map<String, String>>> _subCategoriesMap = {
    0: [
      {"title": "T-shirts", "image": AppAssets.tshirtImage},
      {"title": "Shorts", "image": AppAssets.shortsImage},
      {"title": "Jeans", "image": AppAssets.jeansImage},
      {"title": "Pants", "image": AppAssets.pantsImage},
      {"title": "Footwear", "image": AppAssets.footWear},
      {"title": "Suits", "image": AppAssets.suitsImage},
      {"title": "Watches", "image": AppAssets.watchesImage},
      {"title": "Bags", "image": AppAssets.bagsImage},
      {"title": "Eyewear", "image": AppAssets.eyewearImage},
    ],
    1: [
      {"title": "Dresses", "image": AppAssets.dressesImage},
      {"title": "Jeans", "image": AppAssets.womenJeansImage},
      {"title": "Skirts", "image": AppAssets.skirtsImage},
      {"title": "Pajamas", "image": AppAssets.pajamasImage},
      {"title": "Bags", "image": AppAssets.womenBagsImage},
      {"title": "T-shirts", "image": AppAssets.womenTshirtImage},
      {"title": "Footwear", "image": AppAssets.womenFootwearImage},
      {"title": "Eyewear", "image": AppAssets.womenEyewearImage},
      {"title": "Watches", "image": AppAssets.womenWatchesImage},
    ],
  };

  @override
  Widget build(BuildContext context) {
    final currentSubCategories =
        _subCategoriesMap[_selectedCategoryIndex] ?? _subCategoriesMap[0]!;

    final currentBanner =
        _categoryBanners[_selectedCategoryIndex] ?? AppAssets.category1;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 135.w,
            color: AppColors.secondaryColor,
            child: ListView.builder(
              itemCount: _mainCategories.length,
              itemBuilder: (context, index) {
                bool isSelected = _selectedCategoryIndex == index;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedCategoryIndex = index;
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      vertical: 16.h,
                      horizontal: 8.w,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.white : Colors.transparent,
                    ),
                    child: Row(
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          width: 5.w,
                          height: isSelected ? 40.h : 0,
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        SizedBox(width: isSelected ? 8.w : 13.w),
                        Expanded(
                          child: Text(
                            _mainCategories[index],
                            style: AppTextStyle.poppins14PrimaryColor500,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          SizedBox(width: 16.w),

          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _mainCategories[_selectedCategoryIndex],
                    style: AppTextStyle.poppins14PrimaryColor500,
                  ),
                  SizedBox(height: 12.h),

                  Container(
                    width: double.infinity,
                    height: 95.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      image: DecorationImage(
                        image: AssetImage(currentBanner),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),

                  Expanded(
                    child: GridView.builder(
                      itemCount: currentSubCategories.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10.w,
                        mainAxisSpacing: 16.h,
                        childAspectRatio: 0.72,
                      ),
                      itemBuilder: (context, index) {
                        final subCategory = currentSubCategories[index];
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const ShopScreen(),
                              ),
                            );
                          },
                          child: Column(
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.r),
                                  child: Image.asset(
                                    subCategory["image"]!,
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(height: 6.h),
                              Text(
                                subCategory["title"]!,
                                style: AppTextStyle.poppins12PrimaryColor400,
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
