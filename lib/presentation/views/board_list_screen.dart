import 'package:flutter/material.dart';
import 'package:flutter_assignment/data/datasources/local/local_storage_service.dart';
import 'package:flutter_assignment/presentation/viewmodels/board_list_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../core/constants/api_constants.dart';

final localStorageProvider = Provider((ref) => LocalStorageService());

class BoardListScreen extends ConsumerStatefulWidget {
  const BoardListScreen({super.key});

  @override
  ConsumerState<BoardListScreen> createState() => _BoardListScreenState();
}

class _BoardListScreenState extends ConsumerState<BoardListScreen> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  String _selectedCategoryFilter = 'ALL';
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
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

  void _toggleLike(int postId) {
    ref.read(localStorageProvider).toggleLike(postId);
    setState(() {});
  }

  bool _isLiked(int postId) {
    return ref.read(localStorageProvider).isLiked(postId);
  }

  @override
  Widget build(BuildContext context) {
    final boardState = ref.watch(boardListViewModelProvider);

    var filteredBoards = boardState.boards;

    if (_selectedCategoryFilter != 'ALL') {
      filteredBoards = filteredBoards
          .where((board) => board.category == _selectedCategoryFilter)
          .toList();
    }

    // 제목 + 내용 검색
    if (_searchQuery.isNotEmpty) {
      filteredBoards = filteredBoards.where((board) {
        final query = _searchQuery.toLowerCase();
        return board.title.toLowerCase().contains(query);
      }).toList();
    }

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Column(
        children: [
          // 검색창
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            color: Colors.white,
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: '제목 또는 내용 검색',
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                  icon: const Icon(Icons.clear, color: Colors.grey),
                  onPressed: () {
                    setState(() {
                      _searchController.clear();
                      _searchQuery = '';
                    });
                  },
                )
                    : null,
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
          ),

          // 카테고리 칩
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            color: Colors.white,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  _buildCategoryChip('ALL', '전체'),
                  const SizedBox(width: 8),
                  _buildCategoryChip('NOTICE', '공지'),
                  const SizedBox(width: 8),
                  _buildCategoryChip('FREE', '자유'),
                  const SizedBox(width: 8),
                  _buildCategoryChip('QNA', 'Q&A'),
                  const SizedBox(width: 8),
                  _buildCategoryChip('ETC', '기타'),
                ],
              ),
            ),
          ),

          const Divider(height: 1, thickness: 1),

          // 게시글 리스트
          Expanded(
            child: RefreshIndicator(
              onRefresh: _refresh,
              child: boardState.isLoading && boardState.boards.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : boardState.error != null && boardState.boards.isEmpty
                  ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error_outline, size: 64, color: Colors.grey.shade400),
                    const SizedBox(height: 16),
                    Text(
                      boardState.error!,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
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
                  : filteredBoards.isEmpty
                  ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.article_outlined, size: 64, color: Colors.grey.shade300),
                    const SizedBox(height: 16),
                    Text(
                      _searchQuery.isNotEmpty
                          ? '검색 결과가 없습니다'
                          : '등록된 게시글이 없습니다',
                      style: TextStyle(color: Colors.grey.shade500, fontSize: 14),
                    ),
                  ],
                ),
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
                  final isLiked = _isLiked(board.id);

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
                          border: Border.all(color: Colors.grey.shade200, width: 1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // 좋아요 버튼
                            Column(
                              children: [
                                IconButton(
                                  icon: Icon(
                                    isLiked ? Icons.favorite : Icons.favorite_border,
                                    color: isLiked ? Colors.red : Colors.grey,
                                    size: 24,
                                  ),
                                  padding: EdgeInsets.zero,
                                  constraints: const BoxConstraints(),
                                  onPressed: () => _toggleLike(board.id),
                                ),
                              ],
                            ),
                            const SizedBox(width: 12),

                            // 게시글 정보
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // 카테고리
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
                                      _getCategoryName(board.category),
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey.shade700,
                                        letterSpacing: 0.3,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),

                                  // 날짜
                                  Row(
                                    children: [
                                      Icon(Icons.access_time, size: 12, color: Colors.grey.shade400),
                                      const SizedBox(width: 4),
                                      Text(
                                        _formatDate(board.createdAt),
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: Colors.grey.shade500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),

                                  // 제목
                                  Text(
                                    board.title,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                      height: 1.3,
                                      color: Colors.black87,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
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

  Widget _buildCategoryChip(String value, String label) {
    final isSelected = _selectedCategoryFilter == value;
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        setState(() {
          _selectedCategoryFilter = value;
        });
      },
      backgroundColor: Colors.grey.shade100,
      selectedColor: Theme.of(context).primaryColor.withOpacity(0.2),
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