import 'package:go_router/go_router.dart';
import 'package:poke_info/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/pokemonList',
      builder: (context, state) => const PokemonListScreen(),
    ),
  ]
);