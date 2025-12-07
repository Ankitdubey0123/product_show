import 'package:flutter/material.dart';
import 'package:product_show/services/api_services.dart';
import 'package:product_show/viewModels/product_ViewModel.dart';
import 'package:product_show/views/productScreen.dart';
import 'package:provider/provider.dart';
import 'repositories/product_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductViewModel(
            repository: ProductRepository(
              apiService: ApiService(),
            ),
          ),
        ),
      ],
      child: MaterialApp(
        title: "Product App",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const ProductListScreen(),
      ),
    );
  }
}
