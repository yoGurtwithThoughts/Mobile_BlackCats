import 'package:black_cat/model/cart-widget.dart';
import 'package:black_cat/service/calculated.dart';
import 'package:black_cat/widgets/bonus_label.dart';
import 'package:black_cat/widgets/item_widget.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  final List<Product> cartItems;
  final void Function(Product) onIncrement;
  final void Function(Product) onDecrement;
  final void Function(Product) onRemove;

  const CartPage({
    super.key,
    required this.cartItems,
    required this.onIncrement,
    required this.onDecrement,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    int totalPrice = cartItems.fold(0, (sum, item) {
      final price = int.tryParse(item.price.replaceAll(RegExp(r'[^\d]'), '')) ?? 0;
      return sum + (price * item.count);
    });

    return Scaffold(
      backgroundColor: const Color(0xFF100704),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.065, // 5% of screen width
          vertical: screenHeight * 0.075,  // 3% of screen height
        ),
        child: Column(
          children: [
            // Cart items list
            CartItemsList(
              cartItems: cartItems,
              onIncrement: onIncrement,
              onDecrement: onDecrement,
              onRemove: onRemove,
            ),
            const BonusesSection(),
            const Spacer(),
            TotalPriceSection(totalPrice: totalPrice),
          ],
        ),
      ),
    );
  }
}

