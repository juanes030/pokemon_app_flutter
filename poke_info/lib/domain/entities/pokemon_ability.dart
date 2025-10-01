class Ability {
  final String name;

  Ability({required this.name});

  // Método de mapeo de JSON (fromMap/fromJson)
  factory Ability.fromMap(Map<String, dynamic> map) {
    // Tomamos el 'name' del mapa anidado 'ability'
    final abilityMap = map['ability'] as Map<String, dynamic>;
    return Ability(
      name: abilityMap['name'] as String,
    );
  }
}