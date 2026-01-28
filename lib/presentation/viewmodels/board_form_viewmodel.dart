import 'dart:io';

import 'package:flutter_assignment/domain/repositories/board_repository.dart';
import 'package:flutter_assignment/presentation/providers/board_provider.dart';
import 'package:flutter_assignment/presentation/viewmodels/my_posts_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'board_form_viewmodel.freezed.dart';

@freezed
class BoardFormState with _$BoardFormState {
  const factory BoardFormState({
    @Default(false) bool isLoading,
    String? error,
    String? successMessage,
    @Default(false) bool shouldNavigate,
    int? createdBoardId,
    int? updatedBoardId,
    @Default(false) bool isLoadingInitialData,
    String? initialTitle,
    String? initialContent,
    String? initialCategory,
    String? initialImageUrl,
  }) = _BoardFormState;
}

class BoardFormViewModel extends StateNotifier<BoardFormState> {
  final BoardRepository _boardRepository;
  final Ref _ref;

  BoardFormViewModel(this._boardRepository, this._ref) : super(BoardFormState());

  Future<void> loadInitialData({required int boardId}) async {
    state = state.copyWith(isLoadingInitialData: true, error: null);
    try {
      final board = await _boardRepository.getDetailBoard(boardId);
      state = state.copyWith(
        isLoadingInitialData: false,
        initialTitle: board.title,
        initialContent: board.content,
        initialCategory: board.category,
        initialImageUrl: board.imageUrl,
      );
    } catch (e) {
      state = state.copyWith(isLoadingInitialData: false, error: e.toString());
    }
  }

  Future<bool> submit({
    required bool isEditMode,
    int? boardId,
    required String? userEmail,
    required String title,
    required String content,
    required String category,
    File? image,
  }) async {
    if (!isEditMode && (userEmail == null || userEmail.isEmpty)) {
      state = state.copyWith(
        isLoading: false,
        error: '로그인 정보를 찾을 수 없습니다',
        shouldNavigate: false,
      );
      return false;
    }

    if (isEditMode) {
      if (boardId == null) {
        state = state.copyWith(
          isLoading: false,
          error: '수정할 게시글 정보를 찾을 수 없습니다',
          shouldNavigate: false,
        );
        return false;
      }
      return updateBoard(
        id: boardId,
        title: title,
        content: content,
        category: category,
        image: image,
      );
    }

    return createBoard(
      userEmail: userEmail!,
      title: title,
      content: content,
      category: category,
      image: image,
    );
  }

  Future<bool> createBoard({
    required String userEmail,
    required String title,
    required String content,
    required String category,
    File? image,
  }) async {
    state = state.copyWith(
      isLoading: true,
      error: null,
      successMessage: null,
      shouldNavigate: false,
      createdBoardId: null,
      updatedBoardId: null,
    );

    try {
      final boardId = await _boardRepository.createBoard(
        title: title,
        content: content,
        category: category,
        image: image,
      );

      // 내가 작성한 게시글 상태 업데이트
      await _ref.read(myPostsViewModelProvider.notifier).addMyPost(boardId);

      state = state.copyWith(
        isLoading: false,
        successMessage: '게시글이 등록되었습니다',
        shouldNavigate: true,
        createdBoardId: boardId,
      );
      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
        shouldNavigate: false,
      );
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
    state = state.copyWith(
      isLoading: true,
      error: null,
      successMessage: null,
      shouldNavigate: false,
      createdBoardId: null,
      updatedBoardId: null,
    );

    try {
      await _boardRepository.updateBoard(
        id: id,
        title: title,
        content: content,
        category: category,
        image: image,
      );

      state = state.copyWith(
        isLoading: false,
        successMessage: '게시글이 수정되었습니다',
        shouldNavigate: true,
        updatedBoardId: id,
      );
      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
        shouldNavigate: false,
      );
      return false;
    }
  }

  void clearMessages() {
    state = state.copyWith(
      error: null,
      successMessage: null,
      shouldNavigate: false,
      createdBoardId: null,
      updatedBoardId: null,
    );
  }
}

final boardFormViewModelProvider =
StateNotifierProvider<BoardFormViewModel, BoardFormState>((ref) {
  return BoardFormViewModel(
    ref.read(boardRepositoryProvider),
    ref,
  );
});