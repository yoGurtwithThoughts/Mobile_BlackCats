import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomDropdownMenu extends StatefulWidget {
  const CustomDropdownMenu({super.key});

  @override
  State<CustomDropdownMenu> createState() => _CustomDropdownMenuState();
}

class _CustomDropdownMenuState extends State<CustomDropdownMenu> {
  bool _isMenuOpen = false;

  final List<Map<String, dynamic>> options = [
    {'value': 'menu', 'label': 'Меню', 'icon': 'assets/icons/food.svg'},
    {'value': 'booking', 'label': 'Бронь', 'icon': 'assets/icons/calendar.svg'},
    {'value': 'blog', 'label': 'Блог', 'icon': 'assets/icons/video.svg'},
    {'value': 'contact', 'label': 'Контакты', 'icon': 'assets/icons/person.svg'},
  ];

  void _onItemSelected(String value) {
    print('Выбрано: $value');
    setState(() {
      _isMenuOpen = false; // Скрыть меню после выбора
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        // Кнопка с SVG (только иконка)
        InkWell(
          onTap: () {
            setState(() {
              _isMenuOpen = !_isMenuOpen;
            });
          },
          child: SvgPicture.asset(
            'assets/icons/menu.svg',
            height: 35,
            width: 35,
          ),
        ),

        // Выпадающее меню (показывается только если _isMenuOpen == true)
        if (_isMenuOpen)
          Positioned(
            top: 40, // Отступ от иконки вниз
            right: 0,
            child: Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(8),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 4),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(33, 33, 33, 1.0),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: options.map((item) {
                    return ListTile(
                      leading: SvgPicture.asset(
                        item['icon'],
                        height: 20,
                        colorFilter:
                            ColorFilter.mode(Colors.white, BlendMode.srcIn),
                      ),
                      title: Text(
                        item['label'],
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      onTap: () => _onItemSelected(item['value']),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
      ],
    );
  }
}