import 'package:flutter/material.dart';
import '../../../../core/utils/validators.dart';

class ContentTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool isLoading;

  const ContentTextField({
    super.key,
    required this.controller,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: '내용',
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
        alignLabelWithHint: true,
      ),
      maxLines: 10,
      validator: Validators.validateContent,
      enabled: !isLoading,
    );
  }
}
