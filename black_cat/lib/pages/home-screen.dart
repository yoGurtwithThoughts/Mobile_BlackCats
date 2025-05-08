import 'package:black_cat/model/cart-widget.dart';
import 'package:black_cat/pages/ad_page.dart';
import 'package:black_cat/pages/cart_page.dart';
import 'package:black_cat/pages/store_page.dart';
import 'package:black_cat/widgets/botom_bar_items.dart';
import 'package:black_cat/widgets/botom_bar_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Product> cart = [];

  void addToCart(Product product) {
    final existingProduct = cart.firstWhere(
      (item) => item.name == product.name,
      orElse: () => Product(name: '', price: '', imageAsset: '', category: '', count: 0),
    );

    setState(() {
      if (existingProduct.name.isEmpty) {
        product.count = 1;
        cart.add(product);
      } else {
        existingProduct.count++;
      }
    });
  }

  void increment(Product product) {
    setState(() {
      product.count++;
    });
  }

  void decrement(Product product) {
    setState(() {
      if (product.count > 1) {
        product.count--;
      }
    });
  }

  void remove(Product product) {
    setState(() {
      cart.remove(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      const AdPage(),
      StorePage(onAddToCart: addToCart),
      CartPage(
        cartItems: cart,
        onIncrement: increment,
        onDecrement: decrement,
        onRemove: remove,
      ),
    ];

    return BotomBarWidget(
      items: bottomBarItems,
      pages: _pages,
    );
  }
}
