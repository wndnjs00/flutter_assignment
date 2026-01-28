import 'package:flutter_assignment/domain/entities/board/board_list_item.dart';
import 'package:flutter_assignment/presentation/viewmodels/board_list_viewmodel.dart';
import 'package:flutter_assignment/presentation/viewmodels/my_posts_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

// BoardListScreen 필터/검색 상태
final boardCategoryFilterProvider = StateProvider<String>((ref) => 'ALL');
final boardSearchQueryProvider = StateProvider<String>((ref) => '');

// 카테고리 이름을 가져오는 Selector Provider
final categoryNameSelectorProvider =
    Provider.family<String, String>((ref, categoryKey) {
  final categories = ref.watch(boardListViewModelProvider).categories;
  return categories[categoryKey] ?? categoryKey;
});

// 날짜를 포맷팅하는 Selector Provider
final formattedDateSelectorProvider =
    Provider.family<String, DateTime>((ref, date) {
  return DateFormat('yyyy-MM-dd HH:mm').format(date);
});

// BoardListScreen에서 사용되는 필터링된 게시글 목록 Selector Provider
final filteredBoardsSelectorProvider = Provider<List<BoardListItem>>((ref) {
  final boardState = ref.watch(boardListViewModelProvider);
  final selectedCategory = ref.watch(boardCategoryFilterProvider);
  final searchQuery = ref.watch(boardSearchQueryProvider).trim().toLowerCase();

  Iterable<BoardListItem> boards = boardState.boards;

  // 카테고리 필터
  if (selectedCategory != 'ALL') {
    boards = boards.where((b) => b.category == selectedCategory);
  }

  // 제목 검색
  if (searchQuery.isNotEmpty) {
    boards = boards.where((b) => b.title.toLowerCase().contains(searchQuery));
  }

  return boards.toList();
});

// 특정 게시글이 내가 작성한 글인지 여부 Selector Provider
final isMyPostSelectorProvider = Provider.family<bool, int>((ref, boardId) {
  final myPostsState = ref.watch(myPostsViewModelProvider);
  return myPostsState.myPostIds.contains(boardId);
});

