import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  final String message;

  const EmptyState({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          Icon(Icons.article_outlined, size: 48, color: Colors.grey.shade300),
          const SizedBox(height: 8),
          Text(
            message,
            style: TextStyle(color: Colors.grey.shade500, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
