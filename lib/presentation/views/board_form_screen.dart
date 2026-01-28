import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/presentation/viewmodels/auth_viewmodel.dart';
import 'package:flutter_assignment/presentation/viewmodels/board_detail_viewmodel.dart';
import 'package:flutter_assignment/presentation/viewmodels/board_form_viewmodel.dart';
import 'package:flutter_assignment/presentation/viewmodels/board_list_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/constants/api_constants.dart';
import '../../../core/utils/validators.dart';

class BoardFormScreen extends ConsumerStatefulWidget {
  final int? boardId;

  const BoardFormScreen({super.key, this.boardId});

  @override
  ConsumerState<BoardFormScreen> createState() => _BoardFormScreenState();
}

class _BoardFormScreenState extends ConsumerState<BoardFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  String? _selectedCategory;
  File? _selectedImage;
  String? _existingImageUrl;
  final ImagePicker _picker = ImagePicker();
  bool _isLoading = false;

  bool get isEditMode => widget.boardId != null;

  @override
  void initState() {
    super.initState();
    if (isEditMode) {
      _loadBoard();
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  Future<void> _loadBoard() async {
    setState(() => _isLoading = true);

    final boardState = ref.read(boardDetailViewModelProvider(widget.boardId!));

    if (boardState.board == null) {
      await ref
          .read(boardDetailViewModelProvider(widget.boardId!).notifier)
          .loadBoard();
    }

    final board = ref.read(boardDetailViewModelProvider(widget.boardId!)).board;

    if (board != null) {
      _titleController.text = board.title;
      _contentController.text = board.content;
      _selectedCategory = board.category;
      _existingImageUrl = board.imageUrl;
    }

    setState(() => _isLoading = false);
  }

  Future<void> _pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1920,
        maxHeight: 1080,
        imageQuality: 85,
      );

      if (image != null) {
        setState(() {
          _selectedImage = File(image.path);
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('이미지 선택 실패: $e'), backgroundColor: Colors.red),
        );
      }
    }
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    final authState = ref.read(authViewModelProvider);
    final userEmail = authState.user?.email;

    if (userEmail == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('로그인 정보를 찾을 수 없습니다'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final success = isEditMode
        ? await ref.read(boardFormViewModelProvider.notifier).updateBoard(
      id: widget.boardId!,
      title: _titleController.text.trim(),
      content: _contentController.text.trim(),
      category: _selectedCategory!,
      image: _selectedImage,
    )
        : await ref.read(boardFormViewModelProvider.notifier).createBoard(
      userEmail: userEmail,
      title: _titleController.text.trim(),
      content: _contentController.text.trim(),
      category: _selectedCategory!,
      image: _selectedImage,
    );

    if (!mounted) return;

    if (success) {
      // 커뮤니티 목록 새로고침
      ref.read(boardListViewModelProvider.notifier).loadBoards(refresh: true);

      // 수정 모드인 경우 상세 페이지도 새로고침
      if (isEditMode) {
        await ref
            .read(boardDetailViewModelProvider(widget.boardId!).notifier)
            .loadBoard();
      }

      final message = ref.read(boardFormViewModelProvider).successMessage;
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message ?? '완료되었습니다'),
            backgroundColor: Colors.green,
          ),
        );

        ref.read(boardFormViewModelProvider.notifier).clearMessages();

        // 수정 시에는 상세 페이지로, 생성 시에는 목록으로
        if (isEditMode) {
          context.go('/board/${widget.boardId}');
        } else {
          context.go('/');
        }
      }
    } else {
      final error = ref.read(boardFormViewModelProvider).error;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error ?? '작업에 실패했습니다'),
          backgroundColor: Colors.red,
        ),
      );
      ref.read(boardFormViewModelProvider.notifier).clearMessages();
    }
  }

  @override
  Widget build(BuildContext context) {
    final formState = ref.watch(boardFormViewModelProvider);
    final categories = ref.watch(boardListViewModelProvider).categories;

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          isEditMode ? '게시글 수정' : '게시글 작성',
          style: const TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => context.pop(),
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DropdownButtonFormField<String>(
                value: _selectedCategory,
                decoration: InputDecoration(
                  labelText: '카테고리',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  prefixIcon: const Icon(Icons.category),
                ),
                items: categories.entries.map((entry) {
                  return DropdownMenuItem(
                    value: entry.key,
                    child: Text(entry.value),
                  );
                }).toList(),
                onChanged: formState.isLoading
                    ? null
                    : (value) {
                  setState(() {
                    _selectedCategory = value;
                  });
                },
                validator: Validators.validateCategory,
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: '제목',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  prefixIcon: const Icon(Icons.title),
                ),
                validator: Validators.validateTitle,
                enabled: !formState.isLoading,
                maxLength: 100,
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: _contentController,
                decoration: InputDecoration(
                  labelText: '내용',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  alignLabelWithHint: true,
                ),
                maxLines: 10,
                validator: Validators.validateContent,
                enabled: !formState.isLoading,
              ),
              const SizedBox(height: 16),

              const Text(
                '이미지 (선택사항)',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),

              if (_selectedImage != null)
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.file(
                        _selectedImage!,
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: IconButton(
                        icon: const Icon(Icons.close),
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.black54,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: formState.isLoading
                            ? null
                            : () {
                          setState(() {
                            _selectedImage = null;
                          });
                        },
                      ),
                    ),
                  ],
                )
              else if (_existingImageUrl != null && isEditMode)
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        '${ApiConstants.baseUrl}$_existingImageUrl',
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: 200,
                            color: Colors.grey[300],
                            child: const Center(
                              child: Icon(
                                Icons.broken_image,
                                size: 64,
                                color: Colors.grey,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: IconButton(
                        icon: const Icon(Icons.close),
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.black54,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: formState.isLoading
                            ? null
                            : () {
                          setState(() {
                            _existingImageUrl = null;
                          });
                        },
                      ),
                    ),
                  ],
                )
              else
                OutlinedButton.icon(
                  onPressed: formState.isLoading ? null : _pickImage,
                  icon: const Icon(Icons.image),
                  label: const Text('이미지 선택'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    side: BorderSide(color: Colors.grey.shade300),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              const SizedBox(height: 32),

              ElevatedButton(
                onPressed: formState.isLoading ? null : _submit,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: formState.isLoading
                    ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
                    : Text(
                  isEditMode ? '수정하기' : '등록하기',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}