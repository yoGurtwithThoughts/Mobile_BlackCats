import 'package:black_cat/widgets/botom_bar_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BotomBarWidget extends StatefulWidget {
  final List<BottomBarItem> items; // Список элементов нижней панели
  final List<Widget> pages; // Список страниц

  const BotomBarWidget({super.key, required this.items, required this.pages});

  @override
  State<BotomBarWidget> createState() => _BotomBarWidgetState();
}

class _BotomBarWidgetState extends State<BotomBarWidget> {
  int selectedIndex = 0; // Индекс выбранной страницы (убрано подчеркивание)

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.pages[selectedIndex],
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            height: 75, // Увеличена высота нижней панели
            decoration: BoxDecoration(
              color: Color.fromRGBO(174, 141, 120, 0.25), // Полупрозрачный фон
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20), // Скругленные верхние углы
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2), // Легкая тень
                  blurRadius: 10,
                  offset: Offset(0, -5),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly, // Элементы ближе друг к другу
              children: List.generate(widget.items.length, (index) {
                final item = widget.items[index];
                final isActive = index == selectedIndex;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index; // Обновляем выбранный индекс
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // SVG-иконка
                      SvgPicture.asset(
                        item.iconPath,
                        width:
                            isActive
                                ? 40
                                : 30, // Больше и сильнее увеличиваются
                        height: isActive ? 40 : 30,
                        colorFilter: ColorFilter.mode(
                          isActive
                              ? Color.fromRGBO(
                                248,
                                228,
                                190,
                                1,
                              ) // Цвет активной иконки
                              : Color.fromRGBO(
                                248,
                                228,
                                190,
                                0.6,
                              ), // Цвет неактивной иконки
                          BlendMode.srcIn,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
