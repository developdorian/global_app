import 'package:global_app/features/pokedex/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'splash',
      builder: (context, state) => const SplashScreen(),
    ),

    /// Ruta de la lista de Pokemons
    GoRoute(
      path: '/pokedex',
      name: 'pokedex',
      builder: (context, state) => const PokedexScreen(),
    ),

    GoRoute(
      path: '/onboarding',
      name: 'onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),

    /// Ruta de detalle de un Pokemon
    GoRoute(
      path: '/pokedex/:name', // el parámetro dinámico
      name: 'pokemon-detail',
      builder: (context, state) {
        final name = state.pathParameters['name']!;
        return DetailScreen(name: name);
      },
    ),
  ],
);
