class PokemonStat {
  final String name;
  final int baseStat;

  PokemonStat({required this.name, required this.baseStat});

  factory PokemonStat.fromMap(Map<String, dynamic> map) {
    final statMap = map['stat'] as Map<String, dynamic>;
    return PokemonStat(
      name: statMap['name'] as String,
      baseStat: map['base_stat'] as int,
    );
  }
}