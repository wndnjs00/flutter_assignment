// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BoardRequest _$BoardRequestFromJson(Map<String, dynamic> json) => BoardRequest(
      title: json['title'] as String,
      content: json['content'] as String,
      category: json['category'] as String,
    );

Map<String, dynamic> _$BoardRequestToJson(BoardRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'category': instance.category,
    };
