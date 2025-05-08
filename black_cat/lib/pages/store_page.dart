import 'package:black_cat/model/cart-widget.dart';
import 'package:black_cat/model/list-product.dart';
import 'package:black_cat/widgets/sort-button.dart';
import 'package:flutter/material.dart';
import '../widgets/prodact_card.dart';

class StorePage extends StatefulWidget {
  final Function(Product) onAddToCart;
  const StorePage({super.key, required this.onAddToCart});

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  String selectedCategory = 'Кофе';

  @override
  Widget build(BuildContext context) {
    // Фильтрация в build, чтобы всегда была актуальна
    final List<Product> filteredProducts =
        products.where((p) => p.category == selectedCategory).toList();

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/back.png', // Replace with your background image path
              fit: BoxFit.cover, // Ensure the image covers the whole screen
            ),
          ),
          // Main content
          Column(
            children: [
              SortButton(
                onSelected: (category) {
                  setState(() {
                    selectedCategory = category;
                  });
                },
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 35,
                        crossAxisSpacing: 30,
                        childAspectRatio: 0.74,
                      ),
                      itemCount: filteredProducts.length,
                      itemBuilder: (context, index) {
                        final product = filteredProducts[index];
                        return ProductCard(
                          product: product,
                          nameProdact: product.name,
                          cost: product.price,
                          imageAsset: product.imageAsset,
                          onAddToCart: widget.onAddToCart,
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
