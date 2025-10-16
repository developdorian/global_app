import 'package:flutter/material.dart';
import 'package:global_app/core/constants/pokemon_constants.dart';
import 'package:global_app/app/theme/app_constants.dart';

class PokemonTypeHelper {
  PokemonTypeHelper._(); 

  /// Calculates the combined weaknesses of one or more types
  static List<String> calculateWeaknesses(List<String> types) {
    if (types.isEmpty) return [];

    final weaknesses = <String>{};
    final resistances = <String>{};
    final immunities = <String>{};

    // If only one type, it's easier
    if (types.length == 1) {
      return PokemonConstants.typeWeaknesses[types.first] ?? [];
    }

    // For dual types, we need to calculate interactions
    for (final type in types) {
      final typeWeaknesses = PokemonConstants.typeWeaknesses[type] ?? [];
      weaknesses.addAll(typeWeaknesses);
    }

    return weaknesses.toList()..sort();
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