import 'package:flutter/material.dart';
import 'package:product_show/views/productDetails.dart';
import 'package:provider/provider.dart';

import '../viewModels/product_ViewModel.dart';
import 'widgets/product_card.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProductViewModel>(context, listen: false).fetchProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductViewModel>(
      builder: (context, vm, child) {
        return Scaffold(
          appBar: AppBar(title: const Text("Products"),centerTitle: true,),
          body: vm.isLoading
              ? const Center(child: CircularProgressIndicator())
              : vm.errorMessage != null
              ? Center(child: Text(vm.errorMessage!))
              : GridView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: vm.products.length,
            gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.80,
            ),
            itemBuilder: (context, index) {
              final product = vm.products[index];

              return ProductCard(
                id: product.id,
                title: product.title,
                imageUrl: product.imageUrl,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProductDetailScreen(
                        id: product.id,
                        title: product.title,
                        imageUrl: product.imageUrl,
                      ),
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
