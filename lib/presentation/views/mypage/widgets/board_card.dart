import 'package:flutter/material.dart';
import 'package:flutter_assignment/domain/entities/board/board_list_item.dart';
import 'package:flutter_assignment/presentation/providers/board_selectors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class BoardCard extends ConsumerWidget {
  final BoardListItem board;

  const BoardCard({
    super.key,
    required this.board,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () {
          context.go('/board/${board.id}');
        },
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      ref.watch(categoryNameSelectorProvider(board.category)),
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Icon(Icons.access_time, size: 14, color: Colors.grey.shade400),
                  const SizedBox(width: 4),
                  Text(
                    ref.watch(formattedDateSelectorProvider(board.createdAt)),
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                board.title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  height: 1.4,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
