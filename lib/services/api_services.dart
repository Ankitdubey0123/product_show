import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import '../models/product_model.dart';

class ApiService {
  final Dio _dio = Dio();
  final String baseUrl;

  ApiService({this.baseUrl = 'https://mock.pavepilot.dev'});

  Future<List<ProductModel>> fetchProducts() async {
    try {
      // Try fetching from API
      final response = await _dio.get('$baseUrl/products');

      if (response.statusCode == 200 && response.data != null) {
        final List<dynamic> data = response.data;
        return data
            .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
            .toList();
      } else {
        // API returned something invalid → fallback to assets
        return _loadFromAssets();
      }
    } catch (e) {
      print("API fetch failed, loading local JSON: $e");
      return _loadFromAssets();
    }
  }

  Future<List<ProductModel>> _loadFromAssets() async {
    final jsonStr = await rootBundle.loadString('assets/products.json');
    final List<dynamic> jsonList = json.decode(jsonStr);

    return jsonList
        .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
