import 'package:black_cat/model/cart-widget.dart';

class CartCalculator {
  // Метод для подсчета общей суммы в корзине
  static int calculateTotal(List<Product> cart) {
    int total = 0;
    for (var item in cart) {
      final priceNum = int.tryParse(item.price.replaceAll(RegExp(r'[^0-9]'), ''));
      if (priceNum != null) total += priceNum;
    }
    return total;
  }

  // Метод для форматирования суммы
  static String formatTotal(int total) {
    return total.toString();
  }
}