import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_info/domain/entities/pokemon.dart';
import 'package:poke_info/presentation/providers/favorites_provider.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoritesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Favoritos"),
        centerTitle: true,
      ),
      body: favorites.isEmpty
          ? const _EmptyFavoritesView()
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final pokemon = favorites[index];

                return Dismissible(
                  key: ValueKey(pokemon.id),
                  direction: DismissDirection.endToStart, // Solo izquierda
                  background: Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(Icons.delete, color: Colors.white, size: 30),
                  ),
                  onDismissed: (_) {
                    ref.read(favoritesProvider.notifier).toggleFavorite(pokemon);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("${pokemon.name} eliminado de favoritos"),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                  child: _PokemonCard(pokemon: pokemon),
                );
              },
            ),
    );
  }
}

class _EmptyFavoritesView extends StatelessWidget {
  const _EmptyFavoritesView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.favorite_border, size: 80, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              "No tienes Pokémon favoritos",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Marca tus Pokémon preferidos en la Pokédex para verlos aquí.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}

class _PokemonCard extends StatelessWidget {
  final Pokemon pokemon;
  const _PokemonCard({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Card(    
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 3,
      child: ListTile(
        leading: Image.network(
          pokemon.imageUrl,
          height: 60,
          width: 60,
        ),
        title: Text(
          pokemon.name[0].toUpperCase() + pokemon.name.substring(1),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text("N°${pokemon.id.toString().padLeft(3, '0')}"),
      ),
    );
  }
}
