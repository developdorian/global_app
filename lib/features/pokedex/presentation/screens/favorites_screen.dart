import 'package:flutter/material.dart';
import 'package:global_app/app/localization/l10n/app_localizations.dart';
import 'package:global_app/app/theme/app_constants.dart';
import 'package:global_app/app/theme/app_theme.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 40),
          Image.asset(AppConstants.magikarpImage, height: 250),
          Text(
            l10n.favoritesTitle,
            textAlign: TextAlign.center,
            style: AppTheme.textTheme.displaySmall,
          ),
          const SizedBox(height: 16),
          Text(
            l10n.favoritesDescription,
            textAlign: TextAlign.center,
            style: AppTheme.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}