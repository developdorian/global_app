import 'package:flutter/material.dart';
import 'package:global_app/app/localization/l10n/app_localizations.dart';
import 'package:global_app/app/theme/app_constants.dart';
import 'package:global_app/app/theme/app_theme.dart';

class RegionsScreen extends StatelessWidget {
  const RegionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 40),
          Image.asset(AppConstants.jigglypuffImage, height: 250),
          Text(
            l10n.regionsTitle,
            textAlign: TextAlign.center,
            style: AppTheme.textTheme.displaySmall,
          ),
          SizedBox(height: 16),
          Text(
            l10n.regionsDescription,
            textAlign: TextAlign.center,
            style: AppTheme.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}