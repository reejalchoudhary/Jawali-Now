import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/navigation/custom_bottom_nav.dart';

class ExploreScreen extends StatelessWidget {
  final Function(String) onNavigate;
  final Function(String) onOpenCategory;

  const ExploreScreen({
    super.key,
    required this.onNavigate,
    required this.onOpenCategory,
  });

  @override
  Widget build(BuildContext context) {
    final categories = [
      {
        "name": "Restaurants",
        "icon": LucideIcons.utensils,
        "color": const Color(0xFFFF6B35),
      },
      {
        "name": "Hospitals",
        "icon": LucideIcons.cross,
        "color": const Color(0xFFEF4444),
      },
      {
        "name": "Pharmacy",
        "icon": LucideIcons.pill,
        "color": const Color(0xFF10B981),
      },
      {
        "name": "Cafes",
        "icon": LucideIcons.coffee,
        "color": const Color(0xFFA855F7),
      },
      {
        "name": "Hotels",
        "icon": LucideIcons.hotel,
        "color": const Color(0xFF06B6D4),
      },
      {
        "name": "Gym",
        "icon": LucideIcons.dumbbell,
        "color": const Color(0xFFEC4899),
      },
      {
        "name": "Markets",
        "icon": LucideIcons.shoppingBag,
        "color": const Color(0xFFEF4444),
      },
      {
        "name": "Cinema",
        "icon": LucideIcons.film,
        "color": const Color(0xFF8B5CF6),
      },
      {
        "name": "Temples",
        "icon": LucideIcons.building,
        "color": const Color(0xFFF97316),
      },
    ];

    final trendingPlaces = [
      {
        "name": "Himalayan Brew",
        "category": "Cafe",
        "rating": "4.8",
      },
      {
        "name": "Jawali Grand Hotel",
        "category": "Hotel",
        "rating": "4.6",
      },
      {
        "name": "City Hospital",
        "category": "Hospital",
        "rating": "4.9",
      },
    ];

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
            right: -60,
            child: Container(
              width: 260,
              height: 260,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                    AppColors.secondary.withOpacity(0.10),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.secondary
                        .withOpacity(0.18),
                    blurRadius: 120,
                    spreadRadius: 30,
                  ),
                ],
              ),
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              padding:
                  const EdgeInsets.fromLTRB(24, 24, 24, 140),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Explore",
                            style:
                                GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 
                              MediaQuery.of(context).size.width < 400
                                  ? 26
                                  : 32,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 6),

                          Row(
                            children: [
                              const Icon(
                                LucideIcons.mapPin,
                                size: 14,
                                color:
                                    AppColors.neonCyan,
                              ),

                              const SizedBox(width: 6),

                              Text(
                                "All categories in Jawali",
                                style:
                                    GoogleFonts.poppins(
                                  color: Colors.white
                                      .withOpacity(
                                          0.7),
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )
                      .animate()
                      .fadeIn(duration: 500.ms)
                      .slideY(
                        begin: -0.2,
                        end: 0,
                      ),

                  const SizedBox(height: 36),

                  Text(
                    "All Categories",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 18),

                  GridView.builder(
                    shrinkWrap: true,
                    physics:
                        const NeverScrollableScrollPhysics(),
                    itemCount: categories.length,
                    gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 
                      MediaQuery.of(context).size.width < 400
                          ? 2
                          : 3,
                      crossAxisSpacing: 14,
                      mainAxisSpacing: 14,
                      childAspectRatio:
                      MediaQuery.of(context).size.width < 400
                          ? 0.78
                          : 0.88,
                    ),
                    itemBuilder: (context, index) {
                      final item = categories[index];

                      return GestureDetector(
                        onTap: () {
                          onOpenCategory(
                            item["name"] as String,
                          );
                        },
                        child: Container(
                          padding:
                              const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(
                                    24),
                            border: Border.all(
                              color: Colors.white
                                  .withOpacity(0.08),
                            ),
                            gradient: LinearGradient(
                              begin:
                                  Alignment.topLeft,
                              end: Alignment
                                  .bottomRight,
                              colors: [
                                Colors.white
                                    .withOpacity(
                                        0.08),
                                Colors.white
                                    .withOpacity(
                                        0.03),
                              ],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color:
                                    (item["color"]
                                            as Color)
                                        .withOpacity(
                                            0.18),
                                blurRadius: 25,
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment:
                                MainAxisAlignment
                                    .center,
                            children: [
                              Container(
                                width: 44,
                                height: 44,
                                decoration:
                                    BoxDecoration(
                                  borderRadius:
                                      BorderRadius
                                          .circular(
                                              16),
                                  gradient:
                                      LinearGradient(
                                    colors: [
                                      (item["color"]
                                              as Color)
                                          .withOpacity(
                                              0.25),
                                      (item["color"]
                                              as Color)
                                          .withOpacity(
                                              0.08),
                                    ],
                                  ),
                                ),
                                child: Icon(
                                  item["icon"]
                                      as IconData,
                                  color:
                                      item["color"]
                                          as Color,
                                  size: 20,
                                ),
                              ),

                              const SizedBox(
                                  height: 12),

                              Text(
                                item["name"]
                                    as String,
                                textAlign:
                                    TextAlign.center,
                                style:
                                    GoogleFonts
                                        .poppins(
                                  color:
                                      Colors.white,
                                  fontSize: 11,
                                  fontWeight:
                                      FontWeight
                                          .w500,
                                ),
                              ),
                            ],
                          ),
                        )
                            .animate()
                            .fadeIn(
                              delay:
                                  (100 + index * 50)
                                      .ms,
                            )
                            .scale(
                              begin: const Offset(
                                  0.8, 0.8),
                              end: const Offset(
                                  1, 1),
                            ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),

          CustomBottomNav(
            active: 'explore',
            onNavigate: onNavigate,
          ),
        ],
      ),
    );
  }
}