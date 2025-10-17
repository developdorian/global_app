import '../entities/pokemon_entity.dart';
import '../repositories/pokemon_repository.dart';

class GetPokemonList {
  final PokemonRepository repository;

  GetPokemonList(this.repository);

  Future<List<PokemonEntity>> call({int offset = 0, int limit = 150}) {
    return repository.getPokemons(offset: offset, limit: limit);
  }
}
