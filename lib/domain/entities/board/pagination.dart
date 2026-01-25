class Pagination {
  final int currentPage;
  final int totalPages;
  final int totalElements;
  final int pageSize;
  final bool isFirst;
  final bool isLast;

  Pagination({
    required this.currentPage,
    required this.totalPages,
    required this.totalElements,
    required this.pageSize,
    required this.isFirst,
    required this.isLast,
  });
}
