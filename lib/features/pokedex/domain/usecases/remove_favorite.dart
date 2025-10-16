import 'package:global_app/features/pokedex/domain/repositories/favorite_repository.dart';

class RemoveFavorite {
  final FavoriteRepository repository;

  RemoveFavorite(this.repository);

  Future<void> call(int pokemonId) async {
    await repository.removeFavorite(pokemonId);
  }
}
