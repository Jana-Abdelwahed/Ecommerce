import 'package:ecommerce/core/constant/app_assets.dart';
import 'package:ecommerce/core/constant/app_colors.dart';
import 'package:ecommerce/core/widgets/favouries_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductImageSlider extends StatefulWidget {
  final List<String>? images;
  final bool isFavorite;
  final VoidCallback? onFavoriteTap;

  const ProductImageSlider({
    super.key,
    this.images,
    this.isFavorite = false,
    this.onFavoriteTap,
  });

  @override
  State<ProductImageSlider> createState() => _ProductImageSliderState();
}

class _ProductImageSliderState extends State<ProductImageSlider> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> _defaultImages = const [
    AppAssets.productImage1,
    AppAssets.productImage2,
    AppAssets.productImage3,
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> displayImages =
        (widget.images != null && widget.images!.isNotEmpty)
        ? widget.images!
        : _defaultImages;

    return Container(
      width: double.infinity,
      height: 240.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.primaryColor, width: 1),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: PageView.builder(
              controller: _pageController,
              itemCount: displayImages.length,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemBuilder: (context, index) {
                final imagePath = displayImages[index];

                if (imagePath.startsWith('http')) {
                  return Image.network(
                    imagePath,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) =>
                        Image.asset(_defaultImages.first, fit: BoxFit.cover),
                  );
                }

                return Image.asset(
                  imagePath.isNotEmpty ? imagePath : _defaultImages.first,
                  fit: BoxFit.cover,
                );
              },
            ),
          ),

          Positioned(
            top: 12.h,
            right: 12.w,
            child: FavouriesButton(
              isFavorite: widget.isFavorite,
              onTap: widget.onFavoriteTap,
            ),
          ),

          Positioned(
            bottom: 12.h,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(displayImages.length, (index) {
                bool isActive = _currentPage == index;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  margin: EdgeInsets.symmetric(horizontal: 3.w),
                  height: 6.h,
                  width: isActive ? 22.w : 6.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: isActive
                        ? AppColors.primaryColor
                        : Colors.transparent,
                    border: Border.all(color: AppColors.primaryColor, width: 1),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
