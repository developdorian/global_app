import 'package:flutter/material.dart';
import 'router.dart';
// import 'theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Pokedex Global App',
      // TODO: Configurar el tema personalizado de la app
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      routerConfig: router,       // 🚏 go_router desde router.dart
      supportedLocales: const [
        Locale('en'),
        Locale('es'),
      ],
      // localizationsDelegates: AppLocalizations.delegates,
    );
  }
}
