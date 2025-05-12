import 'package:black_cat/model/info_banner.dart';
import 'package:black_cat/model/list_popup.dart';
import 'package:black_cat/widgets/content_pop_message.dart';
import 'package:black_cat/widgets/rate_widget.dart';
import 'package:black_cat/widgets/styletxt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:svg_flutter/svg_flutter.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/images/back.png', fit: BoxFit.cover),
          ),
          SingleChildScrollView(
            child: AnimationLimiter(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.007,
                  vertical: screenHeight * 0.055,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: AnimationConfiguration.toStaggeredList(
                    duration: const Duration(milliseconds: 600),
                    childAnimationBuilder:
                        (widget) => SlideAnimation(
                          verticalOffset: 50.0,
                          child: FadeInAnimation(child: widget),
                        ),
                    children: [
                      const Text(
                        'Наше сообщество',
                        style: TextStylesMain.infotxt,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/bcat.png',
                            height: screenHeight * 0.25,
                            fit: BoxFit.fill,
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
                      SizedBox(height: screenHeight * 0.085),
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
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
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
                                children:
                                    rows
                                        .map(
                                          (data) => Padding(
                                            padding: EdgeInsets.only(
                                              bottom: screenHeight * 0.015,
                                            ),
                                            child: _infoRow(
                                              context,
                                              data,
                                              iconSize: screenWidth * 0.1,
                                            ), // ← context передан
                                          ),
                                        )
                                        .toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.085),
                      const Text(
                        'Оценки наших гостей',
                        style: TextStylesMain.comtxt,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: screenHeight * 0.025),
                      Center(
                        child: SingleChildScrollView(
                          scrollDirection:
                              Axis.horizontal, // Горизонтальная прокрутка
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              buildReviewCard(
                                'assets/images/daria.png', // Изображение пользователя
                                'Дарья', // Имя
                                4.5, // Оценка
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
            ),
          ),
        ],
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
        // Показываем попап с данными из InfoRowData
        showCustomPopup(
          context,
          data.popupTitle,
          data.popupDescription,
          imageWidget:
              data.popupImage, // Передаем popupImage для отображения в попапе
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Показываем картинку для виджета (widgetIcon)
          SizedBox(
            width: iconSize,
            height: iconSize,
            child:
                data.widgetIcon, // Используем widgetIcon для отображения рядом с текстом
          ),
          const SizedBox(width: 12),
          // Показываем текст, используя Flexible, чтобы текст не выходил за пределы
          Flexible(child: Text(data.title, style: TextStylesMain.apptxt)),
        ],
      ),
    );
  }
}
