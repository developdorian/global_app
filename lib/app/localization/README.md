# Localización - Guía de Uso

## Cómo usar las traducciones en tu código

Para acceder a las traducciones en cualquier widget, usa:

```dart
import 'package:global_app/app/localization/l10n/app_localizations.dart';

// Dentro de tu widget build method:
final l10n = AppLocalizations.of(context)!;

// Uso de las traducciones:
Text(l10n.title)
Text(l10n.onboardingTitle1)
Text(l10n.buttonContinue)
```

## Ejemplo completo

```dart
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.title),
      ),
      body: Column(
        children: [
          Text(l10n.onboardingTitle1),
          Text(l10n.onboardingDescription1),
          ElevatedButton(
            onPressed: () {},
            child: Text(l10n.buttonContinue),
          ),
        ],
      ),
    );
  }
}
```

## Agregar nuevas traducciones

1. Edita `app_en.arb` y `app_es.arb`
2. Agrega la nueva clave en ambos archivos (recuerda: NO usar comentarios)
3. Ejecuta `flutter pub get` o `flutter gen-l10n` para regenerar los archivos
4. Las nuevas traducciones estarán disponibles automáticamente

## Idiomas soportados

- 🇺🇸 Inglés (en)
- 🇪🇸 Español (es)
