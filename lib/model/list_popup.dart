import 'package:black_cat/model/info_banner.dart';
import 'package:flutter/material.dart';

final List<InfoRowData> rows = [
  InfoRowData(
    widgetIcon: Image.asset('assets/images/bean.png'), // Используем Image.asset для иконки в строках
    popupImage: Image.asset('assets/images/roast.png'), // Используем Image.asset для попапа
    title: 'Обжарка зерен',
    popupTitle: 'Обжарка зерен',
    popupDescription: 'Зерна помещаются в обжарочную машину и нагреваются до высоких температур. При температуре около 196°C происходит треск, указывающий на начале выделения масел. После, при температуре около 225°C происходит второй треск, указывающий на более глубокую обжарку. Затем зерна охлаждаются, чтобы остановить процесс обжарки.',
  ),
  InfoRowData(
    widgetIcon: Image.asset('assets/images/pack.png'), // Используем Image.asset для иконки в строках
    popupImage: Image.asset('assets/images/history.png'), // Используем Image.asset для попапа
    title: 'История кофе',
    popupTitle: 'История кофе',
    popupDescription: 'Кофе берет начало в Эфиопии, где, согласно легенде, пастухи заметили, что козы становятся энергичными после поедания кофейных ягод. В XVI веке кофе попадает в Европу, где его сначала воспринимают с недоверием, но вскоре он завоевывает популярность.',
  ),
  InfoRowData(
    widgetIcon: Image.asset('assets/images/cup.png'), // Используем Image.asset для иконки в строках
    popupImage: Image.asset('assets/images/cups.png'), // Используем Image.asset для попапа
    title: 'Почему кофе бодрит?',
    popupTitle: 'Почему кофе бодрит?',
    popupDescription: 'Кофе бодрит благодаря  кофеину, который блокирует аденозиновые рецепторы в мозге. Аденозин — это вещество, вызывающее чувство усталости. Кофеин связывается с этими рецепторами и ощущение утомления уменьшается  и актив ность организма возрастает.',
  ),
  InfoRowData(
    widgetIcon: Image.asset('assets/images/beans 1.png'), // Используем Image.asset для иконки в строках
    popupImage: Image.asset('assets/images/varcoffe.png'), // Используем Image.asset для попапа
    title: 'Виды кофейных зерен',
    popupTitle: 'Виды кофейных зерен',
    popupDescription: 'Arabica- Обладает мягким, сладковатым вкусом с яркой кислотностью и фруктовыми нотами.  Robusta- Имеет крепкий, горький вкус с низкой кислотностью. Liberica -Обладает уникальным фруктовым вкусом с дымными нотами и необычной формой зерен. Excelsa -подвид либерики с сладким, фруктовым вкусом. ',
  ),
];