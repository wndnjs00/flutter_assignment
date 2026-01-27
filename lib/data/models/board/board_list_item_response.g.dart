// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board_list_item_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
