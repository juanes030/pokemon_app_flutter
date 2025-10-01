import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:poke_info/domain/repositories/pokemon_repository.dart';
import 'package:poke_info/infrastructure/datasources/pokemon_api_datasource.dart';
import 'package:poke_info/infrastructure/repositories/pokemon_repository_impl.dart';

part 'pokemon_repository_provider.g.dart';

@riverpod
PokemonRepository pokemonRepository(PokemonRepositoryRef ref) {
  final datasource = PokemonApiDatasource();
  return PokemonRepositoryImpl(datasource);
}