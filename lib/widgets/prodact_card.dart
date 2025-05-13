import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../model/cart-widget.dart';
import '../widgets/styletxt.dart';

class ProductCard extends StatelessWidget {
  final String nameProdact;
  final Product product;
  final String cost;
  final String imageAsset;
  final Function(Product) onAddToCart;

  const ProductCard({
    super.key,
    required this.nameProdact,
    required this.cost,
    required this.imageAsset,
    required this.onAddToCart, required this.product,
  });

  @override
  Widget build(BuildContext context) {
    // Получаем размер экрана
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Процентные размеры
    final double cardWidth = screenWidth * 0.5; // 40% ширины экрана
    final double cardHeight = screenHeight * 0.35; // 35% высоты экрана
    final double imageHeight = cardHeight * 0.55; // 55% от высоты карточки

    return Container(
      height: cardHeight,
      width: cardWidth,
      decoration: BoxDecoration(
        color: Color.fromRGBO(161, 121, 96, 0.25),
        borderRadius: BorderRadius.circular(screenHeight * 0.02),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  height: imageHeight,
                  width: cardWidth,
                  child: Image.asset(imageAsset, fit: BoxFit.fill),
                ),
              ),

              // Кнопка корзины
              Padding(
                padding: EdgeInsets.all(screenHeight * 0.005),
                child: IconButton(
                  onPressed: () {
                    onAddToCart(product); // ← Передаём весь продукт
                  },
                  icon: SvgPicture.asset(
                    'assets/icons/carticon.svg',
                    height: screenHeight * 0.05,
                  ),
                ),
              ),
            ],
          ),

          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(225, 225, 225, 0.15),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(
                    screenHeight * 0.015,
                  ), // ← скругление только снизу
                ),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05,
                vertical: screenHeight * 0.015,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      nameProdact,
                      style: TextStylesMain.cardtxt.copyWith(
                        fontSize: screenHeight * 0.015,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.015),
                  Expanded(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        cost,
                        style: TextStylesMain.cardtxt.copyWith(
                          fontSize: screenHeight * 0.015,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
