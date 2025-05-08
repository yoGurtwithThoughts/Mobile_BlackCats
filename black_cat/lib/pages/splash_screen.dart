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
            Container(
              width: 150, 
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle, 
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/logo.png',
                  ), 
                  fit: BoxFit.cover, 
                ),
              ),
            ),
            ClipOval(
              child: Container(
                width: 150,
                height: 150,
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(
                        0, 
                        _shineAnimation.value * 100, 
                      ),
                      child: Opacity(
                        opacity: 0.8, 
                        child: Container(
                          width: 200, 
                          height: 50, 
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.white.withOpacity(0.6),
                                Colors.transparent, 
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
