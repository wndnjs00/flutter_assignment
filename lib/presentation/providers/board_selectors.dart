import 'package:flutter_assignment/domain/entities/board/board_list_item.dart';
import 'package:flutter_assignment/presentation/viewmodels/board_list_viewmodel.dart';
import 'package:flutter_assignment/presentation/viewmodels/my_posts_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

final boardCategoryFilterProvider = StateProvider<String>((ref) => 'ALL');
final boardSearchQueryProvider = StateProvider<String>((ref) => '');

// 카테고리 이름 조회
final categoryNameSelectorProvider =
    Provider.family<String, String>((ref, categoryKey) {
  final categories = ref.watch(boardListViewModelProvider).categories;
  return categories[categoryKey] ?? categoryKey;
});

// 날짜 포맷팅
final formattedDateSelectorProvider =
    Provider.family<String, DateTime>((ref, date) {
  return DateFormat('yyyy-MM-dd HH:mm').format(date);
});

// 필터링된 게시글 목록
final filteredBoardsSelectorProvider = Provider<List<BoardListItem>>((ref) {
  final boardState = ref.watch(boardListViewModelProvider);
  final selectedCategory = ref.watch(boardCategoryFilterProvider);
  final searchQuery = ref.watch(boardSearchQueryProvider).trim().toLowerCase();

  Iterable<BoardListItem> boards = boardState.boards;

  if (selectedCategory != 'ALL') {
    boards = boards.where((b) => b.category == selectedCategory);
  }

  if (searchQuery.isNotEmpty) {
    boards = boards.where((b) => b.title.toLowerCase().contains(searchQuery));
  }

  return boards.toList();
});

// 내 게시글 여부 확인
final isMyPostSelectorProvider = Provider.family<bool, int>((ref, boardId) {
  final myPostsState = ref.watch(myPostsViewModelProvider);
  return myPostsState.myPostIds.contains(boardId);
});

