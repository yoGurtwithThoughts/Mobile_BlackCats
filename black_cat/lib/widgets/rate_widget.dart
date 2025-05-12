import 'package:black_cat/widgets/styletxt.dart';
import 'package:flutter/material.dart';

Widget buildReviewCard(String imagePath, String name, double rating) {
  return Container(
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: const Color.fromRGBO(62, 39, 35, 1),
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          blurRadius: 8,
          offset: Offset(0, 4),
        ),
      ],
    ),
    width: 200,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.asset(imagePath, height: 60, width: 60, fit: BoxFit.cover),
        ),
        SizedBox(height: 8),
        Text(
          name,
          style: TextStylesMain.hintTextst
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) {
            return ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  colors: [Color(0xFFE0A872), Color(0xFFF8E4BE)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ).createShader(bounds);
              },
              child: Icon(
                index < rating ? Icons.star : Icons.star_border,
                color: Colors.white,
                size: 20,
              ),
            );
          }),
        ),
      ],
    ),
  );
}