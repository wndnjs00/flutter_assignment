import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/presentation/viewmodels/auth_viewmodel.dart';
import 'package:flutter_assignment/presentation/viewmodels/board_form_viewmodel.dart';
import 'package:flutter_assignment/presentation/viewmodels/board_list_viewmodel.dart';
import 'package:flutter_assignment/presentation/views/form/widgets/category_dropdown.dart';
import 'package:flutter_assignment/presentation/views/form/widgets/title_text_field.dart';
import 'package:flutter_assignment/presentation/views/form/widgets/content_text_field.dart';
import 'package:flutter_assignment/presentation/views/form/widgets/image_picker_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

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

  bool get isEditMode => widget.boardId != null;

  @override
  void initState() {
    super.initState();
    if (isEditMode) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref
            .read(boardFormViewModelProvider.notifier)
            .loadInitialData(boardId: widget.boardId!);
      });
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
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
          _existingImageUrl = null;
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

  // 게시글 작성/수정 제출
  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    final authState = ref.read(authViewModelProvider);
    final userEmail = authState.user?.email;
    await ref.read(boardFormViewModelProvider.notifier).submit(
          isEditMode: isEditMode,
          boardId: widget.boardId,
          userEmail: userEmail,
          title: _titleController.text.trim(),
          content: _contentController.text.trim(),
          category: _selectedCategory!,
          image: _selectedImage,
        );
  }

  // 게시글 작성/수정 화면 UI 구성
  @override
  Widget build(BuildContext context) {
    final formState = ref.watch(boardFormViewModelProvider);
    final categories = ref.watch(boardListViewModelProvider).categories;

    ref.listen<BoardFormState>(
      boardFormViewModelProvider,
      (previous, next) {
        final initialChanged =
            (previous?.initialTitle != next.initialTitle) ||
                (previous?.initialContent != next.initialContent) ||
                (previous?.initialCategory != next.initialCategory) ||
                (previous?.initialImageUrl != next.initialImageUrl);

        if (isEditMode && initialChanged && !next.isLoadingInitialData) {
          if (next.initialTitle != null) _titleController.text = next.initialTitle!;
          if (next.initialContent != null) _contentController.text = next.initialContent!;
          if (mounted) {
            setState(() {
              _selectedCategory = next.initialCategory;
              _existingImageUrl = next.initialImageUrl;
            });
          }
        }

        if (previous?.shouldNavigate != next.shouldNavigate && next.shouldNavigate) {
          final message = next.successMessage;
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message ?? '완료되었습니다'),
                backgroundColor: Colors.green,
              ),
            );

            ref.read(boardFormViewModelProvider.notifier).clearMessages();

            if (isEditMode && next.updatedBoardId != null) {
              context.go('/board/${next.updatedBoardId}');
            } else if (!isEditMode && next.createdBoardId != null) {
              context.go('/');
            }
          }
        }
        
        if (previous?.error != next.error && next.error != null && !next.isLoading) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(next.error ?? '작업에 실패했습니다'),
                backgroundColor: Colors.red,
              ),
            );
            ref.read(boardFormViewModelProvider.notifier).clearMessages();
          }
        }
      },
    );

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
      body: formState.isLoadingInitialData
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CategoryDropdown(
                selectedCategory: _selectedCategory,
                categories: categories,
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value;
                  });
                },
                isLoading: formState.isLoading,
              ),
              const SizedBox(height: 16),
              TitleTextField(
                controller: _titleController,
                isLoading: formState.isLoading,
              ),
              const SizedBox(height: 16),
              ContentTextField(
                controller: _contentController,
                isLoading: formState.isLoading,
              ),
              const SizedBox(height: 16),
              ImagePickerWidget(
                selectedImage: _selectedImage,
                existingImageUrl: _existingImageUrl,
                isEditMode: isEditMode,
                isLoading: formState.isLoading,
                onPickImage: _pickImage,
                onRemoveSelectedImage: () {
                  setState(() {
                    _selectedImage = null;
                  });
                },
                onRemoveExistingImage: () {
                  setState(() {
                    _existingImageUrl = null;
                  });
                },
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
