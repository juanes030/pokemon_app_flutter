import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_info/domain/repositories/pokemon_repository.dart';
import 'package:poke_info/infrastructure/repositories/pokemon_repository_impl.dart';
import 'package:poke_info/infrastructure/datasources/pokemon_api_datasource.dart';

final pokemonRepositoryProvider = Provider<PokemonRepository>((ref) {
  final datasource = PokemonApiDatasource();
  return PokemonRepositoryImpl(datasource);
});
