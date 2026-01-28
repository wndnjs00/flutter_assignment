import 'package:flutter_assignment/data/datasources/local/local_storage_service.dart';
import 'package:flutter_assignment/presentation/providers/board_provider.dart';
import 'package:flutter_assignment/presentation/viewmodels/auth_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'like_viewmodel.freezed.dart';

@freezed
class LikeState with _$LikeState {
  const factory LikeState({
    @Default({}) Set<int> likedPostIds,
  }) = _LikeState;
}

class LikeViewModel extends StateNotifier<LikeState> {
  final LocalStorageService _localStorage;
  final Ref _ref;

  LikeViewModel(this._localStorage, this._ref) : super(const LikeState()) {
    _loadLikedPosts();
    
    _ref.listen<AuthState>(authViewModelProvider, (previous, next) {
      if (previous?.user?.email != next.user?.email) {
        _loadLikedPosts();
      }
    });
  }

  void _loadLikedPosts() {
    final authState = _ref.read(authViewModelProvider);
    final userEmail = authState.user?.email;

    if (userEmail == null) {
      state = const LikeState(likedPostIds: {});
      return;
    }

    final likedPostIds = _localStorage.getLikedPosts(userEmail);
    state = LikeState(likedPostIds: likedPostIds.toSet());
  }

  Future<void> toggleLike(int postId) async {
    final authState = _ref.read(authViewModelProvider);
    final userEmail = authState.user?.email;

    if (userEmail == null) return;

    await _localStorage.toggleLike(userEmail, postId);

    final currentLikedIds = Set<int>.from(state.likedPostIds);
    if (currentLikedIds.contains(postId)) {
      currentLikedIds.remove(postId);
    } else {
      currentLikedIds.add(postId);
    }

    state = LikeState(likedPostIds: currentLikedIds);
  }

  void refresh() {
    _loadLikedPosts();
  }
}

final likeViewModelProvider =
    StateNotifierProvider<LikeViewModel, LikeState>((ref) {
  return LikeViewModel(
    ref.read(localStorageProvider),
    ref,
  );
});
