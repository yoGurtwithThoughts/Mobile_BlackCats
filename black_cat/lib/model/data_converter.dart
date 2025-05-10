import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DateTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String value = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    if (value.length > 8) {
      value = value.substring(0, 8); 
    }

    final StringBuffer buffer = StringBuffer();

    for (int i = 0; i < value.length; i++) {
      buffer.write(value[i]);

      if (i == 1 || i == 3) {
        buffer.write('.');
      }
    }

    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: buffer.length),
    );
  }
}
class TimeTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String value = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    if (value.length > 4) {
      value = value.substring(0, 4);
    }

    final StringBuffer buffer = StringBuffer();

    for (int i = 0; i < value.length; i++) {
      buffer.write(value[i]);
      if (i == 1) {
        buffer.write(':');
      }
    }

    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: buffer.length),
    );
  }
}

// Формат телефона: +7 (999) 999-99-99
class PhoneTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    // Чистим от всего, кроме цифр
    String digitsOnly = newValue.text.replaceAll(RegExp(r'[^\d]'), '');

    // Если пусто — возвращаем пустой результат
    if (digitsOnly.isEmpty) {
      return TextEditingValue();
    }

    // Добавляем +7, если его нет
    if (!digitsOnly.startsWith('7') && !digitsOnly.startsWith('8')) {
      digitsOnly = '7$digitsOnly';
    } else if (digitsOnly.startsWith('8')) {
      digitsOnly = '7${digitsOnly.substring(1)}';
    }

    // Ограничиваем до 11 символов (включая +7)
    if (digitsOnly.length > 11) {
      digitsOnly = digitsOnly.substring(0, 11);
    }

    // Формируем строку по маске: +7 (999) 999-99-99
    final StringBuffer buffer = StringBuffer('+7 ');

    // Группы
    int firstGroupEnd = 4; // после +7 идёт (XXX)
    if (digitsOnly.length >= firstGroupEnd) {
      buffer.write('(' + digitsOnly.substring(1, 4) + ') ');
    } else {
      buffer.write('(' + digitsOnly.substring(1));
      return TextEditingValue(text: buffer.toString());
    }

    int secondGroupEnd = 7; // следующие три цифры
    if (digitsOnly.length >= secondGroupEnd) {
      buffer.write(digitsOnly.substring(4, 7) + '-');
    } else if (digitsOnly.length > 4) {
      buffer.write(digitsOnly.substring(4));
      return TextEditingValue(text: buffer.toString());
    }

    int thirdGroupEnd = 9; // ещё две цифры
    if (digitsOnly.length >= thirdGroupEnd) {
      buffer.write(digitsOnly.substring(7, 9) + '-');
    } else if (digitsOnly.length > 7) {
      buffer.write(digitsOnly.substring(7));
      return TextEditingValue(text: buffer.toString());
    }

    if (digitsOnly.length > 9) {
      buffer.write(digitsOnly.substring(9));
    }

    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: buffer.length),
    );
  }
}

// Только буквы (для имени)
class NameTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final RegExp regex = RegExp(r'^[а-яА-Яa-zA-Z\s]*$');
    if (regex.hasMatch(newValue.text)) {
      return newValue;
    }
    return oldValue;
  }
}