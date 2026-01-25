class Board {
  final int id;
  final String title;
  final String content;
  final String category;
  final String? imageUrl;
  final DateTime createdAt;

  Board({
    required this.id,
    required this.title,
    required this.content,
    required this.category,
    this.imageUrl,
    required this.createdAt,
  });

  Board copyWith({
    int? id,
    String? title,
    String? content,
    String? category,
    String? imageUrl,
    DateTime? createdAt,
  }) {
    return Board(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      category: category ?? this.category,
      imageUrl: imageUrl ?? this.imageUrl,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
