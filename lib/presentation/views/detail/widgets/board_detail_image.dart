import 'package:flutter/material.dart';
import '../../../../core/constants/api_constants.dart';

class BoardDetailImage extends StatelessWidget {
  final String imageUrl;

  const BoardDetailImage({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      height: 250,
      child: PageView(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              '${ApiConstants.baseUrl}$imageUrl',
              width: double.infinity,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return Container(
                  color: Colors.grey.shade200,
                  child: Center(
                    child: Icon(
                      Icons.image,
                      color: Colors.grey.shade400,
                      size: 48,
                    ),
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.grey.shade200,
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.autorenew,
                      size: 64,
                      color: Colors.grey.shade300,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
