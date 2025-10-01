import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_info/domain/entities/pokemon.dart';
import 'package:poke_info/presentation/providers/favorites_provider.dart';
import 'package:poke_info/presentation/providers/pokemon_list_provider.dart';
import 'package:poke_info/presentation/screens/pokemon_detail/pokemon_detail_screen.dart';

class PokemonListScreen extends ConsumerStatefulWidget {
  const PokemonListScreen({super.key});

  @override
  ConsumerState<PokemonListScreen> createState() => _PokemonListScreenState();
}

class _PokemonListScreenState extends ConsumerState<PokemonListScreen> {
  String query = "";

  @override
  Widget build(BuildContext context) {
    final pokemonsAsync = ref.watch(pokemonListProvider(limit: 20));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Pokédex"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // 🔎 Barra de búsqueda
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Procurar Pokémon...",
                prefixIcon: const Icon(Icons.search),
                suffixIcon: const Icon(Icons.filter_alt_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
              onChanged: (value) {
                setState(() => query = value.toLowerCase());
              },
            ),
          ),

          // 📋 Lista de pokémon
          Expanded(
            child: pokemonsAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),

              // 🚨 Error state personalizado
              error: (err, stack) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.catching_pokemon,
                            size: 80, color: Colors.redAccent),
                        const SizedBox(height: 16),
                        const Text(
                          "Algo salió mal...",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "No se pudo cargar la información en este momento.",
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(fontSize: 16, color: Colors.black54),
                        ),
                        const SizedBox(height: 24),
                        ElevatedButton.icon(
                          onPressed: () {
                            ref.invalidate(pokemonListProvider);
                          },
                          icon: const Icon(Icons.refresh),
                          label: const Text("Reintentar"),
                        ),
                      ],
                    ),
                  ),
                );
              },

              data: (List<Pokemon> pokemons) {
                final filtered = pokemons.where((p) {
                  return p.name.toLowerCase().contains(query);
                }).toList();

                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  itemCount: filtered.length,
                  itemBuilder: (context, index) {
                    final pokemon = filtered[index];
                    return _PokemonCard(pokemon: pokemon);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _PokemonCard extends ConsumerWidget {
  final Pokemon pokemon;
  const _PokemonCard({required this.pokemon});

  // 🟢 Colores según tipo
  Color _backgroundColor(String? type) {
    if (type == null) return Colors.grey.shade300;
    switch (type.toLowerCase()) {
      case "grass":
        return Colors.green.shade300;
      case "fire":
        return Colors.orange.shade400;
      case "water":
        return Colors.blue.shade300;
      case "poison":
        return Colors.purple.shade300;
      default:
        return Colors.grey.shade300;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoritesProvider);
    final isFavorite = favorites.any((p) => p.id == pokemon.id);

    return GestureDetector(
      onTap: () {
        // 🚀 Paso 2: Ejecuta la navegación.
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              // 🎯 Paso 3: Pasa el nombre del Pokémon a la pantalla de detalle.
              // Asumo que tienes importada la pantalla de detalle (PokemonDetailScreen)
              // y que la definiste para aceptar 'pokemonName'.
              return PokemonDetailScreen(
                pokemonName: pokemon.name,
                // Opcional: Puedes pasar el objeto básico para mostrar
                // el nombre/imagen inmediatamente, antes de que carguen los detalles.
                basicPokemon: pokemon, 
              );
            },
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: _backgroundColor(
              pokemon.types.isNotEmpty ? pokemon.types.first : null),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 🆔 Número y nombre
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "N°${pokemon.id.toString().padLeft(3, '0')}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    pokemon.name[0].toUpperCase() + pokemon.name.substring(1),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 6),
                  // 🏷 Chips de tipos
                  Wrap(
                    spacing: 6,
                    children: pokemon.types.map((type) {
                      return Chip(
                        label: Text(type),
                        labelStyle: const TextStyle(color: Colors.white),
                        backgroundColor: _backgroundColor(type),
                        padding:
                            const EdgeInsets.symmetric(horizontal: 8),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
      
            // ❤️ Favorito + 📷 Imagen
            Column(
              children: [
                IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    ref
                        .read(favoritesProvider.notifier)
                        .toggleFavorite(pokemon);
                  },
                ),
                Image.network(
                  pokemon.imageUrl,
                  height: 100,
                  width: 100,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

