import 'package:flutter/material.dart';
import 'package:black_cat/service/calculated.dart';
import 'package:black_cat/model/cart-widget.dart';

class CartCheckout extends StatefulWidget {
  final List<Product> cart;

  const CartCheckout({super.key, required this.cart});

  @override
  State<CartCheckout> createState() => _CartCheckoutState();
}

class _CartCheckoutState extends State<CartCheckout> {
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    int total = CartCalculator.calculateTotal(widget.cart);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
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
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
            onChanged: (_) => setState(() {}),
          ),
          SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: _validatePhoneNumber(phoneController.text) == null
                ? () {
                    final phone = phoneController.text;
                    final orderId =
                        'ORDER-\${DateTime.now().millisecondsSinceEpoch}';
                    _showOrderConfirmedDialog(context, orderId, phone);
                  }
                : null,
            icon: Icon(Icons.payment),
            label: Text(
                'Оплатить (\${CartCalculator.formatTotal(total)}) руб'),
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  _validatePhoneNumber(phoneController.text) == null
                      ? Colors.green
                      : Colors.grey,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 16),
            ),
          ),
        ],
      ),
    );
  }

  String? _validatePhoneNumber(String value) {
    final regex = RegExp(r'^\+7\d{10}\$');
    if (value.isEmpty) {
      return 'Введите номер телефона';
    } else if (!regex.hasMatch(value)) {
      return 'Номер должен быть в формате: +7XXXXXXXXXX';
    }
    return null;
  }

  void _showOrderConfirmedDialog(
      BuildContext context, String orderId, String phone) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Заказ оформлен!', style: TextStyle(color: Colors.green)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Номер заказа: \$orderId'),
            SizedBox(height: 10),
            Text('Данные отправлены на:\n\$phone'),
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