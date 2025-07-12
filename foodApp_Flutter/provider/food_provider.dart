import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/dummy_data.dart';
import '../models/food_item.dart';

class FoodProvider with ChangeNotifier {
  bool _isDarkMode = false;
  List<FoodItem> _favorites = [];

  bool get isDarkMode => _isDarkMode;
  List<FoodItem> get favorites => _favorites;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  void toggleFavorite(FoodItem item) async {
    final prefs = await SharedPreferences.getInstance();
    if (isFavorite(item)) {
      _favorites.removeWhere((f) => f.id == item.id);
    } else {
      _favorites.add(item);
    }
    notifyListeners();
    saveFavorites();
  }

  bool isFavorite(FoodItem item) {
    return _favorites.any((f) => f.id == item.id);
  }

  void saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> ids = _favorites.map((f) => f.id).toList();
    prefs.setStringList('favorites', ids);
  }

  void loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favIds = prefs.getStringList('favorites') ?? [];
    _favorites = dummyFoodItems.where((item) => favIds.contains(item.id)).toList();
    notifyListeners();
  }

  List<FoodItem> getFoodByCategory(String category) {
    return dummyFoodItems.where((item) => item.category == category).toList();
  }

  List<FoodItem> search(String query) {
    return dummyFoodItems.where((item) =>
        item.name.toLowerCase().contains(query.toLowerCase())).toList();
  }
}
