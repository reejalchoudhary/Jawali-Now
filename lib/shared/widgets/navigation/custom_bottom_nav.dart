import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/constants/app_colors.dart';

class CustomBottomNav extends StatelessWidget {
  final String active;
  final Function(String) onNavigate;

  const CustomBottomNav({
    super.key,
    required this.active,
    required this.onNavigate,
  });

  @override
  Widget build(BuildContext context) {
    final navItems = [
      {
        "id": "home",
        "icon": LucideIcons.house,
      },
      {
        "id": "explore",
        "icon": LucideIcons.compass,
      },
      {
        "id": "search",
        "icon": LucideIcons.search,
      },
      {
        "id": "favorites",
        "icon": LucideIcons.heart,
      },
      {
        "id": "updates",
        "icon": LucideIcons.radio,
      },
    ];

    return Positioned(
      bottom: 14,
      left: 14,
      right: 14,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 25,
            sigmaY: 25,
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: Colors.white.withOpacity(0.08),
              ),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  AppColors.darkSurface.withOpacity(0.90),
                  AppColors.darkCharcoal.withOpacity(0.90),
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.12),
                  blurRadius: 30,
                  spreadRadius: 4,
                ),
              ],
            ),
            child: Stack(
              children: [
                // Glow Overlay
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(30),
                      gradient: LinearGradient(
                        colors: [
                          AppColors.primary
                              .withOpacity(0.08),
                          AppColors.secondary
                              .withOpacity(0.08),
                          AppColors.accent
                              .withOpacity(0.08),
                        ],
                      ),
                    ),
                  ),
                ),

                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: navItems.map((item) {
                    final isActive =
                        active == item["id"];

                    return GestureDetector(
                      onTap: () => onNavigate(
                        item["id"] as String,
                      ),
                      child: SizedBox(
                        width: 
                        MediaQuery.of(context).size.width < 400
                            ? 48
                            : 56,
                        child: Column(
                          mainAxisSize:
                              MainAxisSize.min,
                          children: [
                            AnimatedContainer(
                              duration:
                                  const Duration(
                                      milliseconds:
                                          300),
                              padding:
                                  const EdgeInsets
                                      .all(10),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius
                                        .circular(
                                            18),
                                gradient: isActive
                                    ? const LinearGradient(
                                        colors: [
                                          AppColors
                                              .primary,
                                          AppColors
                                              .secondary,
                                        ],
                                      )
                                    : null,
                                color: isActive
                                    ? null
                                    : Colors
                                        .transparent,
                                boxShadow: isActive
                                    ? [
                                        BoxShadow(
                                          color: AppColors
                                              .primary
                                              .withOpacity(
                                                  0.35),
                                          blurRadius:
                                              20,
                                        ),
                                      ]
                                    : [],
                              ),
                              child: Icon(
                                item["icon"]
                                    as IconData,
                                size: 20,
                                color: isActive
                                    ? Colors.white
                                    : Colors.white
                                        .withOpacity(
                                            0.6),
                              ),
                            ),

                            const SizedBox(
                                height: 6),

                            AnimatedContainer(
                              duration:
                                  const Duration(
                                      milliseconds:
                                          300),
                              width:
                                  isActive ? 6 : 0,
                              height:
                                  isActive ? 6 : 0,
                              decoration:
                                  const BoxDecoration(
                                shape:
                                    BoxShape.circle,
                                color:
                                    AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                        .animate()
                        .fadeIn(
                          duration: 500.ms,
                        );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}