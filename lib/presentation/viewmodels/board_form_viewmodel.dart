import 'dart:io';

import 'package:flutter_assignment/domain/repositories/board_repository.dart';
import 'package:flutter_assignment/presentation/providers/board_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'board_form_viewmodel.freezed.dart';

@freezed
class BoardFormState with _$BoardFormState {
  const factory BoardFormState({
    @Default(false) bool isLoading,
    String? error,
    String? successMessage,
  }) = _BoardFormState;
}

class BoardFormViewModel extends StateNotifier<BoardFormState> {
  final BoardRepository _boardRepository;

  BoardFormViewModel(this._boardRepository) : super(BoardFormState());

  Future<bool> createBoard({
    required String title,
    required String content,
    required String category,
    File? image,
  }) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      await _boardRepository.createBoard(
        title: title,
        content: content,
        category: category,
        image: image,
      );

      state = state.copyWith(isLoading: false, successMessage: '게시글이 등록되었습니다');
      return true;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      return false;
    }
  }

  Future<bool> updateBoard({
    required int id,
    required String title,
    required String content,
    required String category,
    File? image,
  }) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      await _boardRepository.updateBoard(
        id: id,
        title: title,
        content: content,
        category: category,
        image: image,
      );

      state = state.copyWith(isLoading: false, successMessage: '게시글이 수정되었습니다');
      return true;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      return false;
    }
  }

  void clearMessages() {
    state = state.copyWith(error: null, successMessage: null);
  }
}

final boardFormViewModelProvider =
    StateNotifierProvider<BoardFormViewModel, BoardFormState>((ref) {
      return BoardFormViewModel(ref.read(boardRepositoryProvider));
    });
