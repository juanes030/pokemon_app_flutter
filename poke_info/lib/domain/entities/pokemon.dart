// Archivo: domain/entities/pokemon.dart (Versión Final)

import 'pokemon_stat.dart'; 
import 'pokemon_ability.dart';

class Pokemon {
  final int id;
  final String name;
  final String imageUrl;
  final List<String> types;

  // 🆕 Campos para el detalle
  // Vienen como enteros (dm y hg). Lo dejamos en int para mapear el JSON directo,
  // y lo convertiremos a m/kg en la presentación (pantalla).
  final int? height; 
  final int? weight;
  final List<PokemonStat>? stats; 
  final List<Ability>? abilities; // 👈 ¡Campo que causaba error!

  Pokemon({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.types,
    // Hacemos opcionales para que la lista original no se rompa
    this.height, 
    this.weight,
    this.stats,
    this.abilities,
  });

  // Este constructor o factory es el que usaría tu repositorio
  factory Pokemon.fromDetailJson(Map<String, dynamic> json) {
    // Mapeo de tipos
    final List<String> types = (json['types'] as List)
        .map((t) => t['type']['name'] as String)
        .toList();

    // Mapeo de estadísticas
    final List<PokemonStat> stats = (json['stats'] as List)
        .map((s) => PokemonStat.fromMap(s as Map<String, dynamic>))
        .toList();

    // Mapeo de habilidades
    final List<Ability> abilities = (json['abilities'] as List)
        .map((a) => Ability.fromMap(a as Map<String, dynamic>))
        .toList();

    // La URL de la imagen (sprites)
    // Usaremos la versión oficial, pero la URL de la lista puede ser diferente,
    // así que por seguridad, mantenemos la que venga del argumento (si es una API
    // que devuelve el objeto completo desde el detalle).
    final String defaultImageUrl = json['sprites']['other']['official-artwork']['front_default'] as String;

    return Pokemon(
      id: json['id'] as int,
      name: json['name'] as String,
      // **IMPORTANTE**: Si tu lista usa la URL del objeto Pokemon, asegúrate 
      // de que este constructor de detalle devuelva la URL correcta, o usa la
      // que ya tenías en el objeto `basicPokemon` al navegar. Para este caso,
      // usaremos la URL oficial que viene en el detalle.
      imageUrl: defaultImageUrl, 
      types: types,
      // Mapeo de nuevos campos
      height: json['height'] as int?,
      weight: json['weight'] as int?,
      stats: stats,
      abilities: abilities,
    );
  }
}