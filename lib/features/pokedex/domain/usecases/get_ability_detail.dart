import 'package:global_app/features/pokedex/domain/entities/ability_detail_entity.dart';
import 'package:global_app/features/pokedex/domain/repositories/pokemon_repository.dart';

class GetAbilityDetail {
  final PokemonRepository repository;

  GetAbilityDetail(this.repository);

  Future<AbilityDetailEntity> call(String abilityName, String languageCode) {
    return repository.getAbilityDetail(abilityName, languageCode);
  }
}
