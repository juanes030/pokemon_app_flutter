import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:poke_info/domain/entities/pokemon.dart';
import 'pokemon_repository_provider.dart';

part 'pokemon_list_provider.g.dart';

@riverpod
Future<List<Pokemon>> pokemonList(
  PokemonListRef ref, {
  int limit = 20,
  int offset = 0,
}) async {
  final repo = ref.watch(pokemonRepositoryProvider);
  return repo.getPokemonList(limit: limit, offset: offset);
}
