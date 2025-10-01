class Ability {
  final String name;

  Ability({required this.name});

  factory Ability.fromMap(Map<String, dynamic> map) {
    final abilityMap = map['ability'] as Map<String, dynamic>;
    return Ability(
      name: abilityMap['name'] as String,
    );
  }
}