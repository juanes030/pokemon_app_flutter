import '../../domain/entities/pokemon.dart';
import '../models/pokemon_list_response.dart';
import '../models/pokemon_detail_response.dart';

class PokemonMapper {
  static List<Pokemon> listToEntity(PokemonListResponse model) {
    return model.results.map((e) {
      final id = int.tryParse(e.url.split("/")[6]) ?? 0;
      return Pokemon(
        id: id,
        name: e.name,
        imageUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png",
        types: [], // La lista solo trae nombre+url, no types
      );
    }).toList();
  }

  static Pokemon detailToEntity(PokemonDetailResponse model) {
    return Pokemon(
      id: model.id,
      name: model.name,
      imageUrl: model.sprites["front_default"] ?? "",
      types: model.types.map((t) => t["type"]["name"] as String).toList(),
    );
  }
}
