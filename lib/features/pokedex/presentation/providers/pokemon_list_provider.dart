import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dio/dio.dart';
import 'package:global_app/features/pokedex/data/datasources/pokemon_remote_datasource.dart';
import 'package:global_app/features/pokedex/data/repositories/pokemon_repository_impl.dart';
import 'package:global_app/features/pokedex/domain/entities/pokemon_entity.dart';
import 'package:global_app/features/pokedex/domain/usecases/get_pokemon_list.dart';

// 🔹 Dio Provider
final dioProvider = Provider<Dio>((ref) => Dio());

// 🔹 DataSource Provider
final remoteDataSourceProvider = Provider<PokemonRemoteDataSource>(
  (ref) => PokemonRemoteDataSource(ref.read(dioProvider)),
);

// 🔹 Repository Provider
final pokemonRepositoryProvider = Provider<PokemonRepositoryImpl>(
  (ref) => PokemonRepositoryImpl(ref.read(remoteDataSourceProvider)),
);

// 🔹 Use Case Provider
final getPokemonListProvider = Provider<GetPokemonList>(
  (ref) => GetPokemonList(ref.read(pokemonRepositoryProvider)),
);

// 🔹 Future Provider (para la UI)
final pokemonListProvider = FutureProvider.autoDispose<List<PokemonEntity>>((ref) async {
  final getList = ref.read(getPokemonListProvider);
  return getList();
});
