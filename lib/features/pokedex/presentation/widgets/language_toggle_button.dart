import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:global_app/app/providers/locale_provider.dart';
import 'package:global_app/app/theme/app_theme.dart';

class LanguageToggleButton extends ConsumerWidget {
  final bool isSubtle;
  
  const LanguageToggleButton({
    super.key,
    this.isSubtle = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocale = ref.watch(localeProvider);
    final isSpanish = currentLocale.languageCode == 'es';
    
    return GestureDetector(
      onTap: () {
        ref.read(localeProvider.notifier).toggleLocale();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSubtle 
              ? Colors.white
              : AppTheme.lightTheme.colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSubtle
                ? AppTheme.lightTheme.colorScheme.outline.withOpacity(0.15)
                : AppTheme.lightTheme.colorScheme.outline.withOpacity(0.2),
            width: 1,
          ),
          boxShadow: isSubtle ? [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ] : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'ES',
              style: TextStyle(
                fontSize: 12,
                fontWeight: isSpanish ? FontWeight.bold : FontWeight.normal,
                color: isSpanish 
                    ? AppTheme.lightTheme.colorScheme.primary 
                    : AppTheme.lightTheme.colorScheme.onSurface.withOpacity(0.5),
              ),
            ),
            const SizedBox(width: 4),
            Container(
              width: 1,
              height: 12,
              color: AppTheme.lightTheme.colorScheme.outline.withOpacity(0.3),
            ),
            const SizedBox(width: 4),
            Text(
              'EN',
              style: TextStyle(
                fontSize: 12,
                fontWeight: !isSpanish ? FontWeight.bold : FontWeight.normal,
                color: !isSpanish 
                    ? AppTheme.lightTheme.colorScheme.primary 
                    : AppTheme.lightTheme.colorScheme.onSurface.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
