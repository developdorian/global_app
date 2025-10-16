import 'package:global_app/features/pokedex/domain/entities/pokemon_detail_entity.dart';
import 'package:global_app/features/pokedex/domain/repositories/pokemon_repository.dart';

class GetPokemonDetail {
  final PokemonRepository repository;

  GetPokemonDetail(this.repository);

  Future<PokemonDetailEntity> call(String name) async {
    return await repository.getPokemonDetail(name);
  }
}
