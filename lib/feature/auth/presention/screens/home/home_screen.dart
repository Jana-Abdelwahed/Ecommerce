import 'dart:async';

import 'package:ecommerce/core/constant/app_assets.dart';
import 'package:ecommerce/core/constant/app_colors.dart';
import 'package:ecommerce/core/constant/app_routes.dart';
import 'package:ecommerce/core/constant/app_text_style.dart';
import 'package:ecommerce/core/widgets/app_bar.dart';
import 'package:ecommerce/core/widgets/product_card.dart';
import 'package:ecommerce/feature/auth/presention/screens/home/category_widget.dart';
import 'package:ecommerce/feature/auth/presention/screens/shop/shop_screen.dart';
import 'package:ecommerce/feature/auth/presention/screens/wishlist_screen/cubit/wishlist_cubit.dart';
import 'package:ecommerce/feature/auth/presention/screens/wishlist_screen/cubit/wishlist_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  Timer? _timer;

  final List<String> _banners = [
    AppAssets.banner1,
    AppAssets.banner2,
    AppAssets.banner3,
  ];

  final List<Map<String, String>> _categories = [
    {"title": "Women's fashion", "image": AppAssets.WomensFashion},
    {"title": "Beauty", "image": AppAssets.Beauty},
    {"title": "Men's fashion", "image": AppAssets.MenFashion},
    {"title": "Headphones", "image": AppAssets.Headphones},
    {"title": "Laptops & Electronics", "image": AppAssets.Laptops},
    {"title": "Skincare", "image": AppAssets.SkinCare},
    {"title": "Baby & Toys", "image": AppAssets.Baby},
    {"title": "Cameras", "image": AppAssets.Camera},
  ];

  final List<Map<String, dynamic>> _homeAppliances = [
    {
      "id": "appliance_1",
      "title": "Washing Machine",
      "image": AppAssets.product1,
      "price": "9000",
      "rating": 4.8,
      "description":
          "High-efficiency front-load washing machine with steam wash.",
    },
    {
      "id": "appliance_2",
      "title": "Gas Stove",
      "image": AppAssets.product2,
      "price": "12000",
      "rating": 4.7,
      "description": "Premium 4-burner gas stove with tempered glass top.",
    },
    {
      "id": "appliance_3",
      "title": "Electric Iron",
      "image": AppAssets.product3,
      "price": "1500",
      "rating": 4.5,
      "description": "Steam iron with non-stick soleplate and adjustable heat.",
    },
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (mounted) {
        setState(() {
          _currentIndex = (_currentIndex + 1) % _banners.length;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          spacing: 16.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SizedBox(
                  height: 200.h,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.r),
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 800),
                      switchInCurve: Curves.easeInOut,
                      switchOutCurve: Curves.easeInOut,
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                      child: Image.asset(
                        _banners[_currentIndex],
                        key: ValueKey<int>(_currentIndex),
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 8.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(_banners.length, (index) {
                      bool isActive = _currentIndex == index;
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                        height: 8.r,
                        width: 8.r,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isActive
                              ? AppColors.primaryColor
                              : Colors.white,
                          border: Border.all(
                            color: isActive
                                ? AppColors.primaryColor
                                : Colors.grey.shade300,
                            width: 1,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Categories",
                  style: AppTextStyle.poppins18PrimaryColor500,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.categoryScreen);
                  },
                  child: Text(
                    "view all",
                    style: AppTextStyle.poppins12PrimaryColor400,
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 280.h,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16.w,
                  crossAxisSpacing: 16.h,
                  childAspectRatio: 1.25,
                ),
                itemCount: _categories.length,
                itemBuilder: (context, index) {
                  final cat = _categories[index];
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              ShopScreen(categoryTitle: cat["title"]),
                        ),
                      );
                    },
                    child: CategoryWidget(
                      title: cat["title"]!,
                      imagePath: cat["image"]!,
                    ),
                  );
                },
              ),
            ),

            Text(
              "Home Appliance",
              style: AppTextStyle.poppins18PrimaryColor500,
            ),
            SizedBox(
              height: 259.h,
              child: ListView.separated(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                itemCount: _homeAppliances.length,
                separatorBuilder: (context, index) => SizedBox(width: 16.w),
                itemBuilder: (context, index) {
                  final item = _homeAppliances[index];
                  return BlocBuilder<WishlistCubit, WishlistState>(
                    builder: (context, state) {
                      final wishlistCubit = context.read<WishlistCubit>();
                      final isFav = wishlistCubit.isFavorite(
                        item["id"].toString(),
                      );

                      return ProductCard(
                        title: item["title"],
                        description: item["description"] ?? "",
                        imagePath: item["image"],
                        price: item["price"],
                        rating: item["rating"],
                        isFavorite: isFav,
                        onFavoriteTap: () {
                          wishlistCubit.toggleFavorite(item);
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
