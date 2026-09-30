import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/models/business_model.dart';
import '../../../shared/widgets/glass/glass_card.dart';

class BusinessDetailScreen extends StatefulWidget {
  final Function(String) onNavigate;
  final BusinessModel business;

  const BusinessDetailScreen({
    super.key,
    required this.onNavigate,
    required this.business,
  });

  @override
  State<BusinessDetailScreen> createState() => _BusinessDetailScreenState();
}

class _BusinessDetailScreenState extends State<BusinessDetailScreen> {
  bool isFavorite = false;

  List<String> get features {
    switch (widget.business.category) {
      case "Hospital":
        return [
          "Emergency",
          "24/7 Service",
          "ICU",
          "Pharmacy",
        ];

      case "Gym":
        return [
          "Trainer",
          "Cardio",
          "Weights",
          "Protein Bar",
        ];

      case "Hotel":
        return [
          "Free WiFi",
          "Parking",
          "Room Service",
          "Mountain View",
        ];

      default:
        return [
          "Outdoor Seating",
          "Mountain View",
          "Local Cuisine",
          "Family Friendly",
        ];
    }
  }

  Widget _businessImage(
    BuildContext context,
    double height,
  ) {
    final image = widget.business.image;

    if (image.startsWith('assets/')) {
      return Image.asset(
        image,
        width: double.infinity,
        height: height,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: double.infinity,
            height: height,
            color: AppColors.darkSurface,
            child: Icon(
              LucideIcons.imageOff,
              color: Colors.white.withOpacity(0.35),
              size: 48,
            ),
          );
        },
      );
    }

    return Image.network(
      image,
      width: double.infinity,
      height: height,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          width: double.infinity,
          height: height,
          color: AppColors.darkSurface,
          child: Icon(
            LucideIcons.imageOff,
            color: Colors.white.withOpacity(0.35),
            size: 48,
          ),
        );
      },
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String value,
    bool allowWrap = true,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: iconColor,
          size: 21,
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                softWrap: allowWrap,
                maxLines: allowWrap ? null : 2,
                overflow: allowWrap
                    ? TextOverflow.visible
                    : TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkCharcoal,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final height = constraints.maxHeight;

          final isSmall = width < 380;
          final isVerySmall = width < 340;

          final horizontalPadding = isVerySmall
              ? 16.0
              : isSmall
                  ? 20.0
                  : 24.0;

          final heroHeight = width < 340
              ? 280.0
              : width < 380
                  ? 310.0
                  : width < 600
                      ? 340.0
                      : 380.0;

          final titleSize = isVerySmall
              ? 24.0
              : isSmall
                  ? 27.0
                  : 30.0;

          final sectionTitleSize = isSmall ? 21.0 : 24.0;

          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: heroHeight,
                      width: double.infinity,
                      child: _businessImage(
                        context,
                        heroHeight,
                      ),
                    ),
                    Container(
                      height: heroHeight,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.25),
                            AppColors.darkCharcoal.withOpacity(0.95),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).padding.top + 12,
                      left: horizontalPadding,
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          widget.onNavigate('category');
                        },
                        child: Container(
                          width: isVerySmall ? 44 : 48,
                          height: isVerySmall ? 44 : 48,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black.withOpacity(0.5),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.1),
                            ),
                          ),
                          child: Icon(
                            LucideIcons.arrowLeft,
                            color: Colors.white,
                            size: isVerySmall ? 19 : 22,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).padding.top + 12,
                      right: horizontalPadding,
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          setState(() {
                            isFavorite = !isFavorite;
                          });
                        },
                        child: Container(
                          width: isVerySmall ? 44 : 48,
                          height: isVerySmall ? 44 : 48,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black.withOpacity(0.5),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.1),
                            ),
                          ),
                          child: Icon(
                            isFavorite
                                ? LucideIcons.heart
                                : LucideIcons.heart,
                            color: isFavorite
                                ? Colors.red
                                : Colors.white,
                            size: isVerySmall ? 19 : 22,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Transform.translate(
                  offset: const Offset(0, -30),
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: AppColors.darkCharcoal,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(32),
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(
                      horizontalPadding,
                      isSmall ? 20 : 24,
                      horizontalPadding,
                      40,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.business.name,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: titleSize,
                            height: 1.2,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          widget.business.description,
                          style: GoogleFonts.poppins(
                            color: Colors.white.withOpacity(0.72),
                            height: 1.7,
                            fontSize: isSmall ? 13 : 15,
                          ),
                        ),
                        SizedBox(height: isSmall ? 22 : 28),
                        Wrap(
                          spacing: 18,
                          runSpacing: 10,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  LucideIcons.star,
                                  size: isSmall ? 17 : 20,
                                  color: Colors.amber,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  widget.business.rating,
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: isSmall ? 16 : 18,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  LucideIcons.mapPin,
                                  size: isSmall ? 16 : 18,
                                  color: AppColors.neonCyan,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  widget.business.distance,
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: isSmall ? 13 : 14,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  LucideIcons.clock3,
                                  size: isSmall ? 16 : 18,
                                  color: widget.business.open
                                      ? Colors.green
                                      : Colors.red,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  widget.business.open
                                      ? "Open"
                                      : "Closed",
                                  style: GoogleFonts.poppins(
                                    color: widget.business.open
                                        ? Colors.green
                                        : Colors.red,
                                    fontWeight: FontWeight.w600,
                                    fontSize: isSmall ? 13 : 14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: isSmall ? 24 : 32),
                        LayoutBuilder(
                          builder: (context, actionConstraints) {
                            final actionWidth =
                                actionConstraints.maxWidth;

                            if (actionWidth < 500) {
                              return Column(
                                children: [
                                  _ActionCard(
                                    icon: LucideIcons.phone,
                                    title: "Call",
                                    color: Colors.orange,
                                    onTap: () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            "Calling ${widget.business.phone}",
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  const SizedBox(height: 12),
                                  _ActionCard(
                                    icon: LucideIcons.navigation,
                                    title: "Directions",
                                    color: AppColors.neonCyan,
                                    onTap: () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            "Opening directions...",
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  const SizedBox(height: 12),
                                  _ActionCard(
                                    icon: LucideIcons.share2,
                                    title: "Share",
                                    color: Colors.purple,
                                    onTap: () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            "Sharing ${widget.business.name}",
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              );
                            }

                            return Row(
                              children: [
                                Expanded(
                                  child: _ActionCard(
                                    icon: LucideIcons.phone,
                                    title: "Call",
                                    color: Colors.orange,
                                    onTap: () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            "Calling ${widget.business.phone}",
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(width: 14),
                                Expanded(
                                  child: _ActionCard(
                                    icon: LucideIcons.navigation,
                                    title: "Directions",
                                    color: AppColors.neonCyan,
                                    onTap: () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            "Opening directions...",
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(width: 14),
                                Expanded(
                                  child: _ActionCard(
                                    icon: LucideIcons.share2,
                                    title: "Share",
                                    color: Colors.purple,
                                    onTap: () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            "Sharing ${widget.business.name}",
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        SizedBox(height: isSmall ? 24 : 28),
                        GlassCard(
                          padding: EdgeInsets.all(
                            isVerySmall ? 16 : 24,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Information",
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: sectionTitleSize,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: isSmall ? 20 : 24),
                              _buildInfoRow(
                                icon: LucideIcons.mapPin,
                                iconColor: AppColors.neonCyan,
                                title: "Address",
                                value: widget.business.address,
                              ),
                              SizedBox(height: isSmall ? 20 : 24),
                              _buildInfoRow(
                                icon: LucideIcons.phone,
                                iconColor: Colors.orange,
                                title: "Phone",
                                value: widget.business.phone,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: isSmall ? 24 : 28),
                        Text(
                          "Features",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: sectionTitleSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: isSmall ? 14 : 18),
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: features.map((feature) {
                            return Container(
                              constraints: BoxConstraints(
                                maxWidth: width - 60,
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: isSmall ? 14 : 18,
                                vertical: isSmall ? 10 : 12,
                              ),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(999),
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.white.withOpacity(0.08),
                                    Colors.white.withOpacity(0.03),
                                  ],
                                ),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.08),
                                ),
                              ),
                              child: Text(
                                feature,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: isSmall ? 11 : 13,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        SizedBox(
                          height: height < 650 ? 30 : 10,
                        ),
                      ],
                    ).animate().fadeIn(duration: 500.ms).slideY(
                          begin: 0.2,
                          end: 0,
                        ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _ActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  final VoidCallback onTap;

  const _ActionCard({
    required this.icon,
    required this.title,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: GlassCard(
        padding: const EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 12,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  colors: [
                    color.withOpacity(0.25),
                    color.withOpacity(0.08),
                  ],
                ),
              ),
              child: Icon(
                icon,
                color: color,
                size: 21,
              ),
            ),
            const SizedBox(width: 12),
            Flexible(
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}