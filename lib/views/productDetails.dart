import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewModels/product_ViewModel.dart';

class ProductDetailScreen extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  const ProductDetailScreen({
    super.key,
    required this.id,
    required this.title,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<ProductViewModel>(context);
    final isFavorite = vm.isFavorite(id);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.black,
            ),
            onPressed: () {
              vm.toggleFavorite(id);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Hero animation for image
          Hero(
            tag: id,
            child: Image.network(
              imageUrl,
              width: double.infinity,
              height: 400,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
