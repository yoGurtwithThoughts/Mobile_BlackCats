import 'package:black_cat/model/cart-widget.dart';
import 'package:black_cat/widgets/styletxt.dart';
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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Dismissible(
      key: Key(product.name),
      direction: DismissDirection.endToStart, // Свайп влево → удаление
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          onRemove(product);
        }
      },
      background: Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: EdgeInsets.only(left: 10, top: 8, bottom: 8),
          child: SizedBox(
            width: screenWidth * 0.15,
            height: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(201, 76, 76, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(15),
                    right: Radius.circular(15),
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 15),
              ),
              onPressed: () {
                onRemove(product); // Удалить товар
              },
              child: Icon(
                Icons.delete,
                color: Colors.white,
                size: screenWidth * 0.07,
              ),
            ),
          ),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(255, 255, 255, 0.10),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(
                screenWidth * 0.045,
              ), // 3% of screen width for padding
              child: Image.asset(
                product.imageAsset,
                width: screenWidth * 0.15,
                height: screenHeight * 0.06,
                fit: BoxFit.contain,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name, style: TextStylesMain.cardtxt),
                  const SizedBox(height: 5),
                  Text('${product.price}', style: TextStylesMain.cardtxt),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.08),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => onDecrement(product),
                    icon: Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(
                          239,
                          227,
                          200,
                          1,
                        ), // Background color for the button
                        borderRadius: BorderRadius.circular(
                          12,
                        ), // Rounded corners
                      ),
                      padding: EdgeInsets.all(
                        8,
                      ), // Padding to increase the size of the button
                      child: const Icon(
                        Icons.remove,
                        size: 20, // Increased size for the icon
                        color: Color.fromRGBO(28, 22, 30, 1), // Icon color
                      ),
                    ),
                  ),
                  Text('${product.count}', style: TextStylesMain.bonustxt),
                  IconButton(
                    onPressed: () => onIncrement(product),
                    icon: Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(
                          239,
                          227,
                          200,
                          1,
                        ), // Background color for the button
                        borderRadius: BorderRadius.circular(
                          12,
                        ), // Rounded corners
                      ),
                      padding: EdgeInsets.all(
                        8,
                      ), // Padding to increase the size of the button
                      child: const Icon(
                        Icons.add,
                        size: 20, // Increased size for the icon
                        color: Color.fromRGBO(28, 22, 30, 1), // Icon color
                      ),
                    ),
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
