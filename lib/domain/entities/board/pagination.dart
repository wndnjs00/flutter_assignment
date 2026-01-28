import 'package:freezed_annotation/freezed_annotation.dart';
part 'pagination.freezed.dart';

@freezed
class Pagination with _$Pagination {
  const factory Pagination({
    required int currentPage,
    required int totalPages,
    required int totalElements,
    required int pageSize,
    required bool isFirst,
    required bool isLast,
  }) = _Pagination;
}