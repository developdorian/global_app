import 'package:global_app/features/pokedex/domain/entities/pokemon_detail_entity.dart';

abstract class FavoriteRepository {
  Future<List<PokemonDetailEntity>> getFavorites();
  Future<void> addFavorite(PokemonDetailEntity pokemon);
  Future<void> removeFavorite(int pokemonId);
  Future<bool> isFavorite(int pokemonId);
  Stream<List<PokemonDetailEntity>> watchFavorites();
}
