import 'package:flutter/material.dart';
import 'package:flutter_assignment/presentation/providers/board_selectors.dart';
import 'package:flutter_assignment/presentation/viewmodels/board_list_viewmodel.dart';
import 'package:flutter_assignment/presentation/viewmodels/like_viewmodel.dart';
import 'package:flutter_assignment/presentation/viewmodels/my_posts_viewmodel.dart';
import 'package:flutter_assignment/presentation/views/list/widgets/search_bar.dart' as search_widget;
import 'package:flutter_assignment/presentation/views/list/widgets/category_filter_chips.dart';
import 'package:flutter_assignment/presentation/views/list/widgets/error_state_widget.dart';
import 'package:flutter_assignment/presentation/views/list/widgets/empty_state_widget.dart';
import 'package:flutter_assignment/presentation/views/list/widgets/board_list_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class BoardListScreen extends ConsumerStatefulWidget {
  const BoardListScreen({super.key});

  @override
  ConsumerState<BoardListScreen> createState() => _BoardListScreenState();
}

class _BoardListScreenState extends ConsumerState<BoardListScreen> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();

  // 초기화 및 데이터 새로고침
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(likeViewModelProvider.notifier).refresh();
      ref.read(myPostsViewModelProvider.notifier).refresh();
    });
  }

  // 리소스 정리
  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  // 스크롤 감지하여 추가 게시글 로드
  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.9) {
      ref.read(boardListViewModelProvider.notifier).loadMoreBoards();
    }
  }

  // 게시글 목록 새로고침
  Future<void> _refresh() async {
    await ref
        .refresh(boardListViewModelProvider.notifier)
        .loadBoards(refresh: true);
  }

  // 게시글 목록 화면 UI 구성
  @override
  Widget build(BuildContext context) {
    final boardState = ref.watch(boardListViewModelProvider);
    final filteredBoards = ref.watch(filteredBoardsSelectorProvider);
    final searchQuery = ref.watch(boardSearchQueryProvider);

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Column(
        children: [
          search_widget.BoardSearchBar(controller: _searchController),
          const CategoryFilterChips(),
          const Divider(height: 1, thickness: 1),

          // 게시글 리스트
          Expanded(
            child: RefreshIndicator(
              onRefresh: _refresh,
              child: boardState.isLoading && boardState.boards.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : boardState.error != null && boardState.boards.isEmpty
                  ? ErrorStateWidget(
                      error: boardState.error!,
                      onRetry: _refresh,
                    )
                  : filteredBoards.isEmpty
                  ? EmptyStateWidget(
                      message: searchQuery.isNotEmpty
                          ? '검색 결과가 없습니다'
                          : '등록된 게시글이 없습니다',
                    )
                  : ListView.separated(
                controller: _scrollController,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                itemCount: filteredBoards.length + (boardState.isLoadingMore ? 1 : 0),
                separatorBuilder: (context, index) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  if (index == filteredBoards.length) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }

                  final board = filteredBoards[index];

                  return BoardListItemWidget(board: board);
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.go('/board/new');
        },
        icon: const Icon(Icons.edit_outlined),
        label: const Text(
          '글쓰기',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
        ),
        elevation: 2,
      ),
    );
  }

}