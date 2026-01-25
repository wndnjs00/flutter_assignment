import 'package:json_annotation/json_annotation.dart';

part 'board_request.g.dart';

// 이건 안쓰임 삭제?
@JsonSerializable()
class BoardRequest {
  final String title;
  final String content;
  final String category;

  BoardRequest({
    required this.title,
    required this.content,
    required this.category,
  });

  factory BoardRequest.fromJson(Map<String, dynamic> json) =>
      _$BoardRequestFromJson(json);

  Map<String, dynamic> toJson() => _$BoardRequestToJson(this);
}
