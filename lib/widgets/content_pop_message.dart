import 'package:black_cat/widgets/styletxt.dart';
import 'package:flutter/material.dart';

void showCustomPopup(
  BuildContext context,
  String title,
  String description, {
  Image? imageWidget,
}) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Stack(
        children: [
          Positioned(
            bottom: 30,
            left: 20,
            right: 20,
            child: Material(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromRGBO(153, 125, 108, 0.75),
              elevation: 10,
              child: Container(
                padding: const EdgeInsets.all(24),
                constraints: const BoxConstraints(
                  minHeight: 350,  // Увеличиваем минимальную высоту
                  maxHeight: 550,  // Увеличиваем максимальную высоту
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,  // Центрируем кнопку и текст
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: TextStylesMain.poptxttitle.copyWith(fontSize: 24),  // Увеличиваем размер шрифта
                            textAlign: TextAlign.center,
                          ),
                        ),
                        IconButton(
                          icon: Image.asset(
                            'assets/images/close.png',
                            width: 32, // Увеличиваем размер кнопки
                            height: 32, // Увеличиваем размер кнопки
                          ),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Используем SingleChildScrollView для прокрутки текста
                    SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxHeight: 200), // Ограничиваем высоту для текста
                        child: Text(
                          description,
                          style: TextStylesMain.poptxt,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    if (imageWidget != null)
                      Center(
                        child: SizedBox(
                          width: 150,  // Увеличиваем размер изображения
                          height: 150,  // Увеличиваем размер изображения
                          child: imageWidget,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}
