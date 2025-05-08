import 'package:black_cat/widgets/button_widget.dart';
import 'package:black_cat/widgets/styletxt.dart';
import 'package:flutter/material.dart';

class TotalPriceSection extends StatelessWidget {
  final int totalPrice;

  const TotalPriceSection({
    super.key,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Итого',
              style: TextStylesMain.totalPrice,
            ),
            Text(
              '$totalPrice руб',
             style: TextStylesMain.totalPrice,
            ),
          ],
        ),
        const SizedBox(height: 10),
        GradientBorderButton(text: 'Продолжить'),
      ],
    );
  }
}