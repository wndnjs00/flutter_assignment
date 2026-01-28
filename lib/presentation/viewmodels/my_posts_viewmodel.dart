import 'package:flutter_assignment/data/datasources/local/local_storage_service.dart';
import 'package:flutter_assignment/presentation/providers/auth_provider.dart';
import 'package:flutter_assignment/presentation/providers/board_provider.dart';
import 'package:flutter_assignment/presentation/viewmodels/auth_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_posts_viewmodel.freezed.dart';

@freezed
class MyPostsState with _$MyPostsState {
  const factory MyPostsState({
    @Default({}) Set<int> myPostIds,
  }) = _MyPostsState;
}

class MyPostsViewModel extends StateNotifier<MyPostsState> {
  final LocalStorageService _localStorage;
  final Ref _ref;

  MyPostsViewModel(this._localStorage, this._ref) : super(const MyPostsState()) {
    // 초기 로드
    _loadMyPosts();
    
    // AuthState 변경 감지하여 자동 업데이트
    _ref.listen<AuthState>(authViewModelProvider, (previous, next) {
      // 사용자 변경 시 (로그인/로그아웃) 상태 새로고침
      if (previous?.user?.email != next.user?.email) {
        _loadMyPosts();
      }
    });
  }

  void _loadMyPosts() {
    final authState = _ref.read(authViewModelProvider);
    final userEmail = authState.user?.email;

    if (userEmail == null) {
      state = const MyPostsState(myPostIds: {});
      return;
    }

    final myPostIds = _localStorage.getMyPosts(userEmail);
    state = MyPostsState(myPostIds: myPostIds.toSet());
  }

  Future<void> addMyPost(int postId) async {
    final authState = _ref.read(authViewModelProvider);
    final userEmail = authState.user?.email;

    if (userEmail == null) return;

    await _localStorage.addMyPost(userEmail, postId);

    // 상태 업데이트
    final currentMyPostIds = Set<int>.from(state.myPostIds);
    currentMyPostIds.add(postId);

    state = MyPostsState(myPostIds: currentMyPostIds);
  }

  Future<void> removeMyPost(int postId) async {
    final authState = _ref.read(authViewModelProvider);
    final userEmail = authState.user?.email;

    if (userEmail == null) return;

    await _localStorage.removeMyPost(userEmail, postId);

    // 상태 업데이트
    final currentMyPostIds = Set<int>.from(state.myPostIds);
    currentMyPostIds.remove(postId);

    state = MyPostsState(myPostIds: currentMyPostIds);
  }

  bool isMyPost(int postId) {
    return state.myPostIds.contains(postId);
  }

  // 사용자 변경 시 내 게시글 목록 다시 로드
  void refresh() {
    _loadMyPosts();
  }
}

final myPostsViewModelProvider =
    StateNotifierProvider<MyPostsViewModel, MyPostsState>((ref) {
  return MyPostsViewModel(
    ref.read(localStorageProvider),
    ref,
  );
});
