import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:global_app/app/providers/locale_provider.dart';
import 'package:global_app/features/pokedex/domain/entities/ability_detail_entity.dart';
import 'package:global_app/features/pokedex/domain/usecases/get_ability_detail.dart';
import 'package:global_app/features/pokedex/presentation/providers/pokemon_list_provider.dart';

// 🔹 Use Case Provider
final getAbilityDetailProvider = Provider<GetAbilityDetail>(
  (ref) => GetAbilityDetail(ref.read(pokemonRepositoryProvider)),
);

// 🔹 Family Provider for fetching ability details by name with locale support
final abilityDetailProvider = FutureProvider.autoDispose.family<AbilityDetailEntity, String>((ref, abilityName) async {
  final getAbility = ref.read(getAbilityDetailProvider);
  final locale = ref.watch(localeProvider);
  final languageCode = locale.languageCode;
  
  return getAbility(abilityName, languageCode);
});
