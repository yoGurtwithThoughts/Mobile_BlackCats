import 'package:black_cat/model/cart-widget.dart';
import 'package:black_cat/service/calculated.dart';
import 'package:black_cat/widgets/bonus_label.dart';
import 'package:black_cat/widgets/cart_item_widget.dart';
import 'package:black_cat/widgets/styletxt.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

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
      final price =
          int.tryParse(item.price.replaceAll(RegExp(r'[^\d]'), '')) ?? 0;
      return sum + (price * item.count);
    });

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset('assets/images/back.png', fit: BoxFit.cover),
          ),
          // Main content
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.055,
              vertical: screenHeight * 0.07,
            ),
            child:
                cartItems.isEmpty
                    ? Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: screenWidth * 0.8,
                            height: screenHeight * 0.35,
                            child: Image.asset(
                              'assets/images/SadC.png',
                              fit: BoxFit.fill,
                              height: 250,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Корзина пуста!\nДобавьте товар для заказа.',
                            style: TextStylesMain.carttxt,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    )
                    : Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: cartItems.length,
                            itemBuilder: (context, index) {
                              final product = cartItems[index];
                              return Padding(
                                padding: EdgeInsets.only(
                                  bottom: screenHeight * 0.02,
                                ),
                                child: CartItem(
                                  product: product,
                                  onIncrement: onIncrement,
                                  onDecrement: onDecrement,
                                  onRemove: onRemove,
                                ),
                              );
                            },
                          ),
                        ),
                        const BonusesSection(),
                        const Spacer(),
                        SvgPicture.asset(
                          'assets/images/Line.svg',
                          width: screenWidth * 0.4,
                          height: 2,
                        ),
                        const SizedBox(height: 25),
                        TotalPriceSection(totalPrice: totalPrice),
                      ],
                    ),
          ),
        ],
      ),
    );
  }
}
