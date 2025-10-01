// Archivo: domain/entities/pokemon.dart (Versión Final)

import 'pokemon_stat.dart'; 
import 'pokemon_ability.dart';

class Pokemon {
  final int id;
  final String name;
  final String imageUrl;
  final List<String> types;

  final int? height; 
  final int? weight;
  final List<PokemonStat>? stats; 
  final List<Ability>? abilities;

  Pokemon({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.types,
    this.height, 
    this.weight,
    this.stats,
    this.abilities,
  });

  factory Pokemon.fromDetailJson(Map<String, dynamic> json) {
    final List<String> types = (json['types'] as List)
        .map((t) => t['type']['name'] as String)
        .toList();

    final List<PokemonStat> stats = (json['stats'] as List)
        .map((s) => PokemonStat.fromMap(s as Map<String, dynamic>))
        .toList();

    final List<Ability> abilities = (json['abilities'] as List)
        .map((a) => Ability.fromMap(a as Map<String, dynamic>))
        .toList();

    final String defaultImageUrl = json['sprites']['other']['official-artwork']['front_default'] as String;

    return Pokemon(
      id: json['id'] as int,
      name: json['name'] as String,
      imageUrl: defaultImageUrl, 
      types: types,
      height: json['height'] as int?,
      weight: json['weight'] as int?,
      stats: stats,
      abilities: abilities,
    );
  }
}