import '../../domain/entities/pokemon.dart';
import '../../domain/repositories/pokemon_repository.dart';
import '../../domain/datasources/pokemon_datasource.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonDatasource datasource;

  PokemonRepositoryImpl(this.datasource);

  @override
  Future<List<Pokemon>> getPokemonList({int limit = 10, int offset = 0}) {
    return datasource.getPokemonList(limit: limit, offset: offset);
  }

  @override
  Future<Pokemon> getPokemonDetail(String name) {
    return datasource.getPokemonDetail(name);
  }
}