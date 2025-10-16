import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:global_app/app/localization/l10n/app_localizations.dart';
import 'package:global_app/app/theme/app_constants.dart';
import 'package:global_app/app/theme/app_theme.dart';
import 'package:global_app/core/utils/string_utils.dart';
import 'package:global_app/features/pokedex/domain/entities/pokemon_detail_entity.dart';
import 'package:global_app/features/pokedex/presentation/providers/favorites_provider.dart';
import 'package:global_app/features/pokedex/presentation/widgets/elements_widget.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final favoritesAsync = ref.watch(favoritesStreamProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.tabbarFavorite),
      ),
      body: favoritesAsync.when(
        data: (favorites) {
          if (favorites.isEmpty) {
            return _buildEmptyState(l10n);
          }
          return ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 16),
            itemCount: favorites.length,
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              final pokemon = favorites[index];
              return _FavoriteCard(pokemon: pokemon);
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: Text('Error: ${error.toString()}'),
        ),
      ),
    );
  }

  Widget _buildEmptyState(AppLocalizations l10n) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 40),
          Image.asset(AppConstants.magikarpImage, height: 250),
          Text(
            l10n.favoritesTitle,
            textAlign: TextAlign.center,
            style: AppTheme.textTheme.displaySmall,
          ),
          const SizedBox(height: 16),
          Text(
            l10n.favoritesDescription,
            textAlign: TextAlign.center,
            style: AppTheme.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}

class _FavoriteCard extends ConsumerWidget {
  const _FavoriteCard({required this.pokemon});

  final PokemonDetailEntity pokemon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = pokemon.id;
    final imageUrl =
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';

    final primaryType = pokemon.types.isNotEmpty
        ? pokemon.types.first.name
        : 'normal';
    final typeColor = AppConstants.getTypeColor(primaryType);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Dismissible(
        key: Key('favorite_${pokemon.id}'),
        direction: DismissDirection.endToStart,
        background: Container(
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(16),
          ),
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 24),
          child: const Icon(
            Icons.delete,
            color: Colors.white,
            size: 32,
          ),
        ),
        onDismissed: (direction) {
          ref.read(favoritesNotifierProvider.notifier).toggleFavorite(
            pokemon,
            true,
          );
        },
        child: Container(
          width: double.infinity,
          height: 102,
          decoration: BoxDecoration(
            color: typeColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(16),
          ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('N°${StringUtils.formatNumber(id)}',
                        style: AppTheme.textTheme.bodySmall),
                    Text(
                      StringUtils.capitalize(pokemon.name),
                      style: AppTheme.textTheme.headlineMedium,
                    ),
                    Row(
                      children: pokemon.types.map((type) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: ElementWidget(
                            color: AppConstants.getTypeColor(type.name),
                            logo: AppConstants.getTypeLogo(type.name),
                            element: StringUtils.capitalize(type.name),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
            Stack(
              alignment: Alignment.topRight,
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 126,
                  height: 102,
                  decoration: BoxDecoration(
                    color: typeColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: ShaderMask(
                          shaderCallback: (bounds) {
                            return const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.white, Colors.white10],
                            ).createShader(bounds);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: SvgPicture.asset(
                              AppConstants.getTypeLogo(primaryType),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Image.network(
                          imageUrl,
                          width: 94,
                          height: 94,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: InkWell(
                    onTap: () {
                      ref.read(favoritesNotifierProvider.notifier).toggleFavorite(
                        pokemon,
                        true,
                      );
                    },
                    borderRadius: BorderRadius.circular(16),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: SvgPicture.asset(
                        AppConstants.heartRedFavLogo,
                        width: 32,
                        height: 32,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
                ),
      ),
    );
  }
}