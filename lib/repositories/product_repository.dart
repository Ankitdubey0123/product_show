import '../models/product_model.dart';
import '../services/api_services.dart';

class ProductRepository {
  final ApiService apiService;

  ProductRepository({required this.apiService});

  Future<List<ProductModel>> getProducts() async {
    return await apiService.fetchProducts();
  }
}
