import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../model/cart-widget.dart';
import '../widgets/styletxt.dart';

class ProductCard extends StatelessWidget {
  final String nameProdact;
  final String cost;
  final String imageAsset;
  final Function(Product) onAddToCart; // ← ОБЯЗАТЕЛЬНО указать тип

  const ProductCard({
    super.key,
    required this.nameProdact,
    required this.cost,
    required this.imageAsset,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 190,
      decoration: BoxDecoration(
        color: Color.fromRGBO(225, 225, 225, 0.15),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                child: SizedBox(
                  height: 170,
                  width: 190,
                  child: Image.asset(imageAsset, fit: BoxFit.cover),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () {
                    // Добавляем товар в корзину
                    onAddToCart(Product(
                      name: nameProdact,
                      price: cost,
                      imageAsset: imageAsset,
                    ));

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('$nameProdact добавлен в корзину')),
                    );
                  },
                  icon: SvgPicture.asset(
                    'assets/icons/carticon.svg',
                    height: 30,
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: Color.fromRGBO(225, 225, 225, 0.15),
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 19),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    nameProdact,
                    style: TextStylesMain.cardtxt,
                    maxLines: 2,
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.left,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      cost,
                      style: TextStylesMain.cardtxt,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
