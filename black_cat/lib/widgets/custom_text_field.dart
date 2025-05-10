import 'package:black_cat/widgets/styletxt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final Widget icon; // может быть любым виджетом (например, SVG)
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onChanged;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.icon,
    required this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final iconSize = screenWidth * 0.05; // регулируй этот коэффициент под нужный размер

    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenWidth * 0.02),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        validator: validator,
        onChanged: onChanged,
        inputFormatters: inputFormatters,
        style: TextStylesMain.bonustxt, 
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStylesMain.hinttxt, // стили для placeholder'а
          prefixIcon: Padding(
            padding: EdgeInsets.all(screenWidth * 0.035),
            child: SizedBox(
              width: iconSize,
              height: iconSize,
              child: FittedBox(
                fit: BoxFit.contain,
                child: icon, // любой виджет будет правильно масштабирован
              ),
            ),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(
            vertical: screenWidth * 0.04,
            horizontal: screenWidth * 0.045,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(
              width: 1,
              color: Color.fromRGBO(214, 214, 214, 1),
            ),
          ),
        ),
      ),
    );
  }
}