
import 'package:global_app/features/pokedex/domain/entities/pokemon_entity.dart';

abstract class PokemonRepository {
  Future<List<PokemonEntity>> getPokemons({int offset = 0, int limit = 20});
}
