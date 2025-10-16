import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:global_app/app/theme/app_constants.dart';
import 'package:global_app/app/theme/app_theme.dart';
import 'package:global_app/core/widgets/pokemon_card_skeleton.dart';
import 'package:global_app/features/pokedex/domain/entities/pokemon_entity.dart';
import 'package:global_app/features/pokedex/presentation/widgets/elements_widget.dart';
import 'package:global_app/features/pokedex/presentation/providers/pokemon_detail_provider.dart';
import 'package:global_app/features/pokedex/presentation/providers/favorites_provider.dart';
import 'package:global_app/features/pokedex/presentation/screens/detail_screen.dart';
import 'package:global_app/core/utils/string_utils.dart';

class CustomCardWidget extends ConsumerWidget {
  const CustomCardWidget({super.key, required this.pokemon});

  final PokemonEntity pokemon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = pokemon.name;
    final pokemonDetailAsync = ref.watch(pokemonDetailProvider(name));

    return pokemonDetailAsync.when(
      data: (pokemonDetail) {
        final isFavorite =
            ref.watch(isFavoritePokemonProvider(pokemonDetail.id));
        final id = pokemonDetail.id;
        final imageUrl =
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';

        // Get primary type color
        final primaryType = pokemonDetail.types.isNotEmpty
            ? pokemonDetail.types.first.name
            : 'normal';
        final typeColor = AppConstants.getTypeColor(primaryType);

        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DetailScreen(
                  name: pokemonDetail.name,
                  pokemonDetail: pokemonDetail,
                ),
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
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
                          StringUtils.capitalize(pokemonDetail.name),
                          style: AppTheme.textTheme.headlineMedium,
                        ),
                        // Types
                        Row(
                          children: pokemonDetail.types.map((type) {
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
                                return LinearGradient(
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
                      child: GestureDetector(
                        onTap: () {
                          ref
                              .read(favoritesNotifierProvider.notifier)
                              .toggleFavorite(
                                pokemonDetail,
                                isFavorite,
                              );
                        },
                        child: SvgPicture.asset(
                          isFavorite
                              ? AppConstants.heartRedFavLogo
                              : AppConstants.heartBasicFavLogo,
                          width: 32,
                          height: 32,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
      loading: () => const PokemonCardSkeleton(),
      error: (error, stackTrace) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        width: double.infinity,
        height: 102,
        decoration: BoxDecoration(
          color: Colors.red.withOpacity(0.3),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(child: Text('Error: ${error.toString()}')),
      ),
    );
  }
}
