import 'package:flutter_assignment/domain/entities/board/board_list_item.dart';
import 'package:flutter_assignment/domain/entities/board/pagination.dart';
import 'package:flutter_assignment/domain/repositories/board_repository.dart';
import 'package:flutter_assignment/presentation/providers/board_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'board_list_viewmodel.freezed.dart';

@freezed
class BoardListState with _$BoardListState {
  const factory BoardListState({
    @Default([]) List<BoardListItem> boards,
    Pagination? pagination,
    @Default(false) bool isLoading,
    @Default(false) bool isLoadingMore,
    String? error,
    @Default({}) Map<String, String> categories,
  }) = _BoardListState;
}

class BoardListViewModel extends StateNotifier<BoardListState> {
  final BoardRepository _boardRepository;
  static const int _pageSize = 10;

  BoardListViewModel(this._boardRepository) : super(BoardListState()) {
    loadBoards();
    loadCategories();
    // _deleteAllBoardsForTest(); /// TODO: ⚠️ 테스트 전용: 모든 게시글 삭제 -> 삭제할것!!!!
  }

  /// TODO: ⚠️ 테스트 전용: 모든 게시글 삭제 -> 삭제할것!!!!
  // Future<void> _deleteAllBoardsForTest() async {
  //   try {
  //     // 1. 첫 페이지 불러오기
  //     final result = await _boardRepository.getBoardList(
  //       page: 0,
  //       size: 100, // 테스트니까 크게
  //     );
  //
  //     // 2. 모든 게시글 삭제
  //     for (final board in result.items) {
  //       await _boardRepository.deleteBoard(board.id);
  //     }
  //
  //     // 3. 상태 초기화
  //     state = state.copyWith(
  //       boards: [],
  //       pagination: null,
  //     );
  //   } catch (e) {
  //     // 테스트용이므로 실패 무시
  //   }
  // }

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

  // TODO: 일단 아직은 호출되지 않는코드
  // TODO: but, SnackBar / Alert 표시후 초기화하는 용도로 쓰자
  void clearError() {
    state = state.copyWith(error: null);
  }
}

final boardListViewModelProvider =
    StateNotifierProvider<BoardListViewModel, BoardListState>((ref) {
      return BoardListViewModel(ref.read(boardRepositoryProvider));
    });
