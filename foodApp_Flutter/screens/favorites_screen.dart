import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/food_provider.dart';
import 'details_screen.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FoodProvider>(context);
    final favorites = provider.favorites;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Favorites'),
      ),
      body: favorites.isEmpty
          ? const Center(child: Text('No favorites yet.'))
          : ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (_, index) {
                final item = favorites[index];
                return Card(
                  child: ListTile(
                    leading: Image.asset(item.image, width: 50),
                    title: Text(item.name),
                    subtitle: Text(item.category),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => provider.toggleFavorite(item),
                    ),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailsScreen(item: item),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
