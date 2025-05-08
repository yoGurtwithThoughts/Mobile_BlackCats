import 'package:flutter/material.dart';
import 'package:black_cat/widgets/styletxt.dart';

class BonusesSection extends StatelessWidget {
  const BonusesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        BonusItem(text: 'Скидка 15% на следующий заказ'),
        BonusItem(text: 'Кофе в подарок за отзыв'),
      ],
    );
  }
}

class BonusItem extends StatelessWidget {
  final String text;

  const BonusItem({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.symmetric(vertical: screenHeight * 0.1),
      padding: EdgeInsets.all(screenWidth * 0.001), 
      child: Stack(
        children: [
          // SVG background with adjusted BoxFit and aspect ratio
          Positioned.fill(
            child: Image.asset(
              'assets/images/bonus.png',
              fit: BoxFit.cover, 
            ),
          ),
          Center(
            child: Text(
              text,
              style: TextStylesMain.bonustxt,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
