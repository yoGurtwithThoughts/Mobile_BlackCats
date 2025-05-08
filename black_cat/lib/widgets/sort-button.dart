import 'package:flutter/material.dart';
import 'package:black_cat/widgets/styletxt.dart';

class SortButton extends StatefulWidget {
  final Function(String) onSelected;
  const SortButton({super.key, required this.onSelected});

  @override
  State<SortButton> createState() => _SortButtonState();
}

class _SortButtonState extends State<SortButton> {
  String selectedCategory = 'Кофе';

  void _selectCategory(String category) {
    setState(() {
      selectedCategory = category;
    });
    widget.onSelected(category); 
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
      child: Container(
        width: screenWidth * 0.8,
        height: screenHeight * 0.06,
        decoration: BoxDecoration(
          color: Color.fromRGBO(112, 67, 65, 0.3),
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(screenHeight * 0.03),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () => _selectCategory('Кофе'),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(screenHeight * 0.03),
                ),
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Кофе',
                    style: TextStylesMain.apptxt.copyWith(
                      fontSize: screenHeight * 0.02,
                      color: selectedCategory == 'Кофе'
                          ? Colors.white
                          : Colors.white.withOpacity(0.6),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () => _selectCategory('Десерты'),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(screenHeight * 0.03),
                ),
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Десерты',
                    style: TextStylesMain.apptxt.copyWith(
                      fontSize: screenHeight * 0.02,
                      color: selectedCategory == 'Десерты'
                          ? Colors.white
                          : Colors.white.withOpacity(0.6),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
