 Product Catalog App – Flutter (MVVM Architecture)

A Flutter Product Catalog App built using MVVM architecture, Provider state management, Dio API handling, Hero animations, and Favorite persistence using SharedPreferences.

--- Features

Fetch products from live API
MVVM architecture (Model–View–ViewModel)
Product grid view
Product detail page
Hero animation between grid → detail
Favorite toggle with persistent storage
Local JSON fallback if API fails
Clean folder structure
Provider state management

-- Folder Structure (MVVM)
lib/
├── models/
│     └── product_model.dart
├── services/
│     └── api_service.dart
├── repositories/
│     └── product_repository.dart
├── viewModels/
│     └── product_viewModel.dart
├── views/
│     ├── product_list_screen.dart
│     ├── product_detail_screen.dart
│     └── widgets/
│           └── product_card.dart
└── main.dart

 API Used
https://mock.pavepilot.dev/products
 Asset Fallback
If the API fails, app loads:
assets/products.json


Add to pubspec.yaml:
flutter:
  assets:
    - assets/products.json

-- Tech Used

Flutter
Provider (ChangeNotifier)
MVVM Architecture
Dio (API handling)
SharedPreferences
Hero Animation
Local JSON fallback

-- Run the App
flutter pub get
flutter run

-- Features Covered

API integration
Error handling
Offline fallback
Favorite persistence
State management
Grid + detail flow
Animation between screens

 Conclusion

This project demonstrates a complete Flutter application with clean architecture, smooth animations, API usage, and persistent local storage — meeting all standard assignment requirements.

⭐ Support

If you like this project, please ⭐ the repository!
