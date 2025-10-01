class PokemonDetailResponse {
  final int id;
  final String name;
  final Map<String, dynamic> sprites;
  final List<dynamic> types;

  PokemonDetailResponse({
    required this.id,
    required this.name,
    required this.sprites,
    required this.types,
  });

  factory PokemonDetailResponse.fromJson(Map<String, dynamic> json) {
    return PokemonDetailResponse(
      id: json['id'],
      name: json['name'],
      sprites: json['sprites'],
      types: json['types'],
    );
  }
}
