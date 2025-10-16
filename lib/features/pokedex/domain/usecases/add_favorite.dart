import 'package:global_app/features/pokedex/domain/entities/pokemon_detail_entity.dart';
import 'package:global_app/features/pokedex/domain/repositories/favorite_repository.dart';

class AddFavorite {
  final FavoriteRepository repository;

  AddFavorite(this.repository);

  Future<void> call(PokemonDetailEntity pokemon) async {
    await repository.addFavorite(pokemon);
  }
}
