import 'package:global_app/features/pokedex/data/datasources/pokemon_remote_datasource.dart';
import 'package:global_app/features/pokedex/data/models/pokemon_model.dart';
import 'package:global_app/features/pokedex/data/models/pokemon_detail_model.dart';
import 'package:global_app/features/pokedex/domain/entities/pokemon_entity.dart';
import 'package:global_app/features/pokedex/domain/entities/pokemon_detail_entity.dart';
import 'package:global_app/features/pokedex/domain/repositories/pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonRemoteDataSource remoteDataSource;

  PokemonRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<PokemonEntity>> getPokemons({int offset = 0, int limit = 20}) async {
    final models = await remoteDataSource.fetchPokemons(offset: offset, limit: limit);
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<PokemonDetailEntity> getPokemonDetail(String name) async {
    final model = await remoteDataSource.fetchPokemonDetail(name);
    return model.toEntity();
  }
}
