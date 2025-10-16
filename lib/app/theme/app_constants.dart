import 'package:flutter/material.dart';

class AppConstants {

  // Images
  static const String pokeballSplashImage = "assets/images/logos/poke_loader.png";
  static const String magikarpImage = "assets/images/logos/magikarp.png";
  static const String character1Image = "assets/images/logos/pj_2.png";
  static const String character2Image = "assets/images/logos/pj_1.png";
  static const String jigglypuffImage = "assets/images/logos/jigglypuff.png";

  // Logos
  static const String bugLogo = "assets/images/icons/bug.svg";
  static const String darkLogo = "assets/images/icons/dark.svg";
  static const String dragonLogo = "assets/images/icons/Dragon.svg";
  static const String electricLogo = "assets/images/icons/electric.svg";
  static const String fairyLogo = "assets/images/icons/fairy.svg";
  static const String fightingLogo = "assets/images/icons/fighting.svg";
  static const String fireLogo = "assets/images/icons/fire.svg";
  static const String flyingLogo = "assets/images/icons/flying.svg";
  static const String ghostLogo = "assets/images/icons/ghost.svg";
  static const String grassLogo = "assets/images/icons/grass.svg";
  static const String groundLogo = "assets/images/icons/ground.svg";
  static const String iceLogo = "assets/images/icons/ice.svg";
  static const String normalLogo = "assets/images/icons/normal.svg";
  static const String poisonLogo = "assets/images/icons/poison.svg";
  static const String psychicLogo = "assets/images/icons/psychic.svg";
  static const String rockLogo = "assets/images/icons/rock.svg";
  static const String steelLogo = "assets/images/icons/steel.svg";
  static const String waterLogo = "assets/images/icons/water.svg";
  static const String unknownLogo = "assets/images/icons/unknown.svg";

  static const String heartLogo = "assets/images/icons/Heart.svg";
  static const String heartSolidLogo = "assets/images/icons/HeartSolid.svg";
  static const String heartBasicFavLogo = "assets/images/icons/heart_basic_fav.svg";
  static const String heartRedFavLogo = "assets/images/icons/heart_red_fav.svg";

  static const String homeLogo = "assets/images/icons/home.svg";
  static const String regionLogo = "assets/images/icons/region.svg";
  static const String profileLogo = "assets/images/icons/profile.svg";
  static const String heartTabLogo = "assets/images/icons/heart_tab.svg";

  // Colors cards pokemon
  static const Color kWaterColor = Color(0xFF2196F3);
  static const Color kFireColor = Color(0xFFFF9800);
  static const Color kGrassColor = Color(0xFF8BC34A);
  static const Color kElectricColor = Color(0xFFFDD835);
  static const Color kIceColor = Color(0xFF3D8BFF);
  static const Color kFairyColor = Color(0xFFE91E63);
  static const Color kSteelColor = Color(0xFF546E7A);
  static const Color kDragonColor = Color(0xFF00ACC1);
  static const Color kDarkColor = Color(0xFF546E7A);
  static const Color kFightingColor = Color(0xFFE53935);
  static const Color kGroundColor = Color(0xFFFFB300);
  static const Color kPsychicColor = Color(0xFF673AB7);
  static const Color kRockColor = Color(0xFF795548);
  static const Color kBugColor = Color(0xFF43A047);
  static const Color kPoisonColor = Color(0xFF9C27B0);
  static const Color kGhostColor = Color(0xFF8E24AA);
  static const Color kFlyingColor = Color(0xFF00BCD4);
  static const Color kNormalColor = Color(0xFF546E7A);
  static const Color kUnknownColor = Color(0xFF546E7A);

  static const Map<String, Color> pokemonTypeColors = {
    'water': kWaterColor,
    'fire': kFireColor,
    'grass': kGrassColor,
    'electric': kElectricColor,
    'ice': kIceColor,
    'fairy': kFairyColor,
    'steel': kSteelColor,
    'dragon': kDragonColor,
    'dark': kDarkColor,
    'fighting': kFightingColor,
    'ground': kGroundColor,
    'psychic': kPsychicColor,
    'rock': kRockColor,
    'bug': kBugColor,
    'poison': kPoisonColor,
    'ghost': kGhostColor,
    'flying': kFlyingColor,
    'normal': kNormalColor,
  };

  static const Map<String, String> pokemonTypeLogos = {
    'water': waterLogo,
    'fire': fireLogo,
    'grass': grassLogo,
    'electric': electricLogo,
    'ice': iceLogo,
    'fairy': fairyLogo,
    'steel': steelLogo,
    'dragon': dragonLogo,
    'dark': darkLogo,
    'fighting': fightingLogo,
    'ground': groundLogo,
    'psychic': psychicLogo,
    'rock': rockLogo,
    'bug': bugLogo,
    'poison': poisonLogo,
    'ghost': ghostLogo,
    'flying': flyingLogo,
    'normal': normalLogo,
  };

  static const Map<String, String> pokemonTypeTranslations = {
    'normal': 'Normal',
    'fire': 'Fuego',
    'water': 'Agua',
    'electric': 'Eléctrico',
    'grass': 'Planta',
    'ice': 'Hielo',
    'fighting': 'Lucha',
    'poison': 'Veneno',
    'ground': 'Tierra',
    'flying': 'Volador',
    'psychic': 'Psíquico',
    'bug': 'Bicho',
    'rock': 'Roca',
    'ghost': 'Fantasma',
    'dragon': 'Dragón',
    'dark': 'Siniestro',
    'steel': 'Acero',
    'fairy': 'Hada',
  };

  // Helper methods to get color, logo and translation of type
  static Color getTypeColor(String type) {
    return pokemonTypeColors[type.toLowerCase()] ?? kUnknownColor;
  }

  static String getTypeLogo(String type) {
    return pokemonTypeLogos[type.toLowerCase()] ?? unknownLogo;
  }

  static String getTypeTranslation(String type) {
    return pokemonTypeTranslations[type.toLowerCase()] ?? type;
  }

}