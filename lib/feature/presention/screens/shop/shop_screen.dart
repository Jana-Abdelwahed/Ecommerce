import 'package:ecommerce/core/constant/app_assets.dart';
import 'package:ecommerce/core/constant/app_routes.dart';
import 'package:ecommerce/core/widgets/app_bar.dart';
import 'package:ecommerce/core/widgets/product_card.dart';
import 'package:ecommerce/feature/presention/screens/cart/cubit/cart_cubit.dart';
import 'package:ecommerce/feature/presention/screens/wishlist_screen/cubit/wishlist_cubit.dart';
import 'package:ecommerce/feature/presention/screens/wishlist_screen/cubit/wishlist_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShopScreen extends StatelessWidget {
  final String? categoryTitle;

  const ShopScreen({super.key, this.categoryTitle});

  final List<Map<String, dynamic>> products = const [
    {
      "id": "1",
      "title": "Nike Air Jordan 1",
      "image": AppAssets.footWear1,
      "price": "1,200",
      "rating": 4.6,
      "description":
          "Iconic high-top sneaker with premium cushioning and timeless style.",
      "soldCount": "3,230",
    },
    {
      "id": "2",
      "title": "Nike Air Jordan Low",
      "image": AppAssets.footWear2,
      "price": "1,100",
      "rating": 4.5,
      "description":
          "Low-profile design crafted for everyday versatility and comfort.",
      "soldCount": "2,150",
    },
    {
      "id": "3",
      "title": "Nike Air Jordan High",
      "image": AppAssets.footWear3,
      "price": "1,000",
      "rating": 4.8,
      "description":
          "Classic ankle support with modern traction and street appeal.",
      "soldCount": "1,890",
    },
    {
      "id": "4",
      "title": "Nike Dunk Low",
      "image": AppAssets.footWear4,
      "price": "1,500",
      "rating": 4.8,
      "description":
          "Retro basketball style rebuilt for skateboarding and daily wear.",
      "soldCount": "4,110",
    },
    {
      "id": "5",
      "title": "Nike Air Max",
      "image": AppAssets.footWear5,
      "price": "1,800",
      "rating": 4.0,
      "description":
          "Visible Air unit providing all-day responsive impact absorption.",
      "soldCount": "980",
    },
    {
      "id": "6",
      "title": "Nike Zoom Fly",
      "image": AppAssets.footWear6,
      "price": "1,900",
      "rating": 4.0,
      "description":
          "Lightweight performance shoe designed for distance running.",
      "soldCount": "1,420",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (categoryTitle != null) ...[
              Text(
                categoryTitle!,
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12.h),
            ],
            Expanded(
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

                  return BlocBuilder<WishlistCubit, WishlistState>(
                    builder: (context, wishlistState) {
                      final wishlistCubit = context.read<WishlistCubit>();
                      final isFav = wishlistCubit.isFavorite(product["id"]);

                      return ProductCard(
                        title: product["title"],
                        description: product["description"] ?? "",
                        imagePath: product["image"],
                        price: product["price"],
                        oldPrice: product["oldPrice"],
                        rating: product["rating"],
                        isFavorite: isFav,
                        onFavoriteTap: () {
                          wishlistCubit.toggleFavorite(product);
                        },
                        onAddToCart: () {
                          context.read<CartCubit>().addToCart(product);
                          Navigator.pushNamed(context, AppRoutes.cartScreen);
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
