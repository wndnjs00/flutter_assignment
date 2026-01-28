import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../presentation/providers/board_selectors.dart';

class CategoryFilterChips extends ConsumerWidget {
  const CategoryFilterChips({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      color: Colors.white,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            _CategoryChip(value: 'ALL', label: '전체'),
            const SizedBox(width: 8),
            _CategoryChip(value: 'NOTICE', label: '공지'),
            const SizedBox(width: 8),
            _CategoryChip(value: 'FREE', label: '자유'),
            const SizedBox(width: 8),
            _CategoryChip(value: 'QNA', label: 'Q&A'),
            const SizedBox(width: 8),
            _CategoryChip(value: 'ETC', label: '기타'),
          ],
        ),
      ),
    );
  }
}

class _CategoryChip extends ConsumerWidget {
  final String value;
  final String label;

  const _CategoryChip({
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelected = ref.watch(boardCategoryFilterProvider) == value;
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        ref.read(boardCategoryFilterProvider.notifier).state = value;
      },
      backgroundColor: Colors.grey.shade100,
      selectedColor: Theme.of(context).primaryColor.withValues(alpha: 0.2),
      labelStyle: TextStyle(
        color: isSelected ? Theme.of(context).primaryColor : Colors.grey.shade700,
        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
        fontSize: 13,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: isSelected ? Theme.of(context).primaryColor : Colors.transparent,
          width: 1.5,
        ),
      ),
    );
  }
}
