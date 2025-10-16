import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:global_app/features/pokedex/domain/entities/pokemon_detail_entity.dart';

part 'pokemon_detail_model.freezed.dart';
part 'pokemon_detail_model.g.dart';

@freezed
class PokemonDetailModel with _$PokemonDetailModel {
  const factory PokemonDetailModel({
    required int id,
    required String name,
    required int height,
    required int weight,
    required List<PokemonTypeModel> types,
    required List<PokemonAbilityModel> abilities,
  }) = _PokemonDetailModel;

  factory PokemonDetailModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonDetailModelFromJson(json);
}

@freezed
class PokemonTypeModel with _$PokemonTypeModel {
  const factory PokemonTypeModel({
    required int slot,
    required TypeInfoModel type,
  }) = _PokemonTypeModel;

  factory PokemonTypeModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypeModelFromJson(json);
}

@freezed
class TypeInfoModel with _$TypeInfoModel {
  const factory TypeInfoModel({
    required String name,
  }) = _TypeInfoModel;

  factory TypeInfoModel.fromJson(Map<String, dynamic> json) =>
      _$TypeInfoModelFromJson(json);
}

@freezed
class PokemonAbilityModel with _$PokemonAbilityModel {
  const factory PokemonAbilityModel({
    required bool isHidden,
    required AbilityInfoModel ability,
  }) = _PokemonAbilityModel;

  factory PokemonAbilityModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonAbilityModelFromJson(json);
}

@freezed
class AbilityInfoModel with _$AbilityInfoModel {
  const factory AbilityInfoModel({
    required String name,
  }) = _AbilityInfoModel;

  factory AbilityInfoModel.fromJson(Map<String, dynamic> json) =>
      _$AbilityInfoModelFromJson(json);
}

extension PokemonDetailModelX on PokemonDetailModel {
  PokemonDetailEntity toEntity() => PokemonDetailEntity(
        id: id,
        name: name,
        height: height,
        weight: weight,
        types: types
            .map((t) => PokemonTypeEntity(
                  slot: t.slot,
                  name: t.type.name,
                ))
            .toList(),
        abilities: abilities
            .map((a) => PokemonAbilityEntity(
                  name: a.ability.name,
                  isHidden: a.isHidden,
                ))
            .toList(),
      );
}
