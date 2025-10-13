// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get title => 'Pokedex Global App';

  @override
  String get onboardingTitle1 => 'Todos los Pokémon en un solo lugar';

  @override
  String get onboardingDescription1 =>
      'Accede a una amplia lista de Pokémon de todas las generaciones creadas por Nintendo';

  @override
  String get onboardingTitle2 => 'Mantén tu Pokédex actualizada';

  @override
  String get onboardingDescription2 =>
      'Regístrate y guarda tu perfil, Pokémon favoritos, configuraciones y mucho más en la aplicación';

  @override
  String get errorTitle => 'Algo salió mal...';

  @override
  String get errorDescription =>
      'No pudimos cargar la información en este momento. Verifica tu conexión o intenta nuevamente más tarde.';

  @override
  String get regionsTitle => '¡Muy pronto disponible!';

  @override
  String get regionsDescription =>
      'Estamos trabajando para traerte esta sección. Vuelve más adelante para descubrir todas las novedades.';

  @override
  String get tabbarPokedex => 'Pokédex';

  @override
  String get tabbarFavorite => 'Favoritos';

  @override
  String get tabbarProfile => 'Perfil';

  @override
  String get tabbarRegions => 'Regiones';

  @override
  String get buttonContinue => 'Continuar';

  @override
  String get buttonStart => 'Empecemos';

  @override
  String get buttonRetry => 'Reintentar';

  @override
  String get buttonApply => 'Aplicar';

  @override
  String get buttonCancel => 'Cancelar';
}
