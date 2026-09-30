import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/data/mock_updates_data.dart';
import '../../../core/models/update_model.dart';
import '../../../shared/widgets/glass/glass_card.dart';
import '../../../shared/widgets/neo_search_bar.dart';
import '../../../shared/widgets/navigation/custom_bottom_nav.dart';

class HomeScreen extends StatelessWidget {
  final Function(String) onNavigate;

  const HomeScreen({
    super.key,
    required this.onNavigate,
  });

  Color getTypeColor(String type) {
    switch (type.toLowerCase()) {
      case 'alert':
        return const Color(0xFFEF4444);
      case 'warning':
        return const Color(0xFFF59E0B);
      case 'success':
              return const Color(0xFFF59E0B);
      case 'local':
              return const Color(0xFFF59E0B);
      case 'transport':
        return const Color(0xFF10B981);
      case 'event':
        return const Color(0xFF8B5CF6);
      case 'weather':
        return const Color(0xFF6366F1);
      case 'info':
        return AppColors.secondary;
      default:
        return AppColors.primary;
    }
  }

  IconData getUpdateIcon(String icon) {
    switch (icon.toLowerCase()) {
      case 'car':
        return LucideIcons.car;
      case 'traffic':
        return LucideIcons.car;
      case 'calendar':
        return LucideIcons.calendar;
      case 'local':
              return LucideIcons.coffee;
      case 'transport':
              return LucideIcons.bus;
      case 'cloud':
        return LucideIcons.cloud;
      case 'weather':
        return LucideIcons.cloud;
      case 'check':
        return LucideIcons.checkCircle2;
      case 'success':
        return LucideIcons.checkCircle2;
      case 'alert':
        return LucideIcons.alertCircle;
      default:
        return LucideIcons.radio;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final isVerySmall = screenWidth < 340;
    final isSmall = screenWidth < 400;
    final isTablet = screenWidth >= 600;

    final horizontalPadding = isVerySmall
        ? 14.0
        : isSmall
            ? 18.0
            : isTablet
                ? 32.0
                : 24.0;

    final categories = [
      {
        "name": "Hotels",
        "icon": LucideIcons.building2,
        "color": const Color(0xFF00D1FF),
      },
      {
        "name": "Food",
        "icon": LucideIcons.utensils,
        "color": const Color(0xFFFF6B35),
      },
      {
        "name": "Hospitals",
        "icon": LucideIcons.cross,
        "color": const Color(0xFF10B981),
      },
      {
        "name": "Shops",
        "icon": LucideIcons.shoppingBag,
        "color": const Color(0xFF9D4DFF),
      },
      {
        "name": "Tourism",
        "icon": LucideIcons.mapPinned,
        "color": const Color(0xFFFF4D9D),
      },
      {
        "name": "Events",
        "icon": LucideIcons.partyPopper,
        "color": const Color(0xFFFFD700),
      },
    ];

    final updates = mockUpdates.take(3).toList();

    return Scaffold(
      backgroundColor: AppColors.darkCharcoal,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.darkCharcoal,
                  AppColors.darkSurface,
                  AppColors.darkCharcoal,
                ],
              ),
            ),
          ),
          Positioned(
            top: -120,
            right: -80,
            child: Container(
              width: isVerySmall ? 190 : 220,
              height: isVerySmall ? 190 : 220,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary.withOpacity(0.12),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.25),
                    blurRadius: 120,
                    spreadRadius: 40,
                  ),
                ],
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.fromLTRB(
                horizontalPadding,
                isVerySmall ? 16 : 24,
                horizontalPadding,
                145,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hey there! 👋",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: isVerySmall
                                    ? 21
                                    : isSmall
                                        ? 24
                                        : isTablet
                                            ? 32
                                            : 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(
                                  LucideIcons.mapPin,
                                  size: 14,
                                  color: AppColors.neonCyan,
                                ),
                                const SizedBox(width: 6),
                                Expanded(
                                  child: Text(
                                    "Jawali, Himachal Pradesh",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                      color:
                                          Colors.white.withOpacity(0.7),
                                      fontSize: isVerySmall ? 11 : 13,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: isVerySmall ? 10 : 14,
                                vertical: isVerySmall ? 6 : 8,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(999),
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.green.withOpacity(0.25),
                                    Colors.green.withOpacity(0.08),
                                  ],
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    LucideIcons.radio,
                                    size: isVerySmall ? 10 : 12,
                                    color: Colors.greenAccent,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    "Live Updates",
                                    style: GoogleFonts.poppins(
                                      color: Colors.greenAccent,
                                      fontSize:
                                          isVerySmall ? 10 : 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            )
                                .animate(
                                  onPlay: (controller) =>
                                      controller.repeat(),
                                )
                                .fade(
                                  begin: 0.7,
                                  end: 1,
                                  duration: 2.seconds,
                                ),
                          ],
                        ),
                      ),
                      SizedBox(width: isVerySmall ? 8 : 14),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          onNavigate('offers');
                        },
                        child: Container(
                          width: isVerySmall
                              ? 42
                              : isSmall
                                  ? 46
                                  : 50,
                          height: isVerySmall
                              ? 42
                              : isSmall
                                  ? 46
                                  : 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: const LinearGradient(
                              colors: [
                                AppColors.primary,
                                AppColors.secondary,
                              ],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color:
                                    AppColors.primary.withOpacity(0.4),
                                blurRadius: 25,
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              Center(
                                child: Icon(
                                  LucideIcons.badgePercent,
                                  color: Colors.white,
                                  size: isVerySmall ? 18 : 21,
                                ),
                              ),
                              Positioned(
                                top: 1,
                                right: 1,
                                child: Container(
                                  width: isVerySmall ? 16 : 18,
                                  height: isVerySmall ? 16 : 18,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.greenAccent,
                                  ),
                                  child: Center(
                                    child: Text(
                                      "6",
                                      style: TextStyle(
                                        fontSize: isVerySmall ? 8 : 10,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            AppColors.darkCharcoal,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                          .animate(
                            onPlay: (controller) =>
                                controller.repeat(),
                          )
                          .shimmer(duration: 2.seconds),
                    ],
                  ),
                  SizedBox(height: isVerySmall ? 22 : 28),
                  NeoSearchBar(
                    onTap: () {
                      onNavigate('search');
                    },
                  ),
                  SizedBox(height: isVerySmall ? 24 : 30),
                  Text(
                    "Quick Access",
                    style: GoogleFonts.poppins(
                      color: Colors.white.withOpacity(0.8),
                      fontWeight: FontWeight.w600,
                      fontSize: isVerySmall ? 12 : 14,
                    ),
                  ),
                  SizedBox(height: isVerySmall ? 12 : 16),
                  SizedBox(
                    height: isVerySmall
                        ? 132
                        : isSmall
                            ? 145
                            : 150,
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      separatorBuilder: (_, _) =>
                          SizedBox(width: isVerySmall ? 9 : 14),
                      itemBuilder: (context, index) {
                        final item = categories[index];
                        final itemColor = item["color"] as Color;

                        return GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            onNavigate('category');
                          },
                          child: Container(
                            width: isVerySmall
                                ? 88
                                : isSmall
                                    ? 94
                                    : 100,
                            padding: EdgeInsets.all(
                              isVerySmall ? 10 : 16,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                isVerySmall ? 20 : 24,
                              ),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.08),
                              ),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.white.withOpacity(0.08),
                                  Colors.white.withOpacity(0.02),
                                ],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      itemColor.withOpacity(0.18),
                                  blurRadius: 25,
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: isVerySmall ? 40 : 46,
                                  height: isVerySmall ? 40 : 46,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(16),
                                    gradient: LinearGradient(
                                      colors: [
                                        itemColor.withOpacity(0.25),
                                        itemColor.withOpacity(0.08),
                                      ],
                                    ),
                                  ),
                                  child: Icon(
                                    item["icon"] as IconData,
                                    color: itemColor,
                                    size: isVerySmall ? 19 : 22,
                                  ),
                                ),
                                SizedBox(
                                  height: isVerySmall ? 8 : 12,
                                ),
                                Text(
                                  item["name"] as String,
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                    color:
                                        Colors.white.withOpacity(0.9),
                                    fontSize:
                                        isVerySmall ? 9 : 11,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: isVerySmall ? 30 : 40),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        LucideIcons.radio,
                        color: AppColors.neonOrange,
                        size: isVerySmall ? 19 : 22,
                      ),
                      SizedBox(width: isVerySmall ? 6 : 8),
                      Expanded(
                        child: Text(
                          "Live Updates",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: isVerySmall
                                ? 18
                                : isSmall
                                    ? 20
                                    : 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          onNavigate('updates');
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "View All",
                                style: GoogleFonts.poppins(
                                  color: AppColors.neonCyan,
                                  fontSize: isVerySmall ? 10 : 11,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              if (!isVerySmall) ...[
                                const SizedBox(width: 3),
                                Icon(
                                  LucideIcons.chevronRight,
                                  color: AppColors.neonCyan,
                                  size: 14,
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: isVerySmall ? 12 : 16),
                  if (updates.isEmpty)
                    GlassCard(
                      padding: EdgeInsets.all(
                        isVerySmall ? 18 : 24,
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            Icon(
                              LucideIcons.radio,
                              size: isVerySmall ? 30 : 38,
                              color: Colors.white.withOpacity(0.3),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "No updates available",
                              style: GoogleFonts.poppins(
                                color: Colors.white.withOpacity(0.6),
                                fontSize: isVerySmall ? 12 : 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  else
                    Column(
                      children: List.generate(
                        updates.length,
                        (index) {
                          final UpdateModel update = updates[index];
                          final color =
                              getTypeColor(update.type);

                          return Padding(
                            padding: const EdgeInsets.only(
                              bottom: 12,
                            ),
                            child: GlassCard(
                              padding: EdgeInsets.all(
                                isVerySmall ? 11 : 14,
                              ),
                              child: Row(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: isVerySmall ? 42 : 46,
                                    height: isVerySmall ? 42 : 46,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(
                                        isVerySmall ? 12 : 14,
                                      ),
                                      gradient: LinearGradient(
                                        colors: [
                                          color.withOpacity(0.25),
                                          color.withOpacity(0.08),
                                        ],
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color:
                                              color.withOpacity(0.18),
                                          blurRadius: 20,
                                        ),
                                      ],
                                    ),
                                    child: Icon(
                                      getUpdateIcon(update.icon),
                                      color: color,
                                      size: isVerySmall ? 20 : 23,
                                    ),
                                  ),
                                  SizedBox(
                                    width: isVerySmall ? 9 : 14,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          update.title,
                                          maxLines: 2,
                                          overflow:
                                              TextOverflow.ellipsis,
                                          style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize:
                                                isVerySmall ? 12 : 14,
                                            fontWeight:
                                                FontWeight.w600,
                                            height: 1.25,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          update.description,
                                          maxLines:
                                              isVerySmall ? 2 : 2,
                                          overflow:
                                              TextOverflow.ellipsis,
                                          style: GoogleFonts.poppins(
                                            color: Colors.white
                                                .withOpacity(0.6),
                                            fontSize:
                                                isVerySmall ? 9 : 11,
                                            height: 1.4,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          update.time,
                                          maxLines: 1,
                                          overflow:
                                              TextOverflow.ellipsis,
                                          style: GoogleFonts.poppins(
                                            color: Colors.white
                                                .withOpacity(0.4),
                                            fontSize:
                                                isVerySmall ? 8 : 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                              .animate()
                              .fadeIn(
                                delay: (200 + index * 80).ms,
                              )
                              .slideY(
                                begin: 0.15,
                                end: 0,
                              );
                        },
                      ),
                    ),
                  SizedBox(height: isVerySmall ? 28 : 40),
                  Text(
                    "Discover Jawali",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: isVerySmall
                          ? 20
                          : isSmall
                              ? 22
                              : 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: isVerySmall ? 14 : 18),
                  Container(
                    height: isVerySmall
                        ? 170
                        : isSmall
                            ? 190
                            : 220,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        isVerySmall ? 24 : 32,
                      ),
                      image: const DecorationImage(
                        image: AssetImage(
                          "assets/bathu.jpg",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              isVerySmall ? 24 : 32,
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                AppColors.darkCharcoal
                                    .withOpacity(0.88),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: isVerySmall ? 12 : 20,
                          right: isVerySmall ? 12 : 20,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  isVerySmall ? 10 : 14,
                              vertical: isVerySmall ? 6 : 8,
                            ),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(999),
                              gradient: const LinearGradient(
                                colors: [
                                  AppColors.primary,
                                  AppColors.secondary,
                                ],
                              ),
                            ),
                            child: Text(
                              "Trending",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: isVerySmall ? 9 : 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: isVerySmall ? 14 : 20,
                          right: isVerySmall ? 14 : 20,
                          bottom: isVerySmall ? 14 : 20,
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Tourism",
                                style: GoogleFonts.poppins(
                                  color: AppColors.neonCyan,
                                  fontSize:
                                      isVerySmall ? 10 : 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "Explore Jawali",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: isVerySmall
                                      ? 19
                                      : isSmall
                                          ? 22
                                          : 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "Discover amazing places around Jawali.",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                  color:
                                      Colors.white.withOpacity(0.7),
                                  fontSize:
                                      isVerySmall ? 10 : 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          CustomBottomNav(
            active: 'home',
            onNavigate: onNavigate,
          ),
        ],
      ),
    );
  }
}