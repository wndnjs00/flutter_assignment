import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'board_list_item_response.freezed.dart';
part 'board_list_item_response.g.dart';

// 글 목록 조회
@freezed
class BoardListItemResponse with _$BoardListItemResponse {
  const factory BoardListItemResponse({
    required int id,
    required String title,
    required String category,

    @JsonKey(fromJson: _dateTimeFromJson, toJson: _dateTimeToJson)
    required DateTime createdAt,
  }) = _BoardListItemResponse;

  factory BoardListItemResponse.fromJson(Map<String, dynamic> json) =>
      _$BoardListItemResponseFromJson(json);
}

DateTime _dateTimeFromJson(String value) => DateTime.parse(value);
String _dateTimeToJson(DateTime dateTime) => dateTime.toIso8601String();
