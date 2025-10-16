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

    GoRoute(
      path: '/pokedex',
      name: 'pokedex',
      builder: (context, state) => const PokedexScreen(),
    ),

    GoRoute(
      path: '/primary',
      name: 'primary_screen',
      builder: (context, state) => const PrimaryScreen(),
    ),

    GoRoute(
      path: '/onboarding',
      name: 'onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
  ],
);
