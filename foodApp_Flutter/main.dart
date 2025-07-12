import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/food_provider.dart';
import 'screens/home_screen.dart';
import 'theme/light_theme.dart';
import 'theme/dark_theme.dart';

void main() {
  runApp(const FoodApp());
}

class FoodApp extends StatelessWidget {
  const FoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FoodProvider()..loadFavorites(),
      child: Consumer<FoodProvider>(
        builder: (context, provider, _) {
          return MaterialApp(
            title: 'Food App',
            theme: provider.isDarkMode ? darkTheme : lightTheme,
            debugShowCheckedModeBanner: false,
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
