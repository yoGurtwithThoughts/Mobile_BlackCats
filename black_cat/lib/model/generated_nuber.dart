import 'dart:math';

String generateBookingCode() {
  final letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  final randomLetter = letters[Random().nextInt(letters.length)];
  final randomDigits = Random().nextInt(900) + 100; // от 100 до 999
  return '$randomLetter$randomDigits'; // Например: A123
}

int generateTableNumber(Set<int> usedTables) {
  final availableTables = List<int>.generate(10, (i) => i + 1); // от 1 до 10

  if (availableTables.isEmpty) {
    throw Exception('Нет доступных столиков');
  }

  return availableTables[Random().nextInt(availableTables.length)];
}