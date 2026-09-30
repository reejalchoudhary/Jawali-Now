import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/data/mock_updates_data.dart';
import '../../../core/models/update_model.dart';
import '../../../shared/widgets/glass/glass_card.dart';
import '../../../shared/widgets/navigation/custom_bottom_nav.dart';

class UpdatesScreen extends StatelessWidget {
  final Function(String) onNavigate;

  const UpdatesScreen({
    super.key,
    required this.onNavigate,
  });

  Color getTypeColor(String type) {
    switch (type) {
      case 'alert':
        return const Color(0xFFEF4444);
      case 'weather':
        return const Color(0xFF6366F1);
      case 'local':
        return const Color.fromARGB(255, 3, 239, 200);
      case 'transport':
        return const Color.fromARGB(255, 217, 3, 113);
      case 'success':
        return const Color(0xFF10B981);
      default:
        return AppColors.primary;
    }
  }

  IconData getIcon(String icon) {
    switch (icon) {
      case 'car':
        return LucideIcons.car;
      case 'bus':
        return LucideIcons.bus;
      case 'coffee':
        return LucideIcons.coffee;
      case 'calendar':
        return LucideIcons.calendar;
      case 'cloud':
        return LucideIcons.cloud;
      case 'check':
        return LucideIcons.checkCircle2;
      default:
        return LucideIcons.radio;
    }
  }

  @override
  Widget build(BuildContext context) {
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
            left: -80,
            child: Container(
              width: 260,
              height: 260,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary.withOpacity(0.10),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.25),
                    blurRadius: 120,
                    spreadRadius: 30,
                  ),
                ],
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(
                24,
                24,
                24,
                140,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final isMobile = constraints.maxWidth < 430;

                      final titleSection = Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Live Updates",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: isMobile ? 26 : 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(
                                LucideIcons.mapPin,
                                size: 15,
                                color: AppColors.neonCyan,
                              ),
                              const SizedBox(width: 6),
                              Flexible(
                                child: Text(
                                  "What's happening in Jawali",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                    color: Colors.white.withOpacity(0.7),
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );

                      final liveBadge = Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(999),
                          gradient: LinearGradient(
                            colors: [
                              Colors.green.withOpacity(0.20),
                              Colors.green.withOpacity(0.08),
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.green.withOpacity(0.35),
                              blurRadius: 30,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              LucideIcons.radio,
                              size: 16,
                              color: Colors.green,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "Live",
                              style: GoogleFonts.poppins(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      )
                          .animate(
                            onPlay: (controller) => controller.repeat(),
                          )
                          .shimmer(
                            duration: 2.seconds,
                          );

                      if (isMobile) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            titleSection,
                            const SizedBox(height: 14),
                            liveBadge,
                          ],
                        );
                      }

                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: titleSection,
                          ),
                          const SizedBox(width: 16),
                          liveBadge,
                        ],
                      );
                    },
                  )
                      .animate()
                      .fadeIn(duration: 500.ms)
                      .slideY(
                        begin: -0.2,
                        end: 0,
                      ),
                  const SizedBox(height: 30),
                  Column(
                    children: List.generate(
                      mockUpdates.length,
                      (index) {
                        final UpdateModel update = mockUpdates[index];

                        final color = getTypeColor(update.type);

                        return Padding(
                          padding: const EdgeInsets.only(
                            bottom: 14,
                          ),
                          child: GlassCard(
                            padding: const EdgeInsets.all(18),
                            child: LayoutBuilder(
                              builder: (context, constraints) {
                                final isMobile =
                                    constraints.maxWidth < 380;

                                return isMobile
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 54,
                                                height: 54,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    18,
                                                  ),
                                                  gradient:
                                                      LinearGradient(
                                                    colors: [
                                                      color.withOpacity(
                                                        0.25,
                                                      ),
                                                      color.withOpacity(
                                                        0.08,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                child: Icon(
                                                  getIcon(update.icon),
                                                  color: color,
                                                  size: 24,
                                                ),
                                              ),
                                              const SizedBox(width: 14),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      update.title,
                                                      maxLines: 3,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style:
                                                          GoogleFonts.poppins(
                                                        color: Colors.white,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 6),
                                                    Text(
                                                      update.time,
                                                      style:
                                                          GoogleFonts.poppins(
                                                        color: Colors.white
                                                            .withOpacity(0.5),
                                                        fontSize: 11,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 14),
                                          Text(
                                            update.description,
                                            style: GoogleFonts.poppins(
                                              color:
                                                  Colors.white.withOpacity(0.7),
                                              fontSize: 13,
                                              height: 1.5,
                                            ),
                                          ),
                                          const SizedBox(height: 14),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 12,
                                              vertical: 6,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(999),
                                              color:
                                                  color.withOpacity(0.18),
                                            ),
                                            child: Text(
                                              update.type,
                                              style: GoogleFonts.poppins(
                                                color: color,
                                                fontSize: 11,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    : Row(
                                        children: [
                                          Container(
                                            width: 60,
                                            height: 60,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              gradient: LinearGradient(
                                                colors: [
                                                  color.withOpacity(0.25),
                                                  color.withOpacity(0.08),
                                                ],
                                              ),
                                            ),
                                            child: Icon(
                                              getIcon(update.icon),
                                              color: color,
                                              size: 28,
                                            ),
                                          ),
                                          const SizedBox(width: 16),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        update.title,
                                                        style: GoogleFonts
                                                            .poppins(
                                                          color: Colors.white,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 10),
                                                    Text(
                                                      update.time,
                                                      style: GoogleFonts
                                                          .poppins(
                                                        color: Colors.white
                                                            .withOpacity(0.4),
                                                        fontSize: 11,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 10),
                                                Text(
                                                  update.description,
                                                  style: GoogleFonts.poppins(
                                                    color: Colors.white
                                                        .withOpacity(0.7),
                                                    height: 1.6,
                                                    fontSize: 13,
                                                  ),
                                                ),
                                                const SizedBox(height: 14),
                                                Container(
                                                  padding:
                                                      const EdgeInsets
                                                          .symmetric(
                                                    horizontal: 12,
                                                    vertical: 6,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      999,
                                                    ),
                                                    color: color
                                                        .withOpacity(0.18),
                                                  ),
                                                  child: Text(
                                                    update.type,
                                                    style:
                                                        GoogleFonts.poppins(
                                                      color: color,
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      );
                              },
                            ),
                          ),
                        )
                            .animate()
                            .fadeIn(
                              delay: (200 + index * 80).ms,
                            )
                            .slide(
                              begin: const Offset(-0.2, 0),
                              end: Offset.zero,
                            );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  GlassCard(
                    padding: const EdgeInsets.all(28),
                    child: Column(
                      children: [
                        Container(
                          width: 72,
                          height: 72,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [
                                AppColors.neonCyan.withOpacity(0.25),
                                AppColors.neonCyan.withOpacity(0.08),
                              ],
                            ),
                          ),
                          child: const Icon(
                            LucideIcons.radio,
                            size: 34,
                            color: AppColors.neonCyan,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Stay Informed",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "We'll keep you updated with the latest happenings in Jawali",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            color: Colors.white.withOpacity(0.6),
                            height: 1.6,
                          ),
                        ),
                      ],
                    ),
                  )
                      .animate()
                      .fadeIn(delay: 500.ms)
                      .scale(),
                ],
              ),
            ),
          ),
          CustomBottomNav(
            active: 'updates',
            onNavigate: onNavigate,
          ),
        ],
      ),
    );
  }
}