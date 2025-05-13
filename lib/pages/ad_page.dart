import 'package:black_cat/widgets/main_content.dart';
import 'package:black_cat/widgets/sale_banner_scroll.dart';
import 'package:flutter/material.dart';

class AdPage extends StatelessWidget {
  const AdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(16, 7, 4, 1),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return Stack(
      children: [
        // Фоновое изображение с затемнением
        _buildBackground(),
        
        // Основной контент с вертикальным скроллом
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const MainContent(),
              const SaleBannerPage(),
              const SizedBox(height: 100), // Дополнительное пространство внизу
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBackground() {
    return Align(
      alignment: Alignment.centerRight,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/b1.png',
            width: double.infinity,
            fit: BoxFit.cover,
            height: double.infinity,
          ),
          Container(
            color: Colors.black.withOpacity(0.65),
          ),
        ],
      ),
    );
  }
}