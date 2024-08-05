import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import '../model/flower.dart';
import '../provider/cart_provider.dart';

// Create a global provider container if you need it
final container = ProviderContainer();

class FlowerDetailsScreen extends StatelessWidget {
  final Flower flower;

  const FlowerDetailsScreen({Key? key, required this.flower}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Access the cartProvider from the container
    container.read(cartProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(flower.name),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(flower.imageUrl),
            const SizedBox(height: 16),
            Text(flower.description, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 16),
            Text('\$${flower.price.toStringAsFixed(2)}', style: const TextStyle(fontSize: 24)),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                // Add the flower to the cart
                // cartProvider.addToCart(flower);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}

