import 'package:freezed_annotation/freezed_annotation.dart';

part 'board.freezed.dart';

@freezed
class Board with _$Board {
  const factory Board({
    required int id,
    required String title,
    required String content,
    required String category,
    String? imageUrl,
    required DateTime createdAt,
  }) = _Board;
}