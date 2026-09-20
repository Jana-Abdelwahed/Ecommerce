import 'package:ecommerce/core/constant/all_products.dart';
import 'package:ecommerce/core/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = AllProducts.products
        .where(
          (product) =>
              product['title'].toLowerCase().contains(query.toLowerCase()),
        )
        .toList();

    return _buildProductGrid(results);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = AllProducts.products
        .where(
          (product) =>
              product['title'].toLowerCase().contains(query.toLowerCase()),
        )
        .toList();

    return _buildProductGrid(suggestions);
  }

  Widget _buildProductGrid(List<Map<String, dynamic>> products) {
    if (products.isEmpty) {
      return const Center(child: Text("No products found."));
    }

    return GridView.builder(
      padding: EdgeInsets.all(16.r),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 16.h,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductCard(
          title: product["title"],
          imagePath: product["image"],
          price: product["price"],
          rating: product["rating"],
          description: product["description"] ?? "",
        );
      },
    );
  }
}
