import 'package:flutter/material.dart';
import 'package:flutter_assignment/presentation/providers/board_selectors.dart';
import 'package:flutter_assignment/presentation/viewmodels/board_detail_viewmodel.dart';
import 'package:flutter_assignment/presentation/views/detail/widgets/board_detail_header.dart';
import 'package:flutter_assignment/presentation/views/detail/widgets/board_detail_content.dart';
import 'package:flutter_assignment/presentation/views/detail/widgets/board_detail_image.dart';
import 'package:flutter_assignment/presentation/views/detail/widgets/error_state_widget.dart';
import 'package:flutter_assignment/presentation/views/detail/widgets/empty_state_widget.dart';
import 'package:flutter_assignment/presentation/views/detail/widgets/delete_board_dialog.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class BoardDetailScreen extends ConsumerStatefulWidget {
  final int boardId;

  const BoardDetailScreen({
    super.key,
    required this.boardId,
  });

  @override
  ConsumerState<BoardDetailScreen> createState() => _BoardDetailScreenState();
}

class _BoardDetailScreenState extends ConsumerState<BoardDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final boardState = ref.watch(boardDetailViewModelProvider(widget.boardId));
    final isMyPost = ref.watch(isMyPostSelectorProvider(widget.boardId));

    ref.listen<BoardDetailState>(
      boardDetailViewModelProvider(widget.boardId),
      (previous, next) {
        if (previous?.deleteSuccess != next.deleteSuccess && next.deleteSuccess) {
          ref.read(boardDetailViewModelProvider(widget.boardId).notifier).clearDeleteSuccess();
          
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('게시글이 삭제되었습니다'),
                backgroundColor: Colors.green.shade600,
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            );
            context.go('/');
          }
        }
        
        if (previous?.error != next.error && 
            next.error != null && 
            !next.isDeleting && 
            !next.deleteSuccess) {
          ref.read(boardDetailViewModelProvider(widget.boardId).notifier).clearError();
          
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(next.error!),
                backgroundColor: Colors.red.shade600,
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            );
          }
        }
      },
    );

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          '게시글 상세',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => context.go('/'),
        ),
        actions: [
          if (boardState.board != null && isMyPost) ...[
            IconButton(
              icon: const Icon(Icons.edit_outlined, color: Colors.black87),
              tooltip: '수정',
              onPressed: () {
                context.go('/board/${widget.boardId}/edit');
              },
            ),
            IconButton(
              icon: Icon(Icons.delete_outline, color: Colors.red.shade400),
              tooltip: '삭제',
              onPressed: boardState.isDeleting
                  ? null
                  : () => _showDeleteDialog(context),
            ),
          ],
        ],
      ),
      body: boardState.isLoading
          ? const Center(child: CircularProgressIndicator())
          : boardState.error != null && !boardState.isDeleting
          ? ErrorStateWidget(
              error: boardState.error!,
              onRetry: () {
                ref
                    .read(boardDetailViewModelProvider(widget.boardId).notifier)
                    .loadBoard();
              },
            )
          : boardState.board == null
          ? const EmptyStateWidget()
          : SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            BoardDetailHeader(board: boardState.board!),
            const SizedBox(height: 12),
            BoardDetailContent(content: boardState.board!.content),
            const SizedBox(height: 24),
            if (boardState.board!.imageUrl != null)
              BoardDetailImage(imageUrl: boardState.board!.imageUrl!),
            if (boardState.board!.imageUrl != null)
              const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  void _showDeleteDialog(BuildContext context) {
    showDialog<bool>(
      context: context,
      builder: (context) => const DeleteBoardDialog(),
    ).then((confirm) {
      if (confirm == true) {
        ref.read(boardDetailViewModelProvider(widget.boardId).notifier).deleteBoard();
      }
    });
  }
}