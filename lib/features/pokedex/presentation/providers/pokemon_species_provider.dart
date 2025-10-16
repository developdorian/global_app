import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:global_app/app/providers/locale_provider.dart';
import 'package:global_app/features/pokedex/domain/entities/pokemon_species_entity.dart';
import 'package:global_app/features/pokedex/domain/usecases/get_pokemon_species.dart';
import 'package:global_app/features/pokedex/presentation/providers/pokemon_list_provider.dart';

// 🔹 Use Case Provider
final getPokemonSpeciesProvider = Provider<GetPokemonSpecies>(
  (ref) => GetPokemonSpecies(ref.read(pokemonRepositoryProvider)),
);

// 🔹 Family Provider for fetching Pokemon species by ID with locale support
final pokemonSpeciesProvider = FutureProvider.autoDispose.family<PokemonSpeciesEntity, int>((ref, id) async {
  final getSpecies = ref.read(getPokemonSpeciesProvider);
  final locale = ref.watch(localeProvider);
  final languageCode = locale.languageCode;
  
  return getSpecies(id, languageCode);
});
