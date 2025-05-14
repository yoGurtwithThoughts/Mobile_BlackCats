import 'package:black_cat/model/info_banner.dart';
import 'package:black_cat/model/list_popup.dart';
import 'package:black_cat/widgets/content_pop_message.dart';
import 'package:black_cat/widgets/rate_widget.dart';
import 'package:black_cat/widgets/styletxt.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  final List<bool> _visible = List.generate(5, (_) => false);
  bool _isBackgroundLoaded = false;  

  @override
  void initState() {
    super.initState();
    _startAnimations();
  }

  void _startAnimations() async {
    await Future.delayed(const Duration(milliseconds: 500)); // Задержка перед анимацией
    setState(() {
      _isBackgroundLoaded = true;  // Фон загружен
    });

    for (int i = 0; i < _visible.length; i++) {
      await Future.delayed(const Duration(milliseconds: 400)); // Задержка для анимации каждого элемента
      if (mounted) {
        setState(() => _visible[i] = true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Фиксированный фон
       Positioned.fill(
            child: Image.asset(
              'assets/images/back.png',
              fit: BoxFit.cover,
            ),
          ),
          // Основной контент
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.007,
                vertical: screenHeight * 0.055,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _animatedBlock(
                    index: 0,
                    child: const Text(
                      'Наше сообщество',
                      style: TextStylesMain.infotxt,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  _animatedBlock(
                    index: 1,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/bcat.png',
                          height: screenHeight * 0.25,
                          fit: BoxFit.fill,
                          cacheHeight: 400,
                        ),
                        SizedBox(width: screenWidth * 0.04),
                        Expanded(
                          child: Column(
                            children: [
                              SizedBox(height: screenHeight * 0.07),
                              Text(
                                'В городе Новомосковск с 2012 года существует уютная кофейня “Черный кот”. '
                                'Она была основана группой друзей, которые мечтали создать место, где люди могли бы '
                                'собираться, общаться и наслаждаться ароматным кофе. Они выбрали название в честь '
                                'черного кота, который часто бродил по окрестностям и стал символом удачи для местных '
                                'жителей.',
                                style: TextStylesMain.cardtxt,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.085),
                  _animatedBlock(
                    index: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text('Это интересно', style: TextStylesMain.comtxt),
                        SizedBox(height: screenHeight * 0.025),
                        SizedBox(
                          width: double.infinity,
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: FittedBox(
                                  fit: BoxFit.fill,
                                  child: SvgPicture.asset(
                                    'assets/images/backbanner.svg',
                                    width: screenWidth,
                                    height: screenHeight,
                                  ),
                                ),
                              ),
                              Positioned.fill(
                                child: Container(
                                  color: Colors.black.withOpacity(0.25),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.05,
                                  vertical: screenHeight * 0.03,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: rows
                                      .map(
                                        (data) => Padding(
                                          padding: EdgeInsets.only(
                                            bottom: screenHeight * 0.015,
                                          ),
                                          child: _infoRow(
                                            context,
                                            data,
                                            iconSize: screenWidth * 0.1,
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.085),
                  _animatedBlock(
                    index: 3,
                    child: const Text(
                      'Оценки наших гостей',
                      style: TextStylesMain.comtxt,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.025),
                  _animatedBlock(
                    index: 4,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          buildReviewCard(
                            'assets/images/daria.png',
                            'Дарья',
                            4.5,
                          ),
                          SizedBox(width: screenWidth * 0.03),
                          buildReviewCard(
                            'assets/images/nik.png',
                            'Алексей',
                            4.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _animatedBlock({required int index, required Widget child}) {
    return AnimatedSlide(
      offset: _visible[index] ? Offset.zero : const Offset(0, 0.1),
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOutCubic,
      child: AnimatedOpacity(
        opacity: _visible[index] ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeOutCubic,
        child: child,
      ),
    );
  }

  Widget _infoRow(
    BuildContext context,
    InfoRowData data, {
    required double iconSize,
  }) {
    return GestureDetector(
      onTap: () {
        showCustomPopup(
          context,
          data.popupTitle,
          data.popupDescription,
          imageWidget: data.popupImage,
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: iconSize,
            height: iconSize,
            child: data.widgetIcon,
          ),
          const SizedBox(width: 12),
          Flexible(child: Text(data.title, style: TextStylesMain.apptxt)),
        ],
      ),
    );
  }
}
