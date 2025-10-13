import 'package:flutter/material.dart';
import 'package:global_app/app/theme/app_constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: Image(
          image: AssetImage(AppConstants.pokeballSplashImage),
        ),
      ),
    );
  }
}