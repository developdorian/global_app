import 'package:global_app/features/pokedex/domain/entities/pokemon_species_entity.dart';
import 'package:global_app/features/pokedex/domain/repositories/pokemon_repository.dart';

class GetPokemonSpecies {
  final PokemonRepository repository;

  GetPokemonSpecies(this.repository);

  Future<PokemonSpeciesEntity> call(int id, String languageCode) {
    return repository.getPokemonSpecies(id, languageCode);
  }
}
