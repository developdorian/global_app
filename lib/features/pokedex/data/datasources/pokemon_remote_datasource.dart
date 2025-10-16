import 'package:dio/dio.dart';
import 'package:global_app/features/pokedex/data/models/pokemon_model.dart';
import 'package:global_app/features/pokedex/data/models/pokemon_detail_model.dart';

class PokemonRemoteDataSource {
  final Dio dio;

  PokemonRemoteDataSource(this.dio);

  Future<List<PokemonModel>> fetchPokemons({int offset = 0, int limit = 20}) async {
    final response = await dio.get(
      'https://pokeapi.co/api/v2/pokemon',
      queryParameters: {'offset': offset, 'limit': limit},
    );

    final results = (response.data['results'] as List)
        .map((e) => PokemonModel.fromJson(e))
        .toList();

    return results;
  }

  Future<PokemonDetailModel> fetchPokemonDetail(String name) async {
    final response = await dio.get(
      'https://pokeapi.co/api/v2/pokemon/$name',
    );

    return PokemonDetailModel.fromJson(response.data);
  }
}
