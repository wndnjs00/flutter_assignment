// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board_list_item_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BoardDetailResponse _$BoardDetailResponseFromJson(Map<String, dynamic> json) =>
    BoardDetailResponse(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      content: json['content'] as String,
      boardCategory: json['boardCategory'] as String,
      imageUrl: json['imageUrl'] as String?,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$BoardDetailResponseToJson(
        BoardDetailResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'boardCategory': instance.boardCategory,
      'imageUrl': instance.imageUrl,
      'createdAt': instance.createdAt,
    };

BoardListItemResponse _$BoardListItemResponseFromJson(
        Map<String, dynamic> json) =>
    BoardListItemResponse(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      category: json['category'] as String,
      createdAt:
          BoardListItemResponse._dateTimeFromJson(json['createdAt'] as String),
    );

Map<String, dynamic> _$BoardListItemResponseToJson(
        BoardListItemResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'category': instance.category,
      'createdAt': BoardListItemResponse._dateTimeToJson(instance.createdAt),
    };

Pageable _$PageableFromJson(Map<String, dynamic> json) => Pageable(
      pageNumber: (json['pageNumber'] as num).toInt(),
      pageSize: (json['pageSize'] as num).toInt(),
      offset: (json['offset'] as num).toInt(),
      paged: json['paged'] as bool,
      unpaged: json['unpaged'] as bool,
    );

Map<String, dynamic> _$PageableToJson(Pageable instance) => <String, dynamic>{
      'pageNumber': instance.pageNumber,
      'pageSize': instance.pageSize,
      'offset': instance.offset,
      'paged': instance.paged,
      'unpaged': instance.unpaged,
    };
