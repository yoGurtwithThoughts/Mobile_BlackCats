import 'package:http/http.dart' as http;
import 'dart:convert';

class EmailService {
  // Получи эти данные в личном кабинете EmailJS
  static const String serviceId = 'service_07vahcg';
  static const String templateId = 'ut72mZx3YCZf7NT';
  static const String publicKey = 'jmbjdBT3SpJoGbIOM';

  Future<void> sendBookingConfirmation({
    required String name,
    required String date,
    required String time,
    required String email,
    required String bookingCode,
    required int tableNumber,
  }) async {
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': publicKey,
        'template_params': {
          'name': name,
          'date': date,
          'time': time,
          'booking_code': bookingCode,
          'table_number': tableNumber.toString(),
          'email': email,
        }
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Ошибка отправки email: ${response.body}');
    }
  }
}