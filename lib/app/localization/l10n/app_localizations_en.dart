// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get title => 'Pokedex Global App';

  @override
  String get onboardingTitle1 => 'All Pokémon in one place';

  @override
  String get onboardingDescription1 =>
      'Access to a wide list of Pokémon from all generations created by Nintendo';

  @override
  String get onboardingTitle2 => 'Keep your Pokédex updated';

  @override
  String get onboardingDescription2 =>
      'Register and save your profile, favorite Pokémon, settings and much more in the application';

  @override
  String get errorTitle => 'Something went wrong...';

  @override
  String get errorDescription =>
      'We couldn\'t load the information at this moment. Verify your connection or try again later.';

  @override
  String get regionsTitle => 'Coming soon!';

  @override
  String get regionsDescription =>
      'We\'re working to bring you this section. Come back later to discover all the news.';

  @override
  String get tabbarPokedex => 'Pokédex';

  @override
  String get tabbarFavorite => 'Favorites';

  @override
  String get tabbarProfile => 'Profile';

  @override
  String get tabbarRegions => 'Regions';

  @override
  String get buttonContinue => 'Continue';

  @override
  String get buttonStart => 'Let\'s start';

  @override
  String get buttonRetry => 'Retry';

  @override
  String get buttonApply => 'Apply';

  @override
  String get buttonCancel => 'Cancel';
}
