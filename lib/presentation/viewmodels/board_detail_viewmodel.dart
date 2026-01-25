import 'package:flutter_assignment/domain/entities/board/board.dart';
import 'package:flutter_assignment/domain/repositories/board_repository.dart';
import 'package:flutter_assignment/presentation/providers/board_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'board_detail_viewmodel.freezed.dart';

@freezed
class BoardDetailState with _$BoardDetailState {
  const factory BoardDetailState({
    Board? board,
    @Default(false) bool isLoading,
    String? error,
  }) = _BoardDetailState;
}

class BoardDetailViewModel extends StateNotifier<BoardDetailState> {
  final BoardRepository _boardRepository;
  final int boardId;

  BoardDetailViewModel(this._boardRepository, this.boardId)
    : super(BoardDetailState()) {
    loadBoard();
  }

  Future<void> loadBoard() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final board = await _boardRepository.getBoard(boardId);
      state = state.copyWith(board: board, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<bool> deleteBoard() async {
    try {
      await _boardRepository.deleteBoard(boardId);
      return true;
    } catch (e) {
      state = state.copyWith(error: e.toString());
      return false;
    }
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}

final boardDetailViewModelProvider =
    StateNotifierProvider.family<BoardDetailViewModel, BoardDetailState, int>((
      ref,
      boardId,
    ) {
      return BoardDetailViewModel(ref.read(boardRepositoryProvider), boardId);
    });
