import 'package:flutter_assignment/domain/entities/board/board_list_item.dart';
import 'package:flutter_assignment/domain/entities/board/pagination.dart';
import 'package:flutter_assignment/domain/repositories/board_repository.dart';
import 'package:flutter_assignment/presentation/providers/board_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BoardListState {
  final List<BoardListItem> boards;
  final Pagination? pagination;
  final bool isLoading;
  final bool isLoadingMore;
  final String? error;
  final Map<String, String> categories;

  BoardListState({
    this.boards = const [],
    this.pagination,
    this.isLoading = false,
    this.isLoadingMore = false,
    this.error,
    this.categories = const {},
  });

  BoardListState copyWith({
    List<BoardListItem>? boards,
    Pagination? pagination,
    bool? isLoading,
    bool? isLoadingMore,
    String? error,
    Map<String, String>? categories,
  }) {
    return BoardListState(
      boards: boards ?? this.boards,
      pagination: pagination ?? this.pagination,
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      error: error,
      categories: categories ?? this.categories,
    );
  }
}

class BoardListViewModel extends StateNotifier<BoardListState> {
  final BoardRepository _boardRepository;
  static const int _pageSize = 10;

  BoardListViewModel(this._boardRepository) : super(BoardListState()) {
    loadBoards();
    loadCategories();
  }

  Future<void> loadBoards({bool refresh = false}) async {
    if (refresh) {
      state = state.copyWith(isLoading: true, error: null);
    } else if (state.isLoading || state.isLoadingMore) {
      return;
    } else {
      state = state.copyWith(isLoading: true, error: null);
    }

    try {
      final result = await _boardRepository.getBoardList(
        page: 0,
        size: _pageSize,
      );

      state = state.copyWith(
        boards: result.items,
        pagination: result.pagination,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> loadMoreBoards() async {
    if (state.pagination == null ||
        state.pagination!.isLast ||
        state.isLoadingMore) {
      return;
    }

    state = state.copyWith(isLoadingMore: true, error: null);

    try {
      final nextPage = state.pagination!.currentPage + 1;
      final result = await _boardRepository.getBoardList(
        page: nextPage,
        size: _pageSize,
      );

      state = state.copyWith(
        boards: [...state.boards, ...result.items],
        pagination: result.pagination,
        isLoadingMore: false,
      );
    } catch (e) {
      state = state.copyWith(isLoadingMore: false, error: e.toString());
    }
  }

  Future<void> loadCategories() async {
    try {
      final categories = await _boardRepository.getCategories();
      state = state.copyWith(categories: categories);
    } catch (e) {
      // 카테고리 로드 실패는 무시
    }
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}

final boardListViewModelProvider =
    StateNotifierProvider<BoardListViewModel, BoardListState>((ref) {
      return BoardListViewModel(ref.read(boardRepositoryProvider));
    });
