import 'package:black_cat/widgets/button_widget.dart';
import 'package:black_cat/widgets/styletxt.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ReviewForm extends StatefulWidget {
  ReviewForm({super.key});

  @override
  State<ReviewForm> createState() => _ReviewFormState();
}

class _ReviewFormState extends State<ReviewForm> {
  int rating = 4;
  final TextEditingController _reviewController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _roleController = TextEditingController();
  File? _avatarImage;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _nameController.text = 'Ваше имя';
    _roleController.text = 'Профессия';

    // Добавляем слушатели для автоматической очистки
    _nameController.addListener(_handleNameFocus);
    _roleController.addListener(_handleRoleFocus);
  }

  void _handleNameFocus() {
    if (_nameController.text == 'Ваше имя') {
      _nameController.selection = TextSelection.collapsed(offset: 0);
    }
  }

  void _handleRoleFocus() {
    if (_roleController.text == 'Профессия') {
      _roleController.selection = TextSelection.collapsed(offset: 0);
    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _avatarImage = File(pickedFile.path);
      });
    }
  }

  Widget _buildAvatar() {
    return GestureDetector(
      onTap: _pickImage,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: const LinearGradient(
            colors: [
              Color(0xFFE0A872),
              Color(0xFFF8E4BE),
              Color(0xFFFFF3E0),
              Color(0xFFF8E4BE),
              Color(0xFFE0A872),
            ],
            stops: [0.0, 0.3, 0.5, 0.7, 1.0],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: CircleAvatar(
          radius: 40,
          backgroundColor: Colors.transparent,
          backgroundImage:
              _avatarImage != null
                  ? FileImage(_avatarImage!)
                  : const AssetImage('assets/images/pers.png') as ImageProvider,
        ),
      ),
    );
  }

  Widget _buildStar(int index) {
    return IconButton(
      icon: ShaderMask(
        shaderCallback: (Rect bounds) {
          return const LinearGradient(
            colors: [Color(0xFFE0A872), Color(0xFFF8E4BE)],
          ).createShader(bounds);
        },
        child: Icon(
          index < rating ? Icons.star : Icons.star_border,
          color: Colors.white,
          size: 32,
        ),
      ),
      onPressed: () {
        setState(() {
          rating = index + 1;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets.add(const EdgeInsets.all(24)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildAvatar(),
          const SizedBox(height: 12),

          // Поле имени с автоматической очисткой
          TextField(
            controller: _nameController,
            style: TextStylesMain.menutxt,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: 'Введите имя',
              hintStyle: TextStylesMain.hinttxt,
              border: InputBorder.none,
              contentPadding: EdgeInsets.zero,
            ),
            onTap: () {
              if (_nameController.text == 'Ваше имя') {
                setState(() {
                  _nameController.clear();
                });
              }
            },
          ),

          // Поле профессии с автоматической очисткой
          TextField(
            controller: _roleController,
            style: TextStylesMain.menutxt,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: 'Введите роль',
              hintStyle: TextStylesMain.hinttxt,
              border: InputBorder.none,
              contentPadding: EdgeInsets.zero,
            ),
            onTap: () {
              if (_roleController.text == 'Профессия') {
                setState(() {
                  _roleController.clear();
                });
              }
            },
          ),

          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) => _buildStar(index)),
          ),

          const SizedBox(height: 12),
          TextField(
            controller: _reviewController,
            maxLines: 4,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Напишите свой отзыв...',
              hintStyle: TextStylesMain.hinttxt,
              filled: true,
              fillColor: Color.fromRGBO(63, 36, 21, 0.516),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
            ),
          ),

          const SizedBox(height: 16),
          GradientBorderButton(
            onPressed: () {
              // Собираем данные отзыва
              final reviewData = {
                'name':
                    _nameController.text.isEmpty
                        ? 'Ваше имя'
                        : _nameController.text,
                'role':
                    _roleController.text.isEmpty
                        ? 'Профессия'
                        : _roleController.text,
                'rating': rating,
                'review': _reviewController.text,
                'avatar': _avatarImage?.path,
              };

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Ваш отзыв направлен на модерацию',
                    style: TextStylesMain.apptxt,
                  ),
                  backgroundColor: Color.fromRGBO(107, 63, 51, 0.7),
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  duration: Duration(seconds: 2),
                  margin: EdgeInsets.only(bottom: 90, left: 20, right: 20),
                  elevation: 10,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                ),
              );
              Future.delayed(Duration(seconds: 1), () {
                Navigator.pop(context);
              });
            },
            text: 'Отправить',
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nameController.removeListener(_handleNameFocus);
    _roleController.removeListener(_handleRoleFocus);
    _reviewController.dispose();
    _nameController.dispose();
    _roleController.dispose();
    super.dispose();
  }
}
