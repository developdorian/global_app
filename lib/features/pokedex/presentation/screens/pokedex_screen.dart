import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:global_app/features/pokedex/presentation/widgets/widgets.dart';
import 'package:global_app/features/pokedex/presentation/providers/pokemon_list_provider.dart';

class PokedexScreen extends ConsumerWidget {
  const PokedexScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonAsync = ref.watch(pokemonListProvider);
    return pokemonAsync.when(
      data: (pokemonList) => ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemCount: pokemonList.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final pokemon = pokemonList[index];
          return CustomCardWidget(pokemon: pokemon);
        },
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(child: Text(error.toString())),
    );
  }
}