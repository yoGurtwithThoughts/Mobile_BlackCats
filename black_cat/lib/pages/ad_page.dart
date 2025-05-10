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
      backgroundColor: const Color.fromRGBO(16, 7, 4, 1),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 0),
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/b1.png',
                    width: MediaQuery.of(context).size.width * 1,
                    fit: BoxFit.contain,
                    alignment: Alignment.bottomRight,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black.withOpacity(0.65), // затемнение
                  ),
                   Padding(
                     padding: const EdgeInsets.only(top: 25, left: 15),
                     child: Image.asset('assets/images/logo.png',
                     height: 75,),
                   ),
                ],
              ),
            ),
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: constraints.maxHeight),
                    child: IntrinsicHeight(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 105),
                          SvgPicture.asset(
                            'assets/images/Black cat.svg',
                            height: 75,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(height: 16),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24),
                            child: Text(
                              'В каждом глотке — уют и вдохновение!',
                              style: TextStylesMain.apptxt,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(height: 30),
                          GradientBorderButton(
                            text: 'Купить',
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => StorePage(
                                        onAddToCart: (Product product) {},
                                      ),
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 25),
                          GradientBorderButton(
                            text: 'Забронировать',
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const BookingPage(),
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 100),
                        ],
                      ),
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
