import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_info/domain/entities/pokemon.dart';
import 'package:poke_info/presentation/providers/pokemon_detail_provider.dart'; 

class PokemonDetailScreen extends ConsumerWidget {
  // Solo necesitamos el nombre para hacer la petición de detalles
  final String pokemonName; 
  
  // Puedes opcionalmente pasar el objeto Pokemon básico 
  final Pokemon? basicPokemon; 

  const PokemonDetailScreen({
    super.key, 
    required this.pokemonName,
    this.basicPokemon,
  });

  // 🟢 Helper para el color (se mantiene igual)
  Color _backgroundColor(String? type) {
    if (type == null) return Colors.grey.shade300;
    switch (type.toLowerCase()) {
      case "grass": return Colors.green.shade300;
      case "fire": return Colors.orange.shade400;
      case "water": return Colors.blue.shade300;
      case "poison": return Colors.purple.shade300;
      default: return Colors.grey.shade300;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 🧠 Se dispara la llamada a la API usando el nombre del Pokémon.
    final pokemonDetailsAsync = ref.watch(pokemonDetailProvider(pokemonName));

    return Scaffold(
      appBar: AppBar(
        title: Text(pokemonName[0].toUpperCase() + pokemonName.substring(1)),
        centerTitle: true,
        backgroundColor: Colors.transparent, 
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      
      body: pokemonDetailsAsync.when(
        // ⏳ Estado de Carga
        loading: () => const Center(child: CircularProgressIndicator()),
        
        // 🚨 Estado de Error
        error: (err, stack) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error, color: Colors.red, size: 50),
                  const SizedBox(height: 10),
                  Text('Error al cargar detalles de $pokemonName: ${err.toString()}'),
                  ElevatedButton(
                    onPressed: () {
                      // Reintenta invalidando el provider específico
                      ref.invalidate(pokemonDetailProvider(pokemonName));
                    },
                    child: const Text('Reintentar'),
                  )
                ],
              ),
            ),
          );
        },
        
        // ✨ Estado de Datos
        data: (Pokemon fullPokemon) {
          final primaryType = fullPokemon.types.isNotEmpty ? fullPokemon.types.first : null;
          final bgColor = _backgroundColor(primaryType);

          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.only(bottom: 30),
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: const BorderRadius.vertical(bottom: Radius.circular(40)),
                  ),
                  child: Column(
                    children: [
                      // 🖼 Imagen Principal con Hero tag
                      Hero( 
                        tag: 'pokemon-${fullPokemon.id}',
                        child: Image.network(
                          fullPokemon.imageUrl,
                          height: 250,
                          fit: BoxFit.contain,
                        ),
                      ),
                      // ... (Información básica y tipos, se mantiene igual)
                      Text(
                        'N°${fullPokemon.id.toString().padLeft(3, '0')}',
                        style: const TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      Text(
                        fullPokemon.name[0].toUpperCase() + fullPokemon.name.substring(1),
                        style: const TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Wrap(
                        spacing: 8,
                        children: fullPokemon.types.map((type) {
                          return Chip(
                            label: Text(type),
                            labelStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            backgroundColor: bgColor,
                            shape: const StadiumBorder(side: BorderSide(color: Colors.white, width: 2)),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
              
              // 📊 Sección de Datos Detallados
              SliverPadding(
                padding: const EdgeInsets.all(20),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    // --- Información Básica ---
                    _DetailSection(
                      title: "Información Básica",
                      children: [
                        // Se comprueba si los campos son nulos antes de intentar acceder
                        if (fullPokemon.height != null)
                          _DetailRow(
                            label: 'Altura', 
                            // API devuelve dm, convertimos a metros (m)
                            value: '${(fullPokemon.height! / 10).toStringAsFixed(1)} m'
                          ),
                        if (fullPokemon.weight != null)
                          _DetailRow(
                            label: 'Peso', 
                            // API devuelve hg, convertimos a kilogramos (kg)
                            value: '${(fullPokemon.weight! / 10).toStringAsFixed(1)} kg'
                          ),
                        
                        // Muestra habilidades, asumiendo que el modelo Ability
                        // tiene la propiedad 'name'.
                        if (fullPokemon.abilities != null && fullPokemon.abilities!.isNotEmpty)
                          _DetailRow(
                            label: 'Habilidades', 
                            value: fullPokemon.abilities!.map((a) => a.name[0].toUpperCase() + a.name.substring(1)).join(', ')
                          ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    
                    // --- Estadísticas Base ---
                    if (fullPokemon.stats != null && fullPokemon.stats!.isNotEmpty)
                      _DetailSection(
                        title: "Estadísticas Base",
                        children: fullPokemon.stats!
                          .map((stat) => _StatBar(
                            // Se formatea el nombre de la estadística para que sea más legible (ej: HP, ATTACK)
                            label: stat.name.toUpperCase().replaceAll('-', ' '), 
                            value: stat.baseStat
                          )).toList(),
                      ),
                  ]),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// Los widgets auxiliares (_DetailSection, _DetailRow, _StatBar) se mantienen igual

class _DetailSection extends StatelessWidget {
// ... (código anterior)
  final String title;
  final List<Widget> children;
  const _DetailSection({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const Divider(thickness: 1.5),
        ...children,
      ],
    );
  }
}

class _DetailRow extends StatelessWidget {
// ... (código anterior)
  final String label;
  final String value;
  const _DetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
        ],
      ),
    );
  }
}

class _StatBar extends StatelessWidget {
// ... (código anterior)
  final String label;
  final int value;
  const _StatBar({required this.label, required this.value});

  static const int maxStat = 255; 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          SizedBox(
            width: 90, // Aumentado ligeramente para nombres de estadísticas más largos
            child: Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: 40,
            child: Text(value.toString().padLeft(3, '0'), textAlign: TextAlign.right),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: LinearProgressIndicator(
              value: value / maxStat,
              backgroundColor: Colors.grey[300],
              // Usar colores condicionales ayuda a visualizar rápidamente el poder
              color: value > 100 ? Colors.green.shade400 : Colors.blue.shade400,
              minHeight: 8,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ],
      ),
    );
  }
}