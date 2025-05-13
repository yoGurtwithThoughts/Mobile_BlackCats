import 'package:black_cat/widgets/form_review.dart';
import 'package:flutter/material.dart';

class SaleBanner extends StatelessWidget {
  const SaleBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: const Color.fromRGBO(102, 55, 29, 1),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                  ),
                  builder: (context) => ReviewForm(
                  ),
                );
              },
              child: Image.asset(
                'assets/images/sale2.png',
                fit: BoxFit.contain,
                height: 325,
              ),
            ),
          ),
        ],
      ),
    );
  }
}