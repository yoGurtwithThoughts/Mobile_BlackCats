import 'package:black_cat/pages/home-screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _shineAnimation;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _shineAnimation = Tween<double>(
      begin: -1,
      end: 2,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward();
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(17, 3, 0, 0.74),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Круглая картинка (логотип)
            Container(
              width: 200, // Размер контейнера
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle, // Круглая форма
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/logo.png',
                  ), // Путь к изображению
                  fit: BoxFit.cover, // Растягиваем изображение
                ),
              ),
            ),

            // Область для блика (ограничиваем кругом)
            ClipOval(
              child: Container(
                width: 200,
                height: 200,
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(
                        0, // Горизонтальное положение (посередине)
                        _shineAnimation.value * 100, // Вертикальное движение
                      ),
                      child: Opacity(
                        opacity: 0.8, // Прозрачность блика
                        child: Container(
                          width: 200, // Ширина блика
                          height: 50, // Высота блика
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.white.withOpacity(0.6), // Белый блик
                                Colors.transparent, // Постепенное исчезновение
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
