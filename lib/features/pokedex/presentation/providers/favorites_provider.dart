import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:global_app/features/pokedex/data/datasources/favorite_local_datasource.dart';
import 'package:global_app/features/pokedex/data/repositories/favorite_repository_impl.dart';
import 'package:global_app/features/pokedex/domain/entities/pokemon_detail_entity.dart';
import 'package:global_app/features/pokedex/domain/usecases/add_favorite.dart';
import 'package:global_app/features/pokedex/domain/usecases/get_favorites.dart';
import 'package:global_app/features/pokedex/domain/usecases/is_favorite.dart';
import 'package:global_app/features/pokedex/domain/usecases/remove_favorite.dart';
import 'package:global_app/features/pokedex/domain/usecases/watch_favorites.dart';

// 🔹 DataSource Provider
final favoriteLocalDataSourceProvider = Provider<FavoriteLocalDataSource>(
  (ref) => FavoriteLocalDataSource(),
);

// 🔹 Repository Provider
final favoriteRepositoryProvider = Provider<FavoriteRepositoryImpl>(
  (ref) => FavoriteRepositoryImpl(ref.read(favoriteLocalDataSourceProvider)),
);

// 🔹 Use Cases Providers
final addFavoriteProvider = Provider<AddFavorite>(
  (ref) => AddFavorite(ref.read(favoriteRepositoryProvider)),
);

final removeFavoriteProvider = Provider<RemoveFavorite>(
  (ref) => RemoveFavorite(ref.read(favoriteRepositoryProvider)),
);

final isFavoriteProvider = Provider<IsFavorite>(
  (ref) => IsFavorite(ref.read(favoriteRepositoryProvider)),
);

final getFavoritesProvider = Provider<GetFavorites>(
  (ref) => GetFavorites(ref.read(favoriteRepositoryProvider)),
);

final watchFavoritesProvider = Provider<WatchFavorites>(
  (ref) => WatchFavorites(ref.read(favoriteRepositoryProvider)),
);

// 🔹 Stream Provider for UI (reactivo)
final favoritesStreamProvider = StreamProvider<List<PokemonDetailEntity>>((ref) {
  final watchFavorites = ref.read(watchFavoritesProvider);
  return watchFavorites();
});

// 🔹 StateNotifier para manejar el estado de favoritos de cada pokemon
class FavoriteStatusNotifier extends StateNotifier<Map<int, bool>> {
  final IsFavorite isFavoriteUseCase;

  FavoriteStatusNotifier(this.isFavoriteUseCase) : super({});

  Future<bool> checkFavorite(int pokemonId) async {
    // Si ya tenemos el estado en cache, retornarlo
    if (state.containsKey(pokemonId)) {
      return state[pokemonId]!;
    }

    // Si no, consultar y actualizar el estado
    try {
      final isFav = await isFavoriteUseCase(pokemonId);
      state = {...state, pokemonId: isFav};
      return isFav;
    } catch (e) {
      state = {...state, pokemonId: false};
      return false;
    }
  }

  void updateFavoriteStatus(int pokemonId, bool isFavorite) {
    state = {...state, pokemonId: isFavorite};
  }

  void clearCache() {
    state = {};
  }
}

final favoriteStatusNotifierProvider = StateNotifierProvider<FavoriteStatusNotifier, Map<int, bool>>((ref) {
  return FavoriteStatusNotifier(ref.read(isFavoriteProvider));
});

// 🔹 Provider to check if a specific pokemon is favorite (reactivo)
final isFavoritePokemonProvider = Provider.autoDispose.family<bool, int>((ref, pokemonId) {
  // Escuchar cambios en el estado de favoritos
  final favoriteStatusMap = ref.watch(favoriteStatusNotifierProvider);
  
  // Si ya está en el cache, retornar el valor
  if (favoriteStatusMap.containsKey(pokemonId)) {
    return favoriteStatusMap[pokemonId]!;
  }
  
  // Si no está en cache, consultar de forma asíncrona
  final notifier = ref.read(favoriteStatusNotifierProvider.notifier);
  notifier.checkFavorite(pokemonId);
  
  // Mientras tanto, retornar false por defecto
  return false;
});

// 🔹 StateNotifier for managing favorite actions
class FavoritesNotifier extends StateNotifier<AsyncValue<List<PokemonDetailEntity>>> {
  final AddFavorite addFavoriteUseCase;
  final RemoveFavorite removeFavoriteUseCase;
  final GetFavorites getFavoritesUseCase;
  final FavoriteStatusNotifier statusNotifier;

  FavoritesNotifier({
    required this.addFavoriteUseCase,
    required this.removeFavoriteUseCase,
    required this.getFavoritesUseCase,
    required this.statusNotifier,
  }) : super(const AsyncValue.loading()) {
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    state = const AsyncValue.loading();
    try {
      final favorites = await getFavoritesUseCase();
      state = AsyncValue.data(favorites);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> toggleFavorite(PokemonDetailEntity pokemon, bool isFavorite) async {
    try {
      if (isFavorite) {
        await removeFavoriteUseCase(pokemon.id);
        statusNotifier.updateFavoriteStatus(pokemon.id, false);
      } else {
        await addFavoriteUseCase(pokemon);
        statusNotifier.updateFavoriteStatus(pokemon.id, true);
      }
      await loadFavorites();
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}

final favoritesNotifierProvider = StateNotifierProvider<FavoritesNotifier, AsyncValue<List<PokemonDetailEntity>>>((ref) {
  return FavoritesNotifier(
    addFavoriteUseCase: ref.read(addFavoriteProvider),
    removeFavoriteUseCase: ref.read(removeFavoriteProvider),
    getFavoritesUseCase: ref.read(getFavoritesProvider),
    statusNotifier: ref.read(favoriteStatusNotifierProvider.notifier),
  );
});
