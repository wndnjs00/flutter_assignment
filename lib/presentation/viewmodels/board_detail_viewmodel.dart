import 'package:flutter_assignment/domain/entities/board/board.dart';
import 'package:flutter_assignment/domain/repositories/board_repository.dart';
import 'package:flutter_assignment/presentation/providers/board_provider.dart';
import 'package:flutter_assignment/presentation/viewmodels/board_list_viewmodel.dart';
import 'package:flutter_assignment/presentation/viewmodels/my_posts_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'board_detail_viewmodel.freezed.dart';

@freezed
class BoardDetailState with _$BoardDetailState {
  const factory BoardDetailState({
    Board? board,
    @Default(false) bool isLoading,
    String? error,
    @Default(false) bool isDeleting,
    @Default(false) bool deleteSuccess,
  }) = _BoardDetailState;
}

class BoardDetailViewModel extends StateNotifier<BoardDetailState> {
  final BoardRepository _boardRepository;
  final int boardId;
  final Ref _ref;

  BoardDetailViewModel(this._boardRepository, this.boardId, this._ref)
      : super(BoardDetailState()) {
    loadBoard();
  }

  Future<void> loadBoard() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final board = await _boardRepository.getDetailBoard(boardId);
      state = state.copyWith(board: board, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> deleteBoard() async {
    state = state.copyWith(isDeleting: true, error: null, deleteSuccess: false);

    try {
      await _boardRepository.deleteBoard(boardId);
      
      // 삭제 성공 후 관련 상태 업데이트
      await _ref.read(myPostsViewModelProvider.notifier).removeMyPost(boardId);
      _ref.read(boardListViewModelProvider.notifier).loadBoards(refresh: true);
      
      state = state.copyWith(isDeleting: false, deleteSuccess: true);
    } catch (e) {
      state = state.copyWith(isDeleting: false, error: e.toString(), deleteSuccess: false);
    }
  }

  // 게시글 정보 업데이트 메서드
  void updateBoard(Board board) {
    state = state.copyWith(board: board);
  }

  void clearError() {
    state = state.copyWith(error: null);
  }

  void clearDeleteSuccess() {
    state = state.copyWith(deleteSuccess: false);
  }
}

final boardDetailViewModelProvider =
StateNotifierProvider.family<BoardDetailViewModel, BoardDetailState, int>((
    ref,
    boardId,
    ) {
  return BoardDetailViewModel(ref.read(boardRepositoryProvider), boardId, ref);
});