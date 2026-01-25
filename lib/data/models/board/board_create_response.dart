import 'package:json_annotation/json_annotation.dart';

part 'board_create_response.g.dart';

@JsonSerializable()
class BoardCreateResponse {
  final int id;

  BoardCreateResponse({required this.id});

  factory BoardCreateResponse.fromJson(Map<String, dynamic> json) =>
      _$BoardCreateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BoardCreateResponseToJson(this);
}
