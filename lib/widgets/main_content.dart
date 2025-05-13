import 'package:flutter/material.dart';
import 'package:black_cat/widgets/button_widget.dart';
import 'package:black_cat/widgets/styletxt.dart';
import 'package:svg_flutter/svg_flutter.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:black_cat/pages/store_page.dart';
import 'package:black_cat/pages/booking-page.dart';

class MainContent extends StatelessWidget {
  const MainContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          // Основной контент
          AnimationLimiter(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: AnimationConfiguration.toStaggeredList(
                  duration: const Duration(milliseconds: 600),
                  childAnimationBuilder: (widget) => SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(child: widget),
                  ),
                  children: [
                    const SizedBox(height: 100), // Отступ для фиксированного лого
                    const _TitleSection(),
                    const SizedBox(height: 30),
                    _buildButtons(context),
                    const Spacer(),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
          
          // Фиксированное лого сверху слева
          const Positioned(
            top: 25,
            left: 15,
            child: _Logo(),
          ),
        ],
      ),
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Column(
      children: [
        GradientBorderButton(
          text: 'Купить',
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => StorePage(onAddToCart: (product) {}),
            ),
          ),
        ),
        const SizedBox(height: 25),
        GradientBorderButton(
          text: 'Забронировать',
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const BookingPage()),
          ),
        ),
      ],
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    return const Image(
      image: AssetImage('assets/images/logo.png'),
      height: 75,
      width: 75, // Фиксированная ширина для сохранения пропорций
    );
  }
}

class _TitleSection extends StatelessWidget {
  const _TitleSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SvgPicture.asset(
            'assets/images/Black cat.svg',
            height: 75,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 16),
          const Text(
            'В каждом глотке — уют и вдохновение!',
            style: TextStylesMain.apptxt,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
