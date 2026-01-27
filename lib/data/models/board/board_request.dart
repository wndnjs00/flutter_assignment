import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'board_request.freezed.dart';
part 'board_request.g.dart';

// TODO: 안쓰임 -> 삭제하기!
@freezed
class BoardRequest with _$BoardRequest {
  const factory BoardRequest({
    required String title,
    required String content,
    required String category,
  }) = _BoardRequest;

  factory BoardRequest.fromJson(Map<String, dynamic> json) =>
      _$BoardRequestFromJson(json);
}
