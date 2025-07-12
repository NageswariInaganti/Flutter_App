import 'package:flutter/material.dart';
import '../models/food_item.dart';

class DetailsScreen extends StatelessWidget {
  final FoodItem item;
  const DetailsScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset(item.image, height: 150)),
            const SizedBox(height: 20),
            Text(
              item.name,
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 10),
            Text(
              'Category: ${item.category}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(item.description),
          ],
        ),
      ),
    );
  }
}
