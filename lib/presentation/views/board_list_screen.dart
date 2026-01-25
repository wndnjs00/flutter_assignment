import 'package:flutter/material.dart';
import 'package:flutter_assignment/presentation/viewmodels/board_list_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class BoardListScreen extends ConsumerStatefulWidget {
  const BoardListScreen({super.key});

  @override
  ConsumerState<BoardListScreen> createState() => _BoardListScreenState();
}

class _BoardListScreenState extends ConsumerState<BoardListScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.9) {
      ref.read(boardListViewModelProvider.notifier).loadMoreBoards();
    }
  }

  Future<void> _refresh() async {
    await ref
        .refresh(boardListViewModelProvider.notifier)
        .loadBoards(refresh: true);
  }

  String _getCategoryName(String categoryKey) {
    final categories = ref.read(boardListViewModelProvider).categories;
    return categories[categoryKey] ?? categoryKey;
  }

  String _formatDate(DateTime date) {
    return DateFormat('yyyy-MM-dd HH:mm').format(date);
  }

  @override
  Widget build(BuildContext context) {
    final boardState = ref.watch(boardListViewModelProvider);

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: boardState.isLoading && boardState.boards.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : boardState.error != null && boardState.boards.isEmpty
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
                onPressed: _refresh,
                icon: const Icon(Icons.refresh),
                label: const Text('다시 시도'),
              ),
            ],
          ),
        )
            : boardState.boards.isEmpty
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
                '등록된 게시글이 없습니다',
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        )
            : ListView.separated(
          controller: _scrollController,
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          itemCount: boardState.boards.length +
              (boardState.isLoadingMore ? 1 : 0),
          separatorBuilder: (context, index) =>
          const SizedBox(height: 12),
          itemBuilder: (context, index) {
            if (index == boardState.boards.length) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: CircularProgressIndicator(),
                ),
              );
            }

            final board = boardState.boards[index];

            return Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              elevation: 0,
              child: InkWell(
                onTap: () {
                  context.go('/board/${board.id}');
                },
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade200,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(16),
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
                              borderRadius:
                              BorderRadius.circular(6),
                            ),
                            child: Text(
                              _getCategoryName(board.category),
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
                            _formatDate(board.createdAt),
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade500,
                              fontWeight: FontWeight.w500,
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
                          color: Colors.black87,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.go('/board/new');
        },
        icon: const Icon(Icons.edit_outlined),
        label: const Text(
          '글쓰기',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        elevation: 2,
      ),
    );
  }
}