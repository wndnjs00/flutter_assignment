import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalStorageService {
  static const String _likedPostsBoxName = 'liked_posts';
  static const String _myPostsBoxName = 'my_posts';

  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox<int>(_likedPostsBoxName);
    await Hive.openBox<int>(_myPostsBoxName);
  }

  // 좋아요한 게시글 (사용자별로 분리)
  Box<int> get _likedBox => Hive.box<int>(_likedPostsBoxName);

  String _getLikedKey(String userEmail, int postId) {
    return '${userEmail}_$postId';
  }

  List<int> getLikedPosts(String userEmail) {
    final allKeys = _likedBox.keys.toList();
    final userKeys = allKeys
        .where((key) => key.toString().startsWith('${userEmail}_'))
        .toList();

    return userKeys.map((key) {
      final postId = key.toString().split('_').last;
      return int.parse(postId);
    }).toList();
  }

  bool isLiked(String userEmail, int postId) {
    final key = _getLikedKey(userEmail, postId);
    return _likedBox.containsKey(key);
  }

  Future<void> toggleLike(String userEmail, int postId) async {
    final key = _getLikedKey(userEmail, postId);
    if (isLiked(userEmail, postId)) {
      await _likedBox.delete(key);
    } else {
      await _likedBox.put(key, postId);
    }
  }

  // 내가 작성한 게시글 (사용자별로 분리)
  Box<int> get _myPostsBox => Hive.box<int>(_myPostsBoxName);

  String _getMyPostKey(String userEmail, int postId) {
    return '${userEmail}_$postId';
  }

  List<int> getMyPosts(String userEmail) {
    final allKeys = _myPostsBox.keys.toList();
    final userKeys = allKeys
        .where((key) => key.toString().startsWith('${userEmail}_'))
        .toList();

    return userKeys.map((key) {
      final postId = key.toString().split('_').last;
      return int.parse(postId);
    }).toList();
  }

  // TODO: 사용되지 않는 함수: 삭제해야되나?
  bool isMyPost(String userEmail, int postId) {
    final key = _getMyPostKey(userEmail, postId);
    return _myPostsBox.containsKey(key);
  }

  Future<void> addMyPost(String userEmail, int postId) async {
    final key = _getMyPostKey(userEmail, postId);
    await _myPostsBox.put(key, postId);
  }

  Future<void> removeMyPost(String userEmail, int postId) async {
    final key = _getMyPostKey(userEmail, postId);
    await _myPostsBox.delete(key);
  }

  // 로그아웃 시 특정 사용자 데이터 삭제
  // TODO: 사용되지 않는 함수: 삭제해야되나?
  Future<void> clearUserData(String userEmail) async {
    // 좋아요 데이터 삭제
    final likedKeys = _likedBox.keys
        .where((key) => key.toString().startsWith('${userEmail}_'))
        .toList();
    for (final key in likedKeys) {
      await _likedBox.delete(key);
    }

    // 내 게시글 데이터 삭제
    final myPostKeys = _myPostsBox.keys
        .where((key) => key.toString().startsWith('${userEmail}_'))
        .toList();
    for (final key in myPostKeys) {
      await _myPostsBox.delete(key);
    }
  }
}