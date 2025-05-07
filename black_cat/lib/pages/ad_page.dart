
import 'package:black_cat/model/cart-widget.dart';
import 'package:black_cat/pages/booking-page.dart';
import 'package:black_cat/pages/store_page.dart';
import 'package:black_cat/widgets/button_widget.dart';
import 'package:black_cat/widgets/styletxt.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

class AdPage extends StatefulWidget {
  const AdPage({super.key});

  @override
  State<AdPage> createState() => _AdPageState();
}

class _AdPageState extends State<AdPage> {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(16, 7, 4, 1),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top:15),
            child: Image.asset('assets/images/logo.png',
            height: 65),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 450),
            child: Positioned.fill(
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity(),
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(
                      0.5,
                    ), // Темный полупрозрачный фильтр
                    BlendMode.darken,
                  ),
                  child: Image.asset(
                    'assets/images/HERO.png',
                    fit: BoxFit.fill,
                    alignment: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 105),
                        SvgPicture.asset(
                          'assets/images/Black cat.svg',
                          height: 75,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Text(
                            'В каждом глотке — уют и вдохновение!',
                            style: TextStylesMain.apptxt,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 30),
                        GradientBorderButton(
                          text: 'Купить',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => StorePage(
                                  onAddToCart: (Product product) {
                                    // Тут добавляется товар в корзину
                                    // Этот код должен быть в родительском виджете (например, HomeScreen)
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 25),
                        GradientBorderButton(
                          text: 'Забронировать',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BookingPage(),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 100), // Дополнительный отступ вниз
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
