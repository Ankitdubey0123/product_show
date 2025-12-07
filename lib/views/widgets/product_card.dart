import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewModels/product_ViewModel.dart';

class ProductCard extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final VoidCallback onTap;

  const ProductCard({
    super.key,
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<ProductViewModel>(context);

    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Stack(
          children: [
            Column(
              children: [
                // Hero animation for image
                Hero(
                  tag: id,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                    child: Image.network(
                      imageUrl,
                      height: 300,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            // Favorite toggle on top right
            Positioned(
              top: 8,
              right: 8,
              child: IconButton(
                icon: Icon(
                  vm.isFavorite(id) ? Icons.favorite : Icons.favorite_border,
                  color: vm.isFavorite(id) ? Colors.red : Colors.grey[700],
                ),
                onPressed: () {
                  vm.toggleFavorite(id);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
