import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BoardFormScreen extends ConsumerStatefulWidget {
  final int? boardId;

  const BoardFormScreen({
    this.boardId,
    super.key
  });

  @override
  ConsumerState<BoardFormScreen> createState() => _BoardFormScreenState();
}

class _BoardFormScreenState extends ConsumerState<BoardFormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
