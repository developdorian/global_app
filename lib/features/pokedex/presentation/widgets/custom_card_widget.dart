import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:global_app/app/theme/app_constants.dart';
import 'package:global_app/app/theme/app_theme.dart';
import 'package:global_app/features/pokedex/domain/entities/pokemon_entity.dart';
import 'package:global_app/features/pokedex/presentation/widgets/elements_widget.dart';

class CustomCardWidget extends StatefulWidget {
  const CustomCardWidget({super.key, required this.pokemon});

  final PokemonEntity pokemon;

  @override 
  State<CustomCardWidget> createState() => _CustomCardWidgetState();
}

class _CustomCardWidgetState extends State<CustomCardWidget> {
  late bool _isFav;

  @override
  void initState() {
    super.initState();
    _isFav = false;
  }

  @override
  Widget build(BuildContext context) {
    final id = widget.pokemon.url.split('/')[6];
    final imageUrl =
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';
    final name = widget.pokemon.name;
    return Container( 
      margin: const EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      height: 102,
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('N°$id', style: AppTheme.textTheme.bodySmall,),
                Text(name, style: AppTheme.textTheme.headlineMedium,),
                Row(
                  children: [
                    ElementWidget(color: Colors.green, logo: AppConstants.grassLogo, element: 'Planta'),
                    const SizedBox(width: 4),
                    ElementWidget(color: Colors.purple, logo: AppConstants.poisonLogo, element: 'Veneno'),
                  ],
                ),
              ],
            ),
          ),
          Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                width: 126,
                height: 102,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Stack(
                    children: [
                      ShaderMask(
                        shaderCallback: (bounds) {
                          return LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.white, Colors.white10],
                          ).createShader(bounds);
                        },
                        child: SvgPicture.asset(
                          AppConstants.grassLogo,
                          width: 200,
                          height: 200,
                        ),
                      ),
                      Center(
                        child: Image.network(imageUrl),
                        // child: Image.asset(
                        //   'assets/images/logos/borrar.png',
                        //   fit: BoxFit.cover,
                        // ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, right: 8.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isFav = !_isFav;
                    });
                  },
                  child: SvgPicture.asset(_isFav ? AppConstants.heartRedFavLogo : AppConstants.heartBasicFavLogo),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}