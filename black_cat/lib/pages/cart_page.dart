import 'package:black_cat/service/calculated.dart';
import 'package:black_cat/model/cart-widget.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  final List<Product> cart;

  const CartPage({super.key, required this.cart});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  String phone = '';
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color.fromRGBO(16, 7, 4, 1),
      body: widget.cart.isEmpty
          ? Center(
              child: Text(
                'Корзина пуста',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: widget.cart.length + 1, // +1 для итоговой кнопки
              itemBuilder: (context, index) {
                if (index < widget.cart.length) {
                  // Карточки товаров
                  final item = widget.cart[index];
                  return Dismissible(
                    key: Key(item.name), // Используем имя товара как уникальный ключ
                    direction: DismissDirection.endToStart, // Только свайп вправо
                    onDismissed: (direction) {
                      // Удаляем товар из корзины
                      setState(() {
                        widget.cart.removeAt(index);
                      });

                      // Показываем snackbar с уведомлением
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${item.name} удален из корзины'),
                          behavior: SnackBarBehavior.floating, // Ставим уведомление поверх
                          margin: EdgeInsets.only(
                              bottom: kBottomNavigationBarHeight + 10, // Отступ снизу для отображения над BottomNavigationBar
                              left: 16,
                              right: 16),
                          backgroundColor: Colors.green,
                        ),
                      );
                    },
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      child: Icon(Icons.delete, color: Colors.white),
                    ),
                    child: ListTile(
                      leading: SizedBox(
                        width: 60,
                        child: item.image,
                      ),
                      title: Text(item.name, style: TextStyle(color: Colors.white)),
                      subtitle: Text(item.price, style: TextStyle(color: Colors.green)),
                    ),
                  );
                } else {
                  // Последняя ячейка — форма для ввода номера и кнопка оплаты
                  int total = CartCalculator.calculateTotal(widget.cart); // Используем метод из нашего нового файла
                  return Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        // Поле для ввода номера телефона
                        TextField(
                          controller: phoneController,
                          autofocus: true,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[700],
                            hintText: 'Введите номер телефона',
                            hintStyle: TextStyle(color: Colors.white60),
                            errorText: _validatePhoneNumber(phoneController.text),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          ),
                        ),
                        SizedBox(height: 20),
                        // Кнопка оплаты
                        ElevatedButton.icon(
                          onPressed: _validatePhoneNumber(phoneController.text) == null
                              ? () async {
                                  // Переход к оплате
                                  final phone = phoneController.text;
                                  final orderId = 'ORDER-${DateTime.now().millisecondsSinceEpoch}';
                                  _showOrderConfirmedDialog(context, orderId, phone);
                                }
                              : null, // Если валидация не прошла, кнопка будет неактивной
                          icon: Icon(Icons.payment),
                          label: Text('Оплатить (${CartCalculator.formatTotal(total)}) руб'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _validatePhoneNumber(phoneController.text) == null
                                ? Colors.green
                                : Colors.grey, // Кнопка зеленая, если введен правильный номер
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(vertical: 16),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
    );
  }

  // Функция для валидации телефона
  String? _validatePhoneNumber(String value) {
    final regex = RegExp(r'^\+7\d{10}$');
    if (value.isEmpty) {
      return 'Введите номер телефона';
    } else if (!regex.hasMatch(value)) {
      return 'Номер должен быть в формате: +7XXXXXXXXXX';
    }
    return null;
  }

  void _showOrderConfirmedDialog(BuildContext context, String orderId, String phone) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Заказ оформлен!', style: TextStyle(color: Colors.green)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Номер заказа: $orderId'),
            SizedBox(height: 10),
            Text('Данные отправлены на:\n$phone'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: Navigator.of(context).pop,
            child: Text('OK'),
          )
        ],
      ),
    );
  }
}
