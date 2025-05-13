import 'package:black_cat/widgets/styletxt.dart';
import 'package:flutter/material.dart';
import 'package:black_cat/widgets/sale_banner.dart';

class SaleBannerPage extends StatelessWidget {
  const SaleBannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          
          const SizedBox(height: 40),
          const SizedBox(height: 20),
          _buildBanners(),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _buildBanners() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          'assets/images/sale1.png',
          fit: BoxFit.contain,
          height: 350,
          width: double.infinity,
        ),
        const SizedBox(height: 15),
        const Center(child: SaleBanner()),
      ],
    );
  }
}


