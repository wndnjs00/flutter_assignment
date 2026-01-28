import 'package:flutter/material.dart';
import 'package:flutter_assignment/domain/entities/board/board.dart';

class BoardDetailContent extends StatelessWidget {
  final String content;

  const BoardDetailContent({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey.shade200,
          width: 1,
        ),
      ),
      width: double.infinity,
      child: Text(
        content,
        style: const TextStyle(
          fontSize: 15,
          height: 1.7,
          color: Colors.black87,
        ),
      ),
    );
  }
}
