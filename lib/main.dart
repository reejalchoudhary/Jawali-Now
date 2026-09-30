import 'package:flutter/material.dart';

import 'core/models/business_model.dart';

import 'features/business_detail/presentation/business_detail_screen.dart';
import 'features/category/presentation/category_screen.dart';
import 'features/explore/presentation/explore_screen.dart';
import 'features/favorites/presentation/favorites_screen.dart';
import 'features/home/presentation/home_screen.dart';
import 'features/offers/presentation/offers_screen.dart';
import 'features/search/presentation/search_screen.dart';
import 'features/splash/presentation/splash_screen.dart';
import 'features/updates/presentation/updates_screen.dart';

void main() {
  runApp(const JawaliApp());
}

class JawaliApp extends StatefulWidget {
  const JawaliApp({super.key});

  @override
  State<JawaliApp> createState() =>
      _JawaliAppState();
}

class _JawaliAppState
    extends State<JawaliApp> {
  bool showSplash = true;

  String currentScreen = 'home';

  String selectedCategory =
      'Restaurants';

  BusinessModel? selectedBusiness;

  void finishSplash() {
    setState(() {
      showSplash = false;
    });
  }

  void navigateTo(String screen) {
    setState(() {
      currentScreen = screen;
    });
  }

  void openCategory(String category) {
    setState(() {
      selectedCategory = category;
      currentScreen = 'category';
    });
  }

  void openBusiness(
    BusinessModel business,
  ) {
    setState(() {
      selectedBusiness = business;
      currentScreen = 'business';
    });
  }

  Widget getCurrentScreen() {
    switch (currentScreen) {
      case 'search':
        return SearchScreen(
          onNavigate: navigateTo,
           onOpenBusiness: openBusiness,
        );

      case 'explore':
        return ExploreScreen(
          onNavigate: navigateTo,
          onOpenCategory:
              openCategory,
        );

      case 'category':
        return CategoryScreen(
          onNavigate: navigateTo,
          categoryName:
              selectedCategory,
          onOpenBusiness:
              openBusiness,
        );

      case 'business':
        return BusinessDetailScreen(
          onNavigate: navigateTo,
          business:
              selectedBusiness!,
        );

      case 'favorites':
        return FavoritesScreen(
          onNavigate: navigateTo,
        );

      case 'updates':
        return UpdatesScreen(
          onNavigate: navigateTo,
        );

      case 'offers':
        return OffersScreen(
          onNavigate: navigateTo,
        );

      case 'home':
      default:
        return HomeScreen(
          onNavigate: navigateTo,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
          false,
      title: 'Jawali',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor:
            const Color(0xFF09090B),
      ),
      home: AnimatedSwitcher(
        duration:
            const Duration(
                milliseconds: 450),
        switchInCurve:
            Curves.easeOutExpo,
        switchOutCurve:
            Curves.easeInExpo,
        transitionBuilder: (
          Widget child,
          Animation<double>
              animation,
        ) {
          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position:
                  Tween<Offset>(
                begin:
                    const Offset(
                        0.08,
                        0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            ),
          );
        },
        child: showSplash
            ? SplashScreen(
                key: const ValueKey(
                    'splash'),
                onComplete:
                    finishSplash,
              )
            : KeyedSubtree(
                key: ValueKey(
                  currentScreen +
                      selectedCategory +
                      (selectedBusiness
                              ?.name ??
                          ''),
                ),
                child:
                    getCurrentScreen(),
              ),
      ),
    );
  }
}