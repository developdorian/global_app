import 'package:global_app/features/pokedex/domain/entities/pokemon_entity.dart';
import 'package:global_app/features/pokedex/domain/entities/pokemon_detail_entity.dart';
import 'package:global_app/features/pokedex/domain/entities/pokemon_species_entity.dart';
import 'package:global_app/features/pokedex/domain/entities/ability_detail_entity.dart';

abstract class PokemonRepository {
  Future<List<PokemonEntity>> getPokemons({int offset = 0, int limit = 20});
  Future<PokemonDetailEntity> getPokemonDetail(String name);
  Future<PokemonSpeciesEntity> getPokemonSpecies(int id, String languageCode);
  Future<AbilityDetailEntity> getAbilityDetail(String abilityName, String languageCode);
}
