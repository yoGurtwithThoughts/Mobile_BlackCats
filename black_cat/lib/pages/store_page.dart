import 'package:black_cat/model/cart-widget.dart';
import 'package:flutter/material.dart';
import '../widgets/prodact_card.dart';

class StorePage extends StatefulWidget {
  final Function(Product) onAddToCart; 
  const StorePage({super.key, required this.onAddToCart});

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  final List<Product> cart = [];

  late final List<Product> products = [
    Product(
      name: 'Арабика',
      price: '243 руб',
      imageAsset: 'assets/product/arabica.png',
    ),
    Product(
      name: 'Экстра',
      price: '199 руб',
      imageAsset: 'assets/product/houseblend.png',
    ),
    Product(
      name: 'Американо',
      price: '199 руб',
      imageAsset: 'assets/product/americani.png',
    ),
    Product(
      name: 'Капучино',
      price: '199 руб',
      imageAsset: 'assets/product/capuchino.png',
    ),
    Product(
      name: 'Раф',
      price: '199 руб',
      imageAsset: 'assets/product/raf.png',
    ),
    Product(
      name: 'Моккачино',
      price: '199 руб',
      imageAsset: 'assets/product/mokkachino.png',
    ),
    Product(
      name: 'Латте',
      price: '210 руб',
      imageAsset: 'assets/product/latte.png',
    ),
  ];

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(16, 7, 4, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 35,
                  crossAxisSpacing: 30,
                  childAspectRatio: 0.74,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ProductCard(
                    nameProdact: product.name,
                    cost: product.price,
                    imageAsset: product.imageAsset,
                    onAddToCart: widget.onAddToCart,
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