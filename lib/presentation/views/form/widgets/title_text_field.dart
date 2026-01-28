import 'package:flutter/material.dart';
import '../../../../core/utils/validators.dart';

class TitleTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool isLoading;

  const TitleTextField({
    super.key,
    required this.controller,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: '제목',
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        prefixIcon: const Icon(Icons.title),
      ),
      validator: Validators.validateTitle,
      enabled: !isLoading,
      maxLength: 100,
    );
  }
}
