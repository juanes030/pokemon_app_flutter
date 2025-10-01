import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:poke_info/domain/entities/pokemon.dart';
import 'pokemon_repository_provider.dart';

part 'pokemon_detail_provider.g.dart';

@riverpod
Future<Pokemon> pokemonDetail(
  PokemonDetailRef ref,
  String pokemonName, // 👈 cambio aquí
) async {
  final repo = ref.watch(pokemonRepositoryProvider);
  return repo.getPokemonDetail(pokemonName);
}
