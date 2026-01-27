// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board_detail_response.dart';

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
