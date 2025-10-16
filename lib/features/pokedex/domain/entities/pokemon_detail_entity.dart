class PokemonDetailEntity {
  final int id;
  final String name;
  final int height;
  final int weight;
  final List<PokemonTypeEntity> types;
  final List<PokemonAbilityEntity> abilities;

  const PokemonDetailEntity({
    required this.id,
    required this.name,
    required this.height,
    required this.weight,
    required this.types,
    required this.abilities,
  });
}

class PokemonTypeEntity {
  final int slot;
  final String name;

  const PokemonTypeEntity({
    required this.slot,
    required this.name,
  });
}

class PokemonAbilityEntity {
  final String name;
  final bool isHidden;

  const PokemonAbilityEntity({
    required this.name,
    required this.isHidden,
  });
}
