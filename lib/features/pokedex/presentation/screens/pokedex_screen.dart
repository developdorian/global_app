import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:global_app/app/localization/l10n/app_localizations.dart';
import 'package:global_app/app/theme/app_theme.dart';
import 'package:global_app/features/pokedex/presentation/screens/screens.dart';
import 'package:global_app/features/pokedex/presentation/widgets/widgets.dart';
import 'package:global_app/features/pokedex/presentation/providers/pokemon_list_provider.dart';
import 'package:global_app/features/pokedex/presentation/providers/search_filter_provider.dart';

class PokedexScreen extends ConsumerWidget {
  const PokedexScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonAsync = ref.watch(filteredPokemonListProvider);
    final filterState = ref.watch(searchFilterProvider);
    final hasActiveFilters = filterState.isSearchActive && filterState.selectedTypes.isNotEmpty;
    final l10n = AppLocalizations.of(context)!;
    return Column(
      children: [
        const SearchBarWidget(),
        Expanded(
          child: pokemonAsync.when(
            data: (pokemonList) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (hasActiveFilters)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: RichText(
                      text: TextSpan(
                        style: AppTheme.textTheme.titleMedium!.copyWith(
                          color: Color(0xFF9E9E9E),
                        ),
                        children: [
                          TextSpan(text: l10n.filterResult),
                          TextSpan(
                            text: ' ${pokemonList.length} ${l10n.filterResult2} ',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          WidgetSpan(
                            child: GestureDetector(
                              onTap: () {
                                ref.read(searchFilterProvider.notifier).clearFilters();
                              },
                              child: Text(
                                l10n.filterDelete,
                                style: AppTheme.textTheme.titleMedium!.copyWith(
                                  color: AppColors.success,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                // Pokemon List
                Expanded(
                  child: ListView.separated(
                    itemCount: pokemonList.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      final pokemon = pokemonList[index];
                      return CustomCardWidget(pokemon: pokemon);
                    },
                  ),
                ),
              ],
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stackTrace) => const PokedexErrorScreen(),
          ),
        ),
      ],
    );
  }
}