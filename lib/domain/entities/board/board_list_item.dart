import 'package:freezed_annotation/freezed_annotation.dart';

part 'board_list_item.freezed.dart';

@freezed
class BoardListItem with _$BoardListItem {
  const factory BoardListItem({
    required int id,
    required String title,
    required String category,
    required DateTime createdAt,
  }) = _BoardListItem;
}