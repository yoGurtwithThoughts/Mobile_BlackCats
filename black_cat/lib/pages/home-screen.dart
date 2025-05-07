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

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      const AdPage(),
      StorePage(
        onAddToCart: (product) {
          setState(() {
            cart.add(product);
          });
        },
      ),
      CartPage(cart: cart),
    ];

    final List<BottomBarItem> _items = bottomBarItems;

    return BotomBarWidget(
      items: _items,
      pages: _pages,
    );
  }
}