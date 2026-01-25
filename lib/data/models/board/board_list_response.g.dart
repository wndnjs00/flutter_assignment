// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BoardListResponse _$BoardListResponseFromJson(Map<String, dynamic> json) =>
    BoardListResponse(
      content: (json['content'] as List<dynamic>)
          .map((e) => BoardListItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      pageable: Pageable.fromJson(json['pageable'] as Map<String, dynamic>),
      totalPages: (json['totalPages'] as num).toInt(),
      totalElements: (json['totalElements'] as num).toInt(),
      last: json['last'] as bool,
      numberOfElements: (json['numberOfElements'] as num).toInt(),
      size: (json['size'] as num).toInt(),
      number: (json['number'] as num).toInt(),
      first: json['first'] as bool,
      empty: json['empty'] as bool,
    );

Map<String, dynamic> _$BoardListResponseToJson(BoardListResponse instance) =>
    <String, dynamic>{
      'content': instance.content,
      'pageable': instance.pageable,
      'totalPages': instance.totalPages,
      'totalElements': instance.totalElements,
      'last': instance.last,
      'numberOfElements': instance.numberOfElements,
      'size': instance.size,
      'number': instance.number,
      'first': instance.first,
      'empty': instance.empty,
    };
