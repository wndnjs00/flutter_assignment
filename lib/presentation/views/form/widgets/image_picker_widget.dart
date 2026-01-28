import 'dart:io';
import 'package:flutter/material.dart';
import '../../../../core/constants/api_constants.dart';

class ImagePickerWidget extends StatelessWidget {
  final File? selectedImage;
  final String? existingImageUrl;
  final bool isEditMode;
  final bool isLoading;
  final VoidCallback onPickImage;
  final VoidCallback onRemoveSelectedImage;
  final VoidCallback onRemoveExistingImage;

  const ImagePickerWidget({
    super.key,
    required this.selectedImage,
    required this.existingImageUrl,
    required this.isEditMode,
    required this.isLoading,
    required this.onPickImage,
    required this.onRemoveSelectedImage,
    required this.onRemoveExistingImage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '이미지 (선택사항)',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        if (selectedImage != null)
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.file(
                  selectedImage!,
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
                  onPressed: isLoading ? null : onRemoveSelectedImage,
                ),
              ),
            ],
          )
        else if (existingImageUrl != null && isEditMode)
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  '${ApiConstants.baseUrl}$existingImageUrl',
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
                  onPressed: isLoading ? null : onRemoveExistingImage,
                ),
              ),
            ],
          )
        else
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: isLoading ? null : onPickImage,
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
          ),
      ],
    );
  }
}
