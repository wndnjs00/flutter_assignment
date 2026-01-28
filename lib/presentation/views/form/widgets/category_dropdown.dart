import 'package:flutter/material.dart';
import '../../../../core/utils/validators.dart';

class CategoryDropdown extends StatelessWidget {
  final String? selectedCategory;
  final Map<String, String> categories;
  final Function(String?) onChanged;
  final bool isLoading;

  const CategoryDropdown({
    super.key,
    required this.selectedCategory,
    required this.categories,
    required this.onChanged,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedCategory,
      decoration: InputDecoration(
        labelText: '카테고리',
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
        prefixIcon: const Icon(Icons.category),
      ),
      items: categories.entries.map((entry) {
        return DropdownMenuItem(
          value: entry.key,
          child: Text(entry.value),
        );
      }).toList(),
      onChanged: isLoading ? null : onChanged,
      validator: Validators.validateCategory,
    );
  }
}
