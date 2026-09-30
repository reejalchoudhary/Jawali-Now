import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/data/mock_business_data.dart';
import '../../../core/models/business_model.dart';

class CategoryScreen extends StatefulWidget {
  final Function(String) onNavigate;
  final Function(BusinessModel) onOpenBusiness;
  final String categoryName;

  const CategoryScreen({
    super.key,
    required this.onNavigate,
    required this.categoryName,
    required this.onOpenBusiness,
  });

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  String selectedFilter = 'all';

  List<BusinessModel> get businesses {
    return mockBusinesses.where((business) {
      return business.category == widget.categoryName;
    }).toList();
  }

  List<BusinessModel> get filteredBusinesses {
    if (selectedFilter == 'open') {
      return businesses.where((b) => b.open).toList();
    }

    if (selectedFilter == 'trending') {
      return businesses.where((b) => b.trending).toList();
    }

    return businesses;
  }

  Widget _businessImage(
    BuildContext context,
    BusinessModel business,
    double size,
    double radius,
  ) {
    final image = business.image;

    if (image.startsWith('assets/')) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Image.asset(
          image,
          width: size,
          height: size,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.06),
                borderRadius: BorderRadius.circular(radius),
              ),
              child: Icon(
                LucideIcons.imageOff,
                color: Colors.white.withOpacity(0.35),
                size: size * 0.32,
              ),
            );
          },
        ),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Image.network(
        image,
        width: size,
        height: size,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.06),
              borderRadius: BorderRadius.circular(radius),
            ),
            child: Icon(
              LucideIcons.imageOff,
              color: Colors.white.withOpacity(0.35),
              size: size * 0.32,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkCharcoal,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;

          final horizontalPadding = width < 360
              ? 16.0
              : width < 420
                  ? 20.0
                  : 24.0;

          final titleSize = width < 360
              ? 23.0
              : width < 420
                  ? 25.0
                  : 28.0;

          final imageSize = width < 360
              ? 68.0
              : width < 420
                  ? 76.0
                  : 82.0;

          final cardPadding = width < 360 ? 13.0 : 18.0;

          return Stack(
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
                        color: AppColors.primary.withOpacity(0.20),
                        blurRadius: 120,
                        spreadRadius: 30,
                      ),
                    ],
                  ),
                ),
              ),
              SafeArea(
                child: SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(
                    horizontalPadding,
                    width < 360 ? 18 : 24,
                    horizontalPadding,
                    100,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              widget.onNavigate('explore');
                            },
                            child: Container(
                              width: width < 360 ? 42 : 46,
                              height: width < 360 ? 42 : 46,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.08),
                                ),
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.white.withOpacity(0.08),
                                    Colors.white.withOpacity(0.03),
                                  ],
                                ),
                              ),
                              child: Icon(
                                LucideIcons.arrowLeft,
                                color: Colors.white,
                                size: width < 360 ? 19 : 22,
                              ),
                            ),
                          ),
                          SizedBox(width: width < 360 ? 10 : 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.categoryName,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: titleSize,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  "${filteredBusinesses.length} places found",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                    color: Colors.white.withOpacity(0.6),
                                    fontSize: width < 360 ? 11 : 13,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            width: width < 360 ? 42 : 46,
                            height: width < 360 ? 42 : 46,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white.withOpacity(0.08),
                              ),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.white.withOpacity(0.08),
                                  Colors.white.withOpacity(0.03),
                                ],
                              ),
                            ),
                            child: Icon(
                              LucideIcons.slidersHorizontal,
                              color: Colors.white,
                              size: width < 360 ? 18 : 21,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: width < 360 ? 22 : 30),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        child: Row(
                          children: [
                            _FilterChip(
                              label: "All",
                              active: selectedFilter == 'all',
                              onTap: () {
                                setState(() {
                                  selectedFilter = 'all';
                                });
                              },
                            ),
                            const SizedBox(width: 10),
                            _FilterChip(
                              label: "Open Now",
                              active: selectedFilter == 'open',
                              onTap: () {
                                setState(() {
                                  selectedFilter = 'open';
                                });
                              },
                            ),
                            const SizedBox(width: 10),
                            _FilterChip(
                              label: "Trending",
                              active: selectedFilter == 'trending',
                              onTap: () {
                                setState(() {
                                  selectedFilter = 'trending';
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: width < 360 ? 22 : 30),
                      if (filteredBusinesses.isEmpty)
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 40,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.08),
                            ),
                            gradient: LinearGradient(
                              colors: [
                                Colors.white.withOpacity(0.07),
                                Colors.white.withOpacity(0.025),
                              ],
                            ),
                          ),
                          child: Column(
                            children: [
                              Icon(
                                LucideIcons.store,
                                color: Colors.white.withOpacity(0.35),
                                size: 42,
                              ),
                              const SizedBox(height: 14),
                              Text(
                                "No places found",
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "Try another filter",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  color: Colors.white.withOpacity(0.5),
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        )
                      else
                        Column(
                          children: List.generate(
                            filteredBusinesses.length,
                            (index) {
                              final business = filteredBusinesses[index];

                              return Padding(
                                padding: const EdgeInsets.only(bottom: 14),
                                child: GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: () {
                                    widget.onOpenBusiness(business);
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.all(cardPadding),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(28),
                                      border: Border.all(
                                        color: Colors.white.withOpacity(0.08),
                                      ),
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.white.withOpacity(0.08),
                                          Colors.white.withOpacity(0.03),
                                        ],
                                      ),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        _businessImage(
                                          context,
                                          business,
                                          imageSize,
                                          width < 360 ? 18 : 22,
                                        ),
                                        SizedBox(
                                          width: width < 360 ? 10 : 16,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                business.name,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.poppins(
                                                  color: Colors.white,
                                                  fontSize:
                                                      width < 360 ? 15 : 18,
                                                  fontWeight: FontWeight.bold,
                                                  height: 1.2,
                                                ),
                                              ),
                                              const SizedBox(height: 5),
                                              Text(
                                                business.category,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.poppins(
                                                  color: AppColors.neonCyan,
                                                  fontSize:
                                                      width < 360 ? 11 : 13,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              SizedBox(
                                                height: width < 360 ? 7 : 10,
                                              ),
                                              Wrap(
                                                spacing: width < 360 ? 8 : 14,
                                                runSpacing: 5,
                                                crossAxisAlignment:
                                                    WrapCrossAlignment.center,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Icon(
                                                        LucideIcons.star,
                                                        size:
                                                            width < 360 ? 12 : 14,
                                                        color: Colors.amber,
                                                      ),
                                                      const SizedBox(width: 4),
                                                      Text(
                                                        business.rating,
                                                        style:
                                                            GoogleFonts.poppins(
                                                          color: Colors.white
                                                              .withOpacity(0.8),
                                                          fontSize:
                                                              width < 360
                                                                  ? 10
                                                                  : 12,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Icon(
                                                        LucideIcons.mapPin,
                                                        size:
                                                            width < 360 ? 12 : 14,
                                                        color:
                                                            AppColors.neonCyan,
                                                      ),
                                                      const SizedBox(width: 4),
                                                      Text(
                                                        business.distance,
                                                        style:
                                                            GoogleFonts.poppins(
                                                          color: Colors.white
                                                              .withOpacity(0.8),
                                                          fontSize:
                                                              width < 360
                                                                  ? 10
                                                                  : 12,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                      .animate()
                                      .fadeIn(
                                        delay: (200 + index * 80).ms,
                                      )
                                      .slide(
                                        begin: const Offset(-0.2, 0),
                                        end: Offset.zero,
                                      ),
                                ),
                              );
                            },
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool active;
  final VoidCallback onTap;

  const _FilterChip({
    required this.label,
    required this.active,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(999),
          gradient: active
              ? const LinearGradient(
                  colors: [
                    AppColors.primary,
                    AppColors.secondary,
                  ],
                )
              : LinearGradient(
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
          label,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}