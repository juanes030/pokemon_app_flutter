class PokemonListResponse {
  final int count;
  final String? next;
  final String? previous;
  final List<PokemonResult> results;

  PokemonListResponse({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory PokemonListResponse.fromJson(Map<String, dynamic> json) {
    return PokemonListResponse(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: (json['results'] as List)
          .map((item) => PokemonResult.fromJson(item))
          .toList(),
    );
  }
}

class PokemonResult {
  final String name;
  final String url;

  PokemonResult({
    required this.name,
    required this.url,
  });

  factory PokemonResult.fromJson(Map<String, dynamic> json) {
    return PokemonResult(
      name: json['name'],
      url: json['url'],
    );
  }
}
