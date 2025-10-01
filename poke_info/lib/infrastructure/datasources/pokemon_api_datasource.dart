import 'package:dio/dio.dart';
import 'package:poke_info/infrastructure/mappers/pokemon_mapper.dart';
import '../../domain/datasources/pokemon_datasource.dart';
import '../../domain/entities/pokemon.dart';
import '../models/pokemon_list_response.dart';
import '../models/pokemon_detail_response.dart';

class PokemonApiDatasource implements PokemonDatasource {
  final Dio _dio;

  PokemonApiDatasource({Dio? dio})
      : _dio = dio ?? Dio(BaseOptions(baseUrl: "https://pokeapi.co/api/v2/"));

  @override
  Future<List<Pokemon>> getPokemonList({int limit = 10, int offset = 0}) async {
    final response = await _dio.get("pokemon", queryParameters: {
      "limit": limit,
      "offset": offset,
    });

    final model = PokemonListResponse.fromJson(response.data);
    return PokemonMapper.listToEntity(model);
  }

  @override
  Future<Pokemon> getPokemonDetail(String name) async {
    final response = await _dio.get("pokemon/$name");

    final model = PokemonDetailResponse.fromJson(response.data);
    return PokemonMapper.detailToEntity(model);
  }
}
