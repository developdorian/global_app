import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:global_app/app/localization/l10n/app_localizations.dart';
import 'package:global_app/app/theme/app_constants.dart';
import 'package:global_app/app/theme/app_theme.dart';
import 'package:global_app/features/pokedex/domain/entities/pokemon_detail_entity.dart';
import 'package:global_app/features/pokedex/presentation/widgets/elements_widget.dart';
import 'package:global_app/features/pokedex/presentation/providers/favorites_provider.dart';
import 'package:global_app/core/utils/string_utils.dart';
import 'package:global_app/core/utils/pokemon_type_helper.dart';

class DetailScreen extends ConsumerWidget {
  const DetailScreen({
    super.key,
    required this.name,
    required this.pokemonDetail,
  });

  final String name;
  final PokemonDetailEntity pokemonDetail;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final id = pokemonDetail.id;
    final imageUrl =
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';
    
    final primaryType = pokemonDetail.types.isNotEmpty 
        ? pokemonDetail.types.first.name 
        : 'normal';
    final typeColor = AppConstants.getTypeColor(primaryType);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: typeColor,
        
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          Consumer(
            builder: (context, ref, child) {
              final isFavorite = ref.watch(isFavoritePokemonProvider(pokemonDetail.id));
              return IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: Colors.white,
                ),
                onPressed: () {
                  ref.read(favoritesNotifierProvider.notifier).toggleFavorite(
                    pokemonDetail,
                    isFavorite,
                  );
                },
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: SemiCircleClipper(),
                  child: Container(
                    width: double.infinity,
                    height: 250,
                    decoration: BoxDecoration(
                      color: typeColor,
                    ),
                  ),
                ),
                ShaderMask(
                  shaderCallback: (bounds) {
                    return LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.white, Colors.white10],
                    ).createShader(bounds);
                  },
                  child: Center(
                    child: SvgPicture.asset(
                      AppConstants.getTypeLogo(primaryType),
                      fit: BoxFit.contain,
                      height: 170,
                      width: 170,
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: 10,
                  child: Center(
                    child: Image.network(
                      imageUrl,
                      height: 260,
                      width: 260,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            // Details section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  Text(
                    StringUtils.capitalize(name),
                    style: AppTheme.textTheme.displayLarge?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'N°${StringUtils.formatNumber(id)}',
                    style: AppTheme.textTheme.titleMedium?.copyWith(
                      color: AppColors.textTertiary,
                    ),
                  ),

                  const SizedBox(height: 16),
                  Row(
                    children: pokemonDetail.types.map((type) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ElementWidget(
                          color: AppConstants.getTypeColor(type.name),
                          logo: AppConstants.getTypeLogo(type.name),
                          element: StringUtils.capitalize(type.name),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Tiene una semilla de planta en la espalda desde que nace. La semilla crece lentamente.',
                    style: AppTheme.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 16),
                  const Divider(
                    color: AppConstants.kDividerColor,
                    thickness: 1,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      _buildStructureUi(
                        l10n.detailPokemonWeight.toUpperCase(),
                        "${pokemonDetail.weight} kg",
                        AppConstants.weightLogo,
                      ),
                      const SizedBox(width: 24),
                      _buildStructureUi(
                        l10n.detailPokemonHeight.toUpperCase(),
                        "${pokemonDetail.height} m",
                        AppConstants.heightLogo,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      _buildStructureUi(
                        l10n.detailPokemonCategory.toUpperCase(),
                        "CATEGORIA",
                        AppConstants.categoryLogo,
                      ),
                      const SizedBox(width: 24),
                      _buildStructureUi(
                        l10n.detailPokemonAbilities.toUpperCase(),
                        "HABILIDADES",
                        AppConstants.pokeballLogo,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(l10n.detailPokemonWeakness, style: AppTheme.textTheme.titleLarge), 
                  const SizedBox(height: 16),
                  _buildWeaknessesGrid(
                    PokemonTypeHelper.calculateWeaknesses(
                      pokemonDetail.types.map((type) => type.name).toList(),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildWeaknessesGrid(List<String> weaknesses) {
  if (weaknesses.isEmpty) {
    return Text(
      'No tiene debilidades',
      style: AppTheme.textTheme.bodyMedium?.copyWith(
        fontStyle: FontStyle.italic,
        color: Colors.grey,
      ),
    );
  }

  // Group weaknesses into rows of 3
  final rows = <Widget>[];
  for (int i = 0; i < weaknesses.length; i += 3) {
    final rowItems = weaknesses.skip(i).take(3).toList();
    
    rows.add(
      Row(
        children: [
          for (int j = 0; j < rowItems.length; j++) ...[
            Expanded(
              child: ElementWidget(
                color: AppConstants.getTypeColor(rowItems[j]),
                logo: AppConstants.getTypeLogo(rowItems[j]),
                element: StringUtils.capitalize(rowItems[j]),
              ),
            ),
            if (j < rowItems.length - 1) const SizedBox(width: 8),
          ],
          // Add empty spaces if row has less than 3 items
          if (rowItems.length < 3)
            ...List.generate(
              3 - rowItems.length,
              (index) => const Expanded(child: SizedBox()),
            ),
        ],
      ),
    );
    
    if (i + 3 < weaknesses.length) {
      rows.add(const SizedBox(height: 16));
    }
  }

  return Column(
    children: rows,
  );
}

Widget _buildStructureUi(String title, String content, String icon) {
  return Expanded(
    child: Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(icon),
            const SizedBox(width: 6),
            Text(title, style: AppTheme.textTheme.bodySmall),
          ],
        ),
        const SizedBox(height: 4),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: AppConstants.kDividerColor,
              width: 1.5,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Center(child: Text(content, style: AppTheme.textTheme.titleLarge)),
          ),
        ),
      ],
    ),
  );
}

class SemiCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    
    path.lineTo(0, 0);
    
    path.lineTo(size.width, 0);
    
    path.lineTo(size.width, size.height * 0.4);
    
    path.quadraticBezierTo(
      size.width * 0.5, 
      size.height,      
      0,                
      size.height * 0.4 
    );
    
    path.close();
    
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
