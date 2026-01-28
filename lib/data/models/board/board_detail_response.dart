import 'package:freezed_annotation/freezed_annotation.dart';

part 'board_detail_response.freezed.dart';
part 'board_detail_response.g.dart';

// 글 상세 조회
@freezed
class BoardDetailResponse with _$BoardDetailResponse {
  const factory BoardDetailResponse({
    required int id,
    required String title,
    required String content,
    required String boardCategory,
    String? imageUrl,
    required String createdAt,
  }) = _BoardDetailResponse;

  factory BoardDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$BoardDetailResponseFromJson(json);
}