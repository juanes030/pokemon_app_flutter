import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_info/domain/entities/pokemon.dart';

class FavoritesNotifier extends StateNotifier<List<Pokemon>> {
  FavoritesNotifier() : super([]);

  void toggleFavorite(Pokemon pokemon) {
    if (state.any((p) => p.id == pokemon.id)) {
      state = state.where((p) => p.id != pokemon.id).toList();
    } else {
      state = [...state, pokemon];
    }
  }

  bool isFavorite(int pokemonId) =>
      state.any((pokemon) => pokemon.id == pokemonId);
}

final favoritesProvider =
    StateNotifierProvider<FavoritesNotifier, List<Pokemon>>((ref) {
  return FavoritesNotifier();
});
