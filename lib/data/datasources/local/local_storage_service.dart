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

  // 좋아요한 게시글
  Box<int> get _likedBox => Hive.box<int>(_likedPostsBoxName);

  List<int> getLikedPosts() {
    return _likedBox.values.toList();
  }

  bool isLiked(int postId) {
    return _likedBox.containsKey(postId);
  }

  Future<void> toggleLike(int postId) async {
    if (isLiked(postId)) {
      await _likedBox.delete(postId);
    } else {
      await _likedBox.put(postId, postId);
    }
  }

  // 내가 작성한 게시글
  Box<int> get _myPostsBox => Hive.box<int>(_myPostsBoxName);

  List<int> getMyPosts() {
    return _myPostsBox.values.toList();
  }

  bool isMyPost(int postId) {
    return _myPostsBox.containsKey(postId);
  }

  Future<void> addMyPost(int postId) async {
    await _myPostsBox.put(postId, postId);
  }

  Future<void> removeMyPost(int postId) async {
    await _myPostsBox.delete(postId);
  }
}
