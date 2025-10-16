import 'package:global_app/features/pokedex/domain/entities/pokemon_detail_entity.dart';
import 'package:global_app/features/pokedex/domain/repositories/favorite_repository.dart';

class WatchFavorites {
  final FavoriteRepository repository;

  WatchFavorites(this.repository);

  Stream<List<PokemonDetailEntity>> call() {
    return repository.watchFavorites();
  }
}
