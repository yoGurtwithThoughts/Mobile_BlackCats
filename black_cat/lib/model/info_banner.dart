import 'package:flutter/material.dart';

class InfoRowData {
  final Image widgetIcon;  // Используем Image для иконки в строках
  final Image popupImage;  // Используем Image для иконки в попапе
  final String title;
  final String popupTitle;
  final String popupDescription;

  InfoRowData({
    required this.widgetIcon,
    required this.popupImage,
    required this.title,
    required this.popupTitle,
    required this.popupDescription,
  });
}