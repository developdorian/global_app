import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:global_app/app/localization/l10n/app_localizations.dart';
import 'package:global_app/app/theme/app_constants.dart';
import 'package:global_app/features/pokedex/presentation/screens/screens.dart';

class PrimaryScreen extends StatefulWidget {
  const PrimaryScreen({super.key});

  @override
  State<PrimaryScreen> createState() => _PrimaryScreenState();
}

class _PrimaryScreenState extends State<PrimaryScreen> {
  int _currentIndex = 0;

  // Navigator keys for each tab to maintain independent navigation stacks
  final _pokedexNavigatorKey = GlobalKey<NavigatorState>();
  final _regionsNavigatorKey = GlobalKey<NavigatorState>();
  final _favoritesNavigatorKey = GlobalKey<NavigatorState>();
  final _profileNavigatorKey = GlobalKey<NavigatorState>();

  // Build a navigator for each tab
  Widget _buildNavigator(GlobalKey<NavigatorState> navigatorKey, Widget screen) {
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) => screen,
        );
      },
    );
  }

  List<Widget> get _screens => [
    _buildNavigator(_pokedexNavigatorKey, const PokedexScreen()),
    _buildNavigator(_regionsNavigatorKey, const RegionsScreen()),
    _buildNavigator(_favoritesNavigatorKey, const FavoritesScreen()),
    _buildNavigator(_profileNavigatorKey, const ProfileScreen()),
  ];

  Widget _buildIcon(String assetPath, bool isSelected) {
    final theme = Theme.of(context).bottomNavigationBarTheme;

    return SvgPicture.asset(
      assetPath,
      width: 24,
      height: 24,
      colorFilter: ColorFilter.mode(
        isSelected ? theme.selectedItemColor! : theme.unselectedItemColor!,
        BlendMode.srcIn,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: SafeArea(child: _screens[_currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: _buildIcon(AppConstants.homeLogo, _currentIndex == 0),
            label: l10n.tabbarPokedex,
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(AppConstants.regionLogo, _currentIndex == 1),
            label: l10n.tabbarRegions,
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(AppConstants.heartTabLogo, _currentIndex == 2),
            label: l10n.tabbarFavorite,
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(AppConstants.profileLogo, _currentIndex == 3),
            label: l10n.tabbarProfile,
          ),
        ],
      ),
    );
  }
}