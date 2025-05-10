import 'package:black_cat/widgets/styletxt.dart';
import 'package:flutter/material.dart';

Future<void> showBookingSuccessDialog({
  required BuildContext context,
  required String bookingCode,
  required int tableNumber,
  VoidCallback? onPop,
}) async {
  await showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) => AlertDialog(
      backgroundColor: Color.fromRGBO(41, 22, 16, 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
           Image.asset('assets/images/logo.png',
           height: 65,),
            SizedBox(height: 20),
            Text(
              'Успешно!\nДанные направлены на вашу почту',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              'Номер брони: $bookingCode\nСтолик №$tableNumber',
              style: TextStyle(color: Colors.white70, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // закрыть диалог
                if (onPop != null) {
                  onPop(); // выполнить действия после закрытия
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                shape: StadiumBorder(),
                side: BorderSide(color: Color.fromRGBO(224, 168, 114, 1), width: 1),
              ),
              child: Text('Закрыть',
              style: TextStylesMain.hinttxt,),
            )
          ],
        ),
      ),
    ),
  );
}