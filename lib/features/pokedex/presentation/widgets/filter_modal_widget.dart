import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:global_app/app/localization/l10n/app_localizations.dart';
import 'package:global_app/app/theme/app_constants.dart';
import 'package:global_app/app/theme/app_theme.dart';
import 'package:global_app/features/pokedex/presentation/providers/search_filter_provider.dart';
import 'package:global_app/features/pokedex/presentation/widgets/primary_button_widget.dart';
import 'package:global_app/features/pokedex/presentation/widgets/secondary_button_widget.dart';

class FilterModalWidget extends ConsumerStatefulWidget {
  const FilterModalWidget({super.key});

  @override
  ConsumerState<FilterModalWidget> createState() => _FilterModalWidgetState();
}

class _FilterModalWidgetState extends ConsumerState<FilterModalWidget> {
  late Set<String> _tempSelectedTypes;
  bool _isExpanded = true;

  @override
  void initState() {
    super.initState();
    _tempSelectedTypes = Set.from(ref.read(searchFilterProvider).selectedTypes);
  }

  void _toggleType(String type) {
    setState(() {
      if (_tempSelectedTypes.contains(type)) {
        _tempSelectedTypes.remove(type);
      } else {
        _tempSelectedTypes.add(type);
      }
    });
  }

  void _applyFilters() {
    ref.read(searchFilterProvider.notifier).applyFilters(_tempSelectedTypes);
    Navigator.pop(context);
  }

  void _clearFilters() {
    ref.read(searchFilterProvider.notifier).clearFilters();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    // List of all Pokemon types in Spanish
    final l10n = AppLocalizations.of(context)!;
    final pokemonTypes = [
      'water',
      'dragon',
      'electric',
      'fairy',
      'ghost',
      'fire',
      'ice',
      'bug',
      'fighting',
      'normal',
      'grass',
      'psychic',
      'rock',
      'dark',
      'ground',
      'poison',
      'steel',
      'flying',
    ];

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.only(left: 12, top: 8),
                    width: double.infinity,
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close),
                    ),
                  ),
                  Center(
                    child: Text(
                      l10n.filterTitle,
                      style: AppTheme.textTheme.headlineMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
              // Type Section
              ExpansionTile(
                title: Text(
                  l10n.filterType,
                  style: AppTheme.textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                initiallyExpanded: _isExpanded,
                onExpansionChanged: (expanded) {
                  setState(() {
                    _isExpanded = expanded;
                  });
                },
                children: [
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 300),
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      itemCount: pokemonTypes.length,
                      itemBuilder: (context, index) {
                        final type = pokemonTypes[index];
                        final isSelected = _tempSelectedTypes.contains(type);
                        final translation =
                            AppConstants.getTypeTranslation(type);

                        return CheckboxListTile(
                          title: Text(
                            translation,
                            style: AppTheme.textTheme.bodyLarge,
                          ),
                          value: isSelected,
                          onChanged: (value) => _toggleType(type),
                          controlAffinity: ListTileControlAffinity.trailing,
                          activeColor: AppColors.success,
                          contentPadding: EdgeInsets.zero,
                        );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              PrimaryButtonWidget(
                text: l10n.buttonApply,
                onPressed: _applyFilters,
              ),
              const SizedBox(height: 16),
              SecondaryButtonWidget(
                text: l10n.buttonCancel,
                onPressed: _clearFilters,
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
