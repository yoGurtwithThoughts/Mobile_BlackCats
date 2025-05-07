import 'package:black_cat/widgets/styletxt.dart';
import 'package:flutter/material.dart';

class GradientBorderButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const GradientBorderButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _GradientBorderPainter(),
      child: SizedBox(
        width: 340,
        height: 60,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(247, 255, 188, 0.20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(49),
            ),
            padding: EdgeInsets.zero,
          ),
          onPressed: onPressed,
          child: Text(text, style: TextStylesMain.apptxt),
        ),
      ),
    );
  }
}

class _GradientBorderPainter extends CustomPainter {
  final Paint _paint;

  _GradientBorderPainter()
    : _paint =
          Paint()
            ..shader = const LinearGradient(
              colors: [Color(0xFFE0A872), Color(0xFFE0A872)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(const Rect.fromLTRB(0, 0, 340, 60))
            ..style = PaintingStyle.stroke
            ..strokeWidth = 2;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    canvas.drawRRect(
      RRect.fromRectAndRadius(rect, const Radius.circular(49)),
      _paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
