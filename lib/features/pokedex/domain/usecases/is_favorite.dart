import 'package:global_app/features/pokedex/domain/repositories/favorite_repository.dart';

class IsFavorite {
  final FavoriteRepository repository;

  IsFavorite(this.repository);

  Future<bool> call(int pokemonId) async {
    return await repository.isFavorite(pokemonId);
  }
}
