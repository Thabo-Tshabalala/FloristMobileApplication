import 'package:riverpod/riverpod.dart';
import '../model/flower.dart';

final cartProvider = StateNotifierProvider<CartNotifier, List<Flower>>((ref) {
  return CartNotifier();
});

class CartNotifier extends StateNotifier<List<Flower>> {
  CartNotifier() : super([]);

  void addToCart(Flower flower) {
    state = [...state, flower];
  }
}
