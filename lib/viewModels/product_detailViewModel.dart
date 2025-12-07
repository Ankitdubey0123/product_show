import 'package:flutter/foundation.dart';
import '../models/product_model.dart';

class ProductDetailViewModel extends ChangeNotifier {
  final ProductModel product;

  bool isFavorite = false;

  ProductDetailViewModel({
    required this.product,
    required bool initialFavoriteState,
  }) {
    isFavorite = initialFavoriteState;
  }

  void toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
