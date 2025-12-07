import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/product_model.dart';
import '../repositories/product_repository.dart';

class ProductViewModel extends ChangeNotifier {
  final ProductRepository repository;

  ProductViewModel({required this.repository}) {
    _loadFavorites(); // Load favorites when initialized
  }

  bool isLoading = false;
  String? errorMessage;
  List<ProductModel> products = [];

  // Favorite product IDs (persistent)
  final Set<String> _favoriteProductIds = {};
  Set<String> get favoriteProductIds => _favoriteProductIds;

  // ----------------------------
  // FETCH PRODUCTS LIST
  // ----------------------------
  Future<void> fetchProducts() async {
    if (isLoading) return; // Prevent duplicate calls
    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();

      final fetchedProducts = await repository.getProducts();
      products = fetchedProducts;

      if (products.isEmpty) {
        errorMessage = "No products found";
      }
    } catch (e) {
      errorMessage = "Failed to load products.";
      products = [];
      if (kDebugMode) {
        print("Error fetching products: $e");
      }
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // ----------------------------
  // FAVORITE TOGGLE
  // ----------------------------
  void toggleFavorite(String productId) async {
    if (_favoriteProductIds.contains(productId)) {
      _favoriteProductIds.remove(productId);
    } else {
      _favoriteProductIds.add(productId);
    }

    notifyListeners();

    // Persist favorite IDs
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('favorite_ids', _favoriteProductIds.toList());
  }

  bool isFavorite(String productId) {
    return _favoriteProductIds.contains(productId);
  }

  // ----------------------------
  // LOAD FAVORITES
  // ----------------------------
  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final ids = prefs.getStringList('favorite_ids') ?? [];
    _favoriteProductIds.addAll(ids);
    notifyListeners();
  }
}
