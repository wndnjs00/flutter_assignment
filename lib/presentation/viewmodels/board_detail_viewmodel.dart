import 'package:flutter_assignment/domain/entities/board/board.dart';
import 'package:flutter_assignment/domain/repositories/board_repository.dart';
import 'package:flutter_assignment/presentation/providers/board_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BoardDetailState {
  final Board? board;
  final bool isLoading;
  final String? error;

  BoardDetailState({this.board, this.isLoading = false, this.error});

  BoardDetailState copyWith({Board? board, bool? isLoading, String? error}) {
    return BoardDetailState(
      board: board ?? this.board,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
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
