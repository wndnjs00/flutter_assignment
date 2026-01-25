import 'package:freezed_annotation/freezed_annotation.dart';

part 'board_create_response.freezed.dart';
part 'board_create_response.g.dart';

@freezed
class BoardCreateResponse with _$BoardCreateResponse {
  const factory BoardCreateResponse({
    required int id,
  }) = _BoardCreateResponse;

  factory BoardCreateResponse.fromJson(Map<String, dynamic> json) =>
      _$BoardCreateResponseFromJson(json);
}
