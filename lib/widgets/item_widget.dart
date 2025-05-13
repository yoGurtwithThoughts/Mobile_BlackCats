import 'package:black_cat/model/cart-widget.dart';
import 'package:black_cat/widgets/cart_item_widget.dart';
import 'package:flutter/material.dart';

class CartItemsList extends StatelessWidget {
  final List<Product> cartItems;
  final void Function(Product) onIncrement;
  final void Function(Product) onDecrement;
  final void Function(Product) onRemove;

  const CartItemsList({
    super.key,
    required this.cartItems,
    required this.onIncrement,
    required this.onDecrement,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: cartItems.map((product) => CartItem(
        product: product,
        onIncrement: onIncrement,
        onDecrement: onDecrement,
        onRemove: onRemove,
      )).toList(),
    );
  }
}