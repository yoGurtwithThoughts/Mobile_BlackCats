import 'package:black_cat/model/cart-widget.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final Product product;
  final void Function(Product) onIncrement;
  final void Function(Product) onDecrement;
  final void Function(Product) onRemove;

  const CartItem({
    super.key,
    required this.product,
    required this.onIncrement,
    required this.onDecrement,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(product.name),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        onRemove(product);
      },
      background: Container(
        color: Colors.red,
        child: const Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(
              Icons.delete,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(39, 20, 16, 1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                product.imageAsset,
                width: 50,
                height: 50,
                fit: BoxFit.contain,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '${product.price} руб',
                    style: const TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(239, 220, 199, 1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove, size: 18),
                    onPressed: () => onDecrement(product),
                  ),
                  Text(
                    '${product.count}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add, size: 18),
                    onPressed: () => onIncrement(product),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}