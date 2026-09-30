import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/navigation/custom_bottom_nav.dart';

class FavoritesScreen extends StatelessWidget {
  final Function(String) onNavigate;

  const FavoritesScreen({
    super.key,
    required this.onNavigate,
  });

  @override
  Widget build(BuildContext context) {
    final favorites = [
    ];

    return Scaffold(
      backgroundColor: AppColors.darkCharcoal,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end:
                    Alignment.bottomRight,
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
              width: 260,
              height: 260,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.neonPink
                    .withOpacity(0.10),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.neonPink
                        .withOpacity(0.25),
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
                  const EdgeInsets.fromLTRB(
                24,
                24,
                24,
                140,
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment:
                        CrossAxisAlignment
                            .start,
                    children: [
                      Text(
                        "My Favorites",
                        style:
                            GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Row(
                        children: [
                          const Icon(
                            LucideIcons.heart,
                            size: 16,
                            color:
                                AppColors.neonPink,
                          ),

                          const SizedBox(width: 8),

                          Text(
                            "${favorites.length} saved places",
                            style:
                                GoogleFonts
                                    .poppins(
                              color: Colors
                                  .white
                                  .withOpacity(
                                      0.7),
                              fontSize: 14,
                            ),
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

                  const SizedBox(height: 30),

                  if (favorites.isNotEmpty)
                    Column(
                      children:
                          List.generate(
                        favorites.length,
                        (index) {
                          final business =
                              favorites[index];

                          return Padding(
                            padding:
                                const EdgeInsets
                                    .only(
                                    bottom: 14),
                            child:
                                GestureDetector(
                              onTap: () {
                                onNavigate(
                                    'business');
                              },
                              child: Container(
                                width: double
                                    .infinity,
                                padding:
                                    const EdgeInsets
                                        .all(18),
                                decoration:
                                    BoxDecoration(
                                  borderRadius:
                                      BorderRadius
                                          .circular(
                                              28),
                                  border:
                                      Border.all(
                                    color: Colors
                                        .white
                                        .withOpacity(
                                            0.08),
                                  ),
                                  gradient:
                                      LinearGradient(
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
                                      color: AppColors
                                          .neonPink
                                          .withOpacity(
                                              0.10),
                                      blurRadius:
                                          30,
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 82,
                                      height: 82,
                                      decoration:
                                          BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(
                                                22),
                                        gradient:
                                            const LinearGradient(
                                          colors: [
                                            AppColors
                                                .primary,
                                            AppColors
                                                .secondary,
                                          ],
                                        ),
                                      ),
                                      child:
                                          const Icon(
                                        LucideIcons
                                            .image,
                                        color: Colors
                                            .white,
                                        size: 32,
                                      ),
                                    ),

                                    const SizedBox(
                                        width:
                                            16),

                                    Expanded(
                                      child:
                                          Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            business["name"]
                                                as String,
                                            style:
                                                GoogleFonts.poppins(
                                              color:
                                                  Colors.white,
                                              fontSize:
                                                  18,
                                              fontWeight:
                                                  FontWeight.bold,
                                            ),
                                          ),

                                          const SizedBox(
                                              height:
                                                  6),

                                          Text(
                                            business["category"]
                                                as String,
                                            style:
                                                GoogleFonts.poppins(
                                              color:
                                                  AppColors.neonCyan,
                                              fontSize:
                                                  13,
                                              fontWeight:
                                                  FontWeight.w600,
                                            ),
                                          ),

                                          const SizedBox(
                                              height:
                                                  10),

                                          Row(
                                            children: [
                                              const Icon(
                                                LucideIcons.star,
                                                size:
                                                    14,
                                                color:
                                                    Colors.amber,
                                              ),

                                              const SizedBox(
                                                  width:
                                                      4),

                                              Text(
                                                business["rating"]
                                                    as String,
                                                style:
                                                    GoogleFonts.poppins(
                                                  color: Colors
                                                      .white
                                                      .withOpacity(
                                                          0.8),
                                                  fontSize:
                                                      12,
                                                ),
                                              ),

                                              const SizedBox(
                                                  width:
                                                      14),

                                              const Icon(
                                                LucideIcons.mapPin,
                                                size:
                                                    14,
                                                color:
                                                    AppColors.neonCyan,
                                              ),

                                              const SizedBox(
                                                  width:
                                                      4),

                                              Text(
                                                business["distance"]
                                                    as String,
                                                style:
                                                    GoogleFonts.poppins(
                                                  color: Colors
                                                      .white
                                                      .withOpacity(
                                                          0.8),
                                                  fontSize:
                                                      12,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),

                                    Container(
                                      width: 46,
                                      height: 46,
                                      decoration:
                                          BoxDecoration(
                                        shape: BoxShape
                                            .circle,
                                        gradient:
                                            LinearGradient(
                                          colors: [
                                            AppColors
                                                .neonPink
                                                .withOpacity(
                                                    0.25),
                                            AppColors
                                                .neonPink
                                                .withOpacity(
                                                    0.08),
                                          ],
                                        ),
                                      ),
                                      child:
                                          const Icon(
                                        LucideIcons
                                            .heart,
                                        color: AppColors
                                            .neonPink,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                                  .animate()
                                  .fadeIn(
                                    delay:
                                        (200 +
                                                index *
                                                    80)
                                            .ms,
                                  )
                                  .slide(
                                    begin:
                                        const Offset(
                                            -0.2,
                                            0),
                                    end:
                                        Offset.zero,
                                  ),
                            ),
                          );
                        },
                      ),
                    )
                  else
                    Center(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(
                                top: 100),
                        child: Column(
                          children: [
                            Container(
                              width: 130,
                              height: 130,
                              decoration:
                                  BoxDecoration(
                                shape:
                                    BoxShape.circle,
                                gradient:
                                    LinearGradient(
                                  colors: [
                                    AppColors
                                        .neonPink
                                        .withOpacity(
                                            0.25),
                                    AppColors
                                        .neonPink
                                        .withOpacity(
                                            0.05),
                                  ],
                                ),
                              ),
                              child: const Icon(
                                LucideIcons.heart,
                                size: 56,
                                color:
                                    AppColors
                                        .neonPink,
                              ),
                            )
                                .animate(
                                  onPlay:
                                      (controller) =>
                                          controller
                                              .repeat(),
                                )
                                .scale(
                                  duration:
                                      2.seconds,
                                  begin:
                                      const Offset(
                                          1, 1),
                                  end:
                                      const Offset(
                                          1.05,
                                          1.05),
                                ),

                            const SizedBox(
                                height: 30),

                            Text(
                              "No Favorites Yet",
                              style:
                                  GoogleFonts
                                      .poppins(
                                color:
                                    Colors.white,
                                fontSize: 28,
                                fontWeight:
                                    FontWeight
                                        .bold,
                              ),
                            ),

                            const SizedBox(
                                height: 12),

                            Text(
                              "Start exploring and save your favorite places",
                              textAlign:
                                  TextAlign.center,
                              style:
                                  GoogleFonts
                                      .poppins(
                                color: Colors
                                    .white
                                    .withOpacity(
                                        0.6),
                                height: 1.6,
                              ),
                            ),

                            const SizedBox(
                                height: 30),

                            GestureDetector(
                              onTap: () {
                                onNavigate(
                                    'home');
                              },
                              child:
                                  Container(
                                padding:
                                    const EdgeInsets
                                        .symmetric(
                                  horizontal:
                                      32,
                                  vertical: 16,
                                ),
                                decoration:
                                    BoxDecoration(
                                  borderRadius:
                                      BorderRadius
                                          .circular(
                                              999),
                                  gradient:
                                      const LinearGradient(
                                    colors: [
                                      AppColors
                                          .primary,
                                      AppColors
                                          .secondary,
                                    ],
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors
                                          .primary
                                          .withOpacity(
                                              0.35),
                                      blurRadius:
                                          30,
                                    ),
                                  ],
                                ),
                                child: Text(
                                  "Explore Places",
                                  style:
                                      GoogleFonts
                                          .poppins(
                                    color: Colors
                                        .white,
                                    fontWeight:
                                        FontWeight
                                            .bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                            .animate()
                            .fadeIn()
                            .scale(),
                      ),
                    ),
                ],
              ),
            ),
          ),

          CustomBottomNav(
            active: 'favorites',
            onNavigate: onNavigate,
          ),
        ],
      ),
    );
  }
}