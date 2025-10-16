import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:global_app/app/localization/l10n/app_localizations.dart';
import 'package:global_app/app/theme/app_constants.dart';
import 'package:global_app/app/theme/app_theme.dart';
import 'package:global_app/features/pokedex/presentation/widgets/primary_button_widget.dart';
import 'package:global_app/features/pokedex/presentation/providers/pokemon_list_provider.dart';

class PokedexErrorScreen extends ConsumerWidget {
  const PokedexErrorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 40),
          Image.asset(AppConstants.magikarpImage, height: 250),
          Text(
            l10n.errorTitle,
            textAlign: TextAlign.center,
            style: AppTheme.textTheme.displaySmall,
          ),
          const SizedBox(height: 16),
          Text(
            l10n.errorDescription,
            textAlign: TextAlign.center,
            style: AppTheme.textTheme.bodyMedium,
          ),
          const SizedBox(height: 20),
          PrimaryButtonWidget(
            text: l10n.buttonRetry,
            onPressed: () {
              ref.invalidate(pokemonListProvider);
            },
          ),
        ],
      ),
    );
  }
}