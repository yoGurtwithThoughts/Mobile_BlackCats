import 'package:black_cat/model/data_converter.dart';
import 'package:black_cat/model/generated_nuber.dart' as BookingGenerator;
import 'package:black_cat/model/list-product.dart';
import 'package:black_cat/pages/home-screen.dart';
import 'package:black_cat/pages/succes.dart';
import 'package:black_cat/service/email_service.dart';
import 'package:black_cat/widgets/button_widget.dart';
import 'package:black_cat/widgets/custom_text_field.dart';
import 'package:black_cat/widgets/styletxt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final Set<int> usedTables = {};
  final EmailService _emailService = EmailService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset('assets/images/back.png', fit: BoxFit.fill),
          ),

          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Form( // <<<<< ВОТ ТУТ ДОБАВЛЕНО
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Для продолжения заказа\nзабронируйте столик.',
                            style: TextStylesMain.carttxt,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 35),

                          CustomTextField(
                            hintText: 'Дата',
                            controller: dateController,
                            icon: SvgPicture.asset('assets/icons/calendar.svg'),
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || !RegExp(r'^\d{2}\.\d{2}\.\d{4}$').hasMatch(value)) {
                                return 'Введите дату в формате ДД.ММ.ГГГГ';
                              }
                              return null;
                            },
                            inputFormatters: [
                              DateTextInputFormatter(),
                              LengthLimitingTextInputFormatter(10),
                            ],
                          ),

                          const SizedBox(height: 15),

                          CustomTextField(
                            hintText: 'Время',
                            controller: timeController,
                            icon: SvgPicture.asset('assets/icons/clock.svg'),
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || !RegExp(r'^\d{2}:\d{2}$').hasMatch(value)) {
                                return 'Введите время в формате ЧЧ:ММ';
                              }
                              return null;
                            },
                            inputFormatters: [
                              TimeTextInputFormatter(),
                              LengthLimitingTextInputFormatter(5),
                            ],
                          ),

                          const SizedBox(height: 15),

                          CustomTextField(
                            hintText: 'Ваше имя',
                            controller: nameController,
                            icon: SvgPicture.asset('assets/icons/person.svg'),
                            keyboardType: TextInputType.name,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Введите имя';
                              }
                              return null;
                            },
                            inputFormatters: [
                              NameTextInputFormatter(),
                              LengthLimitingTextInputFormatter(30),
                            ],
                          ),

                          const SizedBox(height: 15),

                          CustomTextField(
                            hintText: 'Ваш номер телефона',
                            controller: phoneController,
                            icon: SvgPicture.asset('assets/icons/phone.svg'),
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Введите номер телефона';
                              }

                              final digitsOnly = value.replaceAll(RegExp(r'[^\d]'), '');
                              if (digitsOnly.length != 11 || !digitsOnly.startsWith('7')) {
                                return 'Введите корректный номер';
                              }

                              return null;
                            },
                            inputFormatters: [
                              PhoneTextInputFormatter(),
                              LengthLimitingTextInputFormatter(18),
                            ],
                          ),

                          const SizedBox(height: 15),

                          CustomTextField(
                            hintText: 'Ваша почта',
                            controller: emailController,
                            icon: SvgPicture.asset('assets/icons/mail.svg'),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || !RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(value)) {
                                return 'Введите корректную почту';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),

                      GradientBorderButton(
                        text: 'Забронировать',
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            final String bookingCode = BookingGenerator.generateBookingCode();
                            final int tableNumber = BookingGenerator.generateTableNumber(usedTables);
                            usedTables.add(tableNumber);

                            showBookingSuccessDialog(
                              context: context,
                              bookingCode: bookingCode,
                              tableNumber: tableNumber,
                              onPop: () {
                                cart.clear();
                                setState(() {});
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => const HomeScreen(),
                                  ),
                                );
                              },
                            );
                          }
                        },
                      ),

                      SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
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
}
