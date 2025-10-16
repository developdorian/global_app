
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:global_app/app/localization/l10n/app_localizations.dart';
import 'package:global_app/app/theme/app_constants.dart';
import 'package:global_app/app/theme/app_theme.dart';
import 'package:global_app/features/pokedex/presentation/widgets/language_toggle_button.dart';
import 'package:global_app/features/pokedex/presentation/widgets/primary_button_widget.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  children: [
                    OnboardingPage(
                      title: l10n.onboardingTitle1,
                      description: l10n.onboardingDescription1,
                      image: AppConstants.character1Image,
                    ),
                    OnboardingPage(
                      title: l10n.onboardingTitle2,
                      description: l10n.onboardingDescription2,
                      image: AppConstants.character2Image,
                    ),
                  ],
                ),
              ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  2,
                  (index) => Container(
                    margin: EdgeInsets.all(4),
                    width: _currentPage == index ? 28 : 9,
                    height: 8,
                    decoration: BoxDecoration(
                      color: _currentPage == index
                          ? AppTheme.lightTheme.colorScheme.tertiary
                          : AppTheme.lightTheme.colorScheme.onSecondary.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),    
              PrimaryButtonWidget(
                text: _currentPage == 1 ? l10n.buttonStart : l10n.buttonContinue,
                onPressed: () {
                  if (_currentPage < 1) {
                    _pageController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    context.go('/primary');
                  }
                },
              ),
              SizedBox(height: 32),
            ],
          ),
          Positioned(
            top: 16,
            right: 16,
            child: SafeArea(
              child: LanguageToggleButton(isSubtle: true),
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  const OnboardingPage({
    super.key, 
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset(image, height: 250),
          SizedBox(height: 40),
          Text(
            title,
            textAlign: TextAlign.center,
            style: AppTheme.textTheme.displaySmall,
          ),
          SizedBox(height: 16),
          Text(
            description,
            textAlign: TextAlign.center,
            style: AppTheme.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}