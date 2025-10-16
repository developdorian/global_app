import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:global_app/features/pokedex/domain/entities/pokemon_detail_entity.dart';
import 'package:global_app/features/pokedex/domain/usecases/get_pokemon_detail.dart';
import 'package:global_app/features/pokedex/presentation/providers/pokemon_list_provider.dart';

// 🔹 Use Case Provider
final getPokemonDetailProvider = Provider<GetPokemonDetail>(
  (ref) => GetPokemonDetail(ref.read(pokemonRepositoryProvider)),
);

// 🔹 Family Provider for fetching Pokemon details by name
final pokemonDetailProvider = FutureProvider.autoDispose.family<PokemonDetailEntity, String>((ref, name) async {
  final getDetail = ref.read(getPokemonDetailProvider);
  return getDetail(name);
});
