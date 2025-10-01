import '../entities/pokemon.dart';

abstract class PokemonRepository {
  Future<List<Pokemon>> getPokemonList({int limit = 10, int offset = 0});
  Future<Pokemon> getPokemonDetail(String name);
}