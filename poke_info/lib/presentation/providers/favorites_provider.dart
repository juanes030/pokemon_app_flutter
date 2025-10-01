import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_info/domain/entities/pokemon.dart';

/// 🔹 Notifier que maneja la lista de favoritos (Pokémon completos)
class FavoritesNotifier extends StateNotifier<List<Pokemon>> {
  FavoritesNotifier() : super([]);

  /// Alternar (agregar/quitar) un pokémon de favoritos
  void toggleFavorite(Pokemon pokemon) {
    if (state.any((p) => p.id == pokemon.id)) {
      // ❌ Si ya está → eliminarlo
      state = state.where((p) => p.id != pokemon.id).toList();
    } else {
      // ✅ Si no está → agregarlo
      state = [...state, pokemon];
    }
  }

  /// Saber si un pokémon está en favoritos
  bool isFavorite(int pokemonId) =>
      state.any((pokemon) => pokemon.id == pokemonId);
}

/// 🔹 Provider global de favoritos
final favoritesProvider =
    StateNotifierProvider<FavoritesNotifier, List<Pokemon>>((ref) {
  return FavoritesNotifier();
});
