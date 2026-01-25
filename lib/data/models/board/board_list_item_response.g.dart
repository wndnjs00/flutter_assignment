// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board_list_item_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BoardDetailResponseImpl _$$BoardDetailResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$BoardDetailResponseImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      content: json['content'] as String,
      boardCategory: json['boardCategory'] as String,
      imageUrl: json['imageUrl'] as String?,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$$BoardDetailResponseImplToJson(
        _$BoardDetailResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'boardCategory': instance.boardCategory,
      'imageUrl': instance.imageUrl,
      'createdAt': instance.createdAt,
    };

_$BoardListItemResponseImpl _$$BoardListItemResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$BoardListItemResponseImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      category: json['category'] as String,
      createdAt: _dateTimeFromJson(json['createdAt'] as String),
    );

Map<String, dynamic> _$$BoardListItemResponseImplToJson(
        _$BoardListItemResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'category': instance.category,
      'createdAt': _dateTimeToJson(instance.createdAt),
    };

_$PageableImpl _$$PageableImplFromJson(Map<String, dynamic> json) =>
    _$PageableImpl(
      pageNumber: (json['pageNumber'] as num).toInt(),
      pageSize: (json['pageSize'] as num).toInt(),
      offset: (json['offset'] as num).toInt(),
      paged: json['paged'] as bool,
      unpaged: json['unpaged'] as bool,
    );

Map<String, dynamic> _$$PageableImplToJson(_$PageableImpl instance) =>
    <String, dynamic>{
      'pageNumber': instance.pageNumber,
      'pageSize': instance.pageSize,
      'offset': instance.offset,
      'paged': instance.paged,
      'unpaged': instance.unpaged,
    };
