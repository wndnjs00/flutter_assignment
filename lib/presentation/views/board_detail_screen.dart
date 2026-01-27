import 'package:flutter/material.dart';
import 'package:flutter_assignment/data/datasources/local/local_storage_service.dart';
import 'package:flutter_assignment/presentation/viewmodels/auth_viewmodel.dart';
import 'package:flutter_assignment/presentation/viewmodels/board_detail_viewmodel.dart';
import 'package:flutter_assignment/presentation/viewmodels/board_list_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../core/constants/api_constants.dart';

final localStorageProvider = Provider((ref) => LocalStorageService());

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
  String _getCategoryName(String categoryKey, WidgetRef ref) {
    final categories = ref.read(boardListViewModelProvider).categories;
    return categories[categoryKey] ?? categoryKey;
  }

  String _formatDate(DateTime date) {
    return DateFormat('yyyy-MM-dd HH:mm').format(date);
  }

  bool _isMyPost() {
    final authState = ref.read(authViewModelProvider);
    final userEmail = authState.user?.email;

    if (userEmail == null) return false;

    return ref.read(localStorageProvider).isMyPost(userEmail, widget.boardId);
  }

  Future<void> _deleteBoard(BuildContext context, WidgetRef ref) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text(
          '게시글 삭제',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        content: const Text(
          '이 게시글을 삭제하시겠습니까?',
          style: TextStyle(fontSize: 14),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(
              '취소',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text(
              '삭제',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );

    if (confirm == true) {
      final success = await ref
          .read(boardDetailViewModelProvider(widget.boardId).notifier)
          .deleteBoard();

      if (context.mounted) {
        if (success) {
          final authState = ref.read(authViewModelProvider);
          final userEmail = authState.user?.email;

          if (userEmail != null) {
            // 로컬 저장소에서도 삭제
            await ref.read(localStorageProvider).removeMyPost(userEmail, widget.boardId);
          }

          ref.read(boardListViewModelProvider.notifier).loadBoards(refresh: true);

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
        } else {
          final error = ref.read(boardDetailViewModelProvider(widget.boardId)).error;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(error ?? '삭제에 실패했습니다'),
              backgroundColor: Colors.red.shade600,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final boardState = ref.watch(boardDetailViewModelProvider(widget.boardId));
    final isMyPost = _isMyPost();

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
              onPressed: () => _deleteBoard(context, ref),
            ),
          ],
        ],
      ),
      body: boardState.isLoading
          ? const Center(child: CircularProgressIndicator())
          : boardState.error != null
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 16),
            Text(
              boardState.error!,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: () {
                ref
                    .read(boardDetailViewModelProvider(widget.boardId).notifier)
                    .loadBoard();
              },
              icon: const Icon(Icons.refresh),
              label: const Text('다시 시도'),
            ),
          ],
        ),
      )
          : boardState.board == null
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.article_outlined,
              size: 64,
              color: Colors.grey.shade300,
            ),
            const SizedBox(height: 16),
            Text(
              '게시글을 찾을 수 없습니다',
              style: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 14,
              ),
            ),
          ],
        ),
      )
          : SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            // 제목 및 메타정보
            Container(
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          _getCategoryName(
                            boardState.board!.category,
                            ref,
                          ),
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade700,
                            letterSpacing: 0.3,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.access_time,
                        size: 14,
                        color: Colors.grey.shade400,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        _formatDate(boardState.board!.createdAt),
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    boardState.board!.title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      height: 1.4,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // 이미지 (스크롤 가능)
            if (boardState.board!.imageUrl != null)
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                height: 250,
                child: PageView(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        '${ApiConstants.baseUrl}${boardState.board!.imageUrl}',
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.grey.shade200,
                                width: 1,
                              ),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.broken_image_outlined,
                                size: 64,
                                color: Colors.grey.shade300,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

            if (boardState.board!.imageUrl != null)
              const SizedBox(height: 12),

            // 내용
            Container(
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
                boardState.board!.content,
                style: const TextStyle(
                  fontSize: 15,
                  height: 1.7,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}