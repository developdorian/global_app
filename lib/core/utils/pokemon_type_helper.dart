import 'package:flutter/material.dart';
import 'package:global_app/core/constants/pokemon_constants.dart';
import 'package:global_app/app/theme/app_constants.dart';

class PokemonTypeHelper {
  PokemonTypeHelper._(); 

  /// Calculates the combined weaknesses of one or more types
  /// Returns only types that deal 2x or more damage (net weakness)
  static List<String> calculateWeaknesses(List<String> types) {
    if (types.isEmpty) return [];

    // Map to track damage multipliers for each attacking type
    final damageMultipliers = <String, double>{};

    // Initialize all possible types with 1x damage
    const allTypes = [
      'normal', 'fire', 'water', 'electric', 'grass', 'ice',
      'fighting', 'poison', 'ground', 'flying', 'psychic', 'bug',
      'rock', 'ghost', 'dragon', 'dark', 'steel', 'fairy'
    ];

    for (final attackType in allTypes) {
      damageMultipliers[attackType] = 1.0;
    }

    // Calculate damage multipliers for each defending type
    for (final defendingType in types) {
      // Apply weaknesses (2x damage)
      final weaknesses = PokemonConstants.typeWeaknesses[defendingType] ?? [];
      for (final weakness in weaknesses) {
        damageMultipliers[weakness] = (damageMultipliers[weakness] ?? 1.0) * 2.0;
      }

      // Apply resistances (0.5x damage)
      final resistances = PokemonConstants.typeResistances[defendingType] ?? [];
      for (final resistance in resistances) {
        damageMultipliers[resistance] = (damageMultipliers[resistance] ?? 1.0) * 0.5;
      }

      // Apply immunities (0x damage)
      final immunities = PokemonConstants.typeImmunities[defendingType] ?? [];
      for (final immunity in immunities) {
        damageMultipliers[immunity] = 0.0;
      }
    }

    // Filter only types that deal 2x or more damage (net weaknesses)
    final weaknessTypes = damageMultipliers.entries
        .where((entry) => entry.value >= 2.0)
        .map((entry) => entry.key)
        .toList()
      ..sort();

    return weaknessTypes;
  }

  /// Translates a type from English to Spanish (uses AppConstants centralization)
  static String translateType(String type) {
    return AppConstants.getTypeTranslation(type);
  }

  /// Gets the Color of a type (uses AppConstants centralization)
  static Color getTypeColor(String type) {
    return AppConstants.getTypeColor(type);
  }

  /// Gets the logo SVG of a type (uses AppConstants centralization)
  static String getTypeLogo(String type) {
    return AppConstants.getTypeLogo(type);
  }

  /// Translates a list of types
  static List<String> translateTypes(List<String> types) {
    return types.map((type) => translateType(type)).toList();
  }
}