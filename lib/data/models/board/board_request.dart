import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'board_request.freezed.dart';
part 'board_request.g.dart';

// 이건 안쓰임 삭제?
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
