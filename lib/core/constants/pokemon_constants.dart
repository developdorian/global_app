class PokemonConstants {
  PokemonConstants._();

  // Weaknesses of types
  static const Map<String, List<String>> typeWeaknesses = {
    'normal': ['fighting'],
    'fire': ['water', 'ground', 'rock'],
    'water': ['electric', 'grass'],
    'electric': ['ground'],
    'grass': ['fire', 'ice', 'poison', 'flying', 'bug'],
    'ice': ['fire', 'fighting', 'rock', 'steel'],
    'fighting': ['flying', 'psychic', 'fairy'],
    'poison': ['ground', 'psychic'],
    'ground': ['water', 'grass', 'ice'],
    'flying': ['electric', 'ice', 'rock'],
    'psychic': ['bug', 'ghost', 'dark'],
    'bug': ['fire', 'flying', 'rock'],
    'rock': ['water', 'grass', 'fighting', 'ground', 'steel'],
    'ghost': ['ghost', 'dark'],
    'dragon': ['ice', 'dragon', 'fairy'],
    'dark': ['fighting', 'bug', 'fairy'],
    'steel': ['fire', 'fighting', 'ground'],
    'fairy': ['poison', 'steel'],
  };
  
  static const Map<String, String> abilityTranslations = {
    'overgrow': 'Espesura',
    'chlorophyll': 'Clorofila',
    'blaze': 'Mar Llamas',
    'solar-power': 'Poder Solar',
    'torrent': 'Torrente',
    'rain-dish': 'Cura Lluvia',
    // ... more abilities
  };
}