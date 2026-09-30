import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/glass/glass_card.dart';
import '../../../shared/widgets/navigation/custom_bottom_nav.dart';

class OffersScreen extends StatelessWidget {
  final Function(String) onNavigate;

  const OffersScreen({
    super.key,
    required this.onNavigate,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    final isVerySmall = screenWidth < 340;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1000;

    final horizontalPadding = isVerySmall
        ? 14.0
        : isMobile
            ? 18.0
            : isTablet
                ? 28.0
                : 34.0;

    final offers = [
      {
        "title": "Flat 30% OFF",
        "description": "Get 30% off on all menu items",
        "discount": "30% OFF",
        "validUntil": "Valid till Oct 31, 2026",
        "businessName": "Street 6200",
        "category": "Restaurant",
        "color": const Color(0xFFFF6B35),
        "image": "assets/rest.jpg",
      },
      {
        "title": "Free Home Delivery",
        "description": "Get free home delivery on orders above ₹500",
        "discount": "FREE DELIVERY",
        "validUntil": "Valid till OCT 15, 2026",
        "businessName": "Paaji Mart",
        "category": "Mart",
        "color": const Color(0xFFA855F7),
        "image": "assets/mart.jpg",
      },
      {
        "title": "Buy 1 Get 1 FREE",
        "description":
            "Visit AJ Collection and grab a FREE selected item with your purchase of men's jeans, shirts and casual wear.",
        "discount": "BOGO",
        "validUntil": "Valid till OCT 04, 2026",
        "businessName": "AJ Collection",
        "category": "Men's Fashion",
        "color": const Color(0xFF10B981),
        "image": "assets/aj.jpg",
      },
      {
        "title": "Gym Membership - 50% OFF",
        "description": "Get 50% off on monthly membership",
        "discount": "50% OFF",
        "validUntil": "Valid till September 30, 2026",
        "businessName": "The Dream Gym",
        "category": "Gym",
        "color": const Color(0xFFEC4899),
        "image": "assets/gym.jpg",
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.darkCharcoal,
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
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
          ),
          Positioned(
            top: -120,
            right: -80,
            child: IgnorePointer(
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
          ),
          SafeArea(
            child: LayoutBuilder(
              builder: (context, viewportConstraints) {
                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.fromLTRB(
                    horizontalPadding,
                    isVerySmall ? 16 : 24,
                    horizontalPadding,
                    140,
                  ),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: viewportConstraints.maxHeight - 140,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () => onNavigate('home'),
                              child: Container(
                                width: isVerySmall ? 42 : 46,
                                height: isVerySmall ? 42 : 46,
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
                                  size: isVerySmall ? 19 : 21,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: isVerySmall ? 10 : 16,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Special Offers",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: isVerySmall
                                          ? 20
                                          : isMobile
                                              ? 24
                                              : 28,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "Exclusive deals near you",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                      color: Colors.white.withOpacity(0.6),
                                      fontSize: isVerySmall ? 10 : 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: isVerySmall ? 9 : 14,
                                vertical: isVerySmall ? 7 : 10,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(999),
                                gradient: const LinearGradient(
                                  colors: [
                                    AppColors.primary,
                                    AppColors.secondary,
                                  ],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        AppColors.primary.withOpacity(0.35),
                                    blurRadius: 30,
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    LucideIcons.trendingUp,
                                    size: isVerySmall ? 12 : 16,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    "${offers.length} Live",
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: isVerySmall ? 9 : 11,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ).animate().shimmer(
                                  duration: 2.seconds,
                                ),
                          ],
                        ).animate().fadeIn(
                              duration: 400.ms,
                            ),
                        SizedBox(
                          height: isVerySmall ? 22 : 30,
                        ),
                        Column(
                          children: List.generate(
                            offers.length,
                            (index) {
                              final offer = offers[index];
                              final color = offer["color"] as Color;

                              return Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: _buildOfferCard(
                                  context: context,
                                  offer: offer,
                                  color: color,
                                  isVerySmall: isVerySmall,
                                  isMobile: isMobile,
                                  isTablet: isTablet,
                                ),
                              )
                                  .animate()
                                  .fadeIn(
                                    delay: (150 + index * 70).ms,
                                    duration: 400.ms,
                                  )
                                  .slideY(
                                    begin: 0.08,
                                    end: 0,
                                  );
                            },
                          ),
                        ),
                        const SizedBox(height: 10),
                        GlassCard(
                          padding: EdgeInsets.all(
                            isVerySmall
                                ? 20
                                : isMobile
                                    ? 24
                                    : 28,
                          ),
                          child: Column(
                            children: [
                              Container(
                                width: isVerySmall ? 60 : 72,
                                height: isVerySmall ? 60 : 72,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    colors: [
                                      AppColors.primary.withOpacity(0.25),
                                      AppColors.secondary.withOpacity(0.10),
                                    ],
                                  ),
                                ),
                                child: Icon(
                                  LucideIcons.percent,
                                  size: isVerySmall ? 28 : 34,
                                  color: AppColors.primary,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                "More Offers Coming Soon!",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: isVerySmall
                                      ? 18
                                      : isMobile
                                          ? 20
                                          : 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                "Check back regularly for exciting new deals and discounts",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  color: Colors.white.withOpacity(0.6),
                                  fontSize: isVerySmall ? 11 : 13,
                                  height: 1.6,
                                ),
                              ),
                            ],
                          ),
                        ).animate().fadeIn(
                              delay: 450.ms,
                              duration: 400.ms,
                            ).scale(
                              begin: const Offset(0.96, 0.96),
                              end: const Offset(1, 1),
                            ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: CustomBottomNav(
              active: 'offers',
              onNavigate: onNavigate,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOfferCard({
    required BuildContext context,
    required Map<String, dynamic> offer,
    required Color color,
    required bool isVerySmall,
    required bool isMobile,
    required bool isTablet,
  }) {
    final title = offer["title"] as String;
    final description = offer["description"] as String;
    final discount = offer["discount"] as String;
    final validUntil = offer["validUntil"] as String;
    final businessName = offer["businessName"] as String;
    final category = offer["category"] as String;
    final image = offer["image"] as String;

    return GlassCard(
      padding: EdgeInsets.zero,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final cardWidth = constraints.maxWidth;

          if (isMobile || cardWidth < 600) {
            return Padding(
              padding: EdgeInsets.all(
                isVerySmall ? 10 : 12,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: isVerySmall ? 145 : 180,
                    child: _buildImage(
                      image: image,
                      color: color,
                      height: isVerySmall ? 145 : 180,
                      discount: discount,
                    ),
                  ),
                  SizedBox(
                    height: isVerySmall ? 14 : 16,
                  ),
                  _buildOfferDetails(
                    title: title,
                    description: description,
                    businessName: businessName,
                    category: category,
                    validUntil: validUntil,
                    color: color,
                    isVerySmall: isVerySmall,
                  ),
                ],
              ),
            );
          }

          final imageWidth = isTablet
              ? 220.0
              : cardWidth > 1000
                  ? 300.0
                  : 260.0;

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: imageWidth,
                  height: isTablet ? 175 : 200,
                  child: _buildImage(
                    image: image,
                    color: color,
                    height: isTablet ? 175 : 200,
                    discount: discount,
                  ),
                ),
                const SizedBox(width: 22),
                Expanded(
                  child: _buildOfferDetails(
                    title: title,
                    description: description,
                    businessName: businessName,
                    category: category,
                    validUntil: validUntil,
                    color: color,
                    isVerySmall: false,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildImage({
    required String image,
    required Color color,
    required double height,
    required String discount,
  }) {
    final Widget imageWidget;

    if (image.startsWith('assets/')) {
      imageWidget = Image.asset(
        image,
        width: double.infinity,
        height: height,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return _imageFallback(
            color: color,
            height: height,
          );
        },
      );
    } else {
      imageWidget = Image.network(
        image,
        width: double.infinity,
        height: height,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return _imageFallback(
            color: color,
            height: height,
          );
        },
      );
    }

    return SizedBox(
      width: double.infinity,
      height: height,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: imageWidget,
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(999),
                color: color,
                boxShadow: [
                  BoxShadow(
                    color: color.withOpacity(0.35),
                    blurRadius: 15,
                  ),
                ],
              ),
              child: Text(
                discount,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _imageFallback({
    required Color color,
    required double height,
  }) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            color.withOpacity(0.25),
            color.withOpacity(0.05),
          ],
        ),
      ),
      child: Center(
        child: Icon(
          LucideIcons.imageOff,
          color: color,
          size: 40,
        ),
      ),
    );
  }

  Widget _buildOfferDetails({
    required String title,
    required String description,
    required String businessName,
    required String category,
    required String validUntil,
    required Color color,
    required bool isVerySmall,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 9,
            vertical: 5,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(999),
            color: color.withOpacity(0.12),
          ),
          child: Text(
            category,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.poppins(
              color: color,
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: isVerySmall ? 17 : 21,
            fontWeight: FontWeight.bold,
            height: 1.25,
          ),
        ),
        const SizedBox(height: 9),
        Text(
          description,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.poppins(
            color: Colors.white.withOpacity(0.7),
            fontSize: isVerySmall ? 11 : 13,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Icon(
              LucideIcons.tag,
              size: 14,
              color: color,
            ),
            const SizedBox(width: 7),
            Expanded(
              child: Text(
                businessName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                  color: Colors.white.withOpacity(0.85),
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 9),
        Row(
          children: [
            const Icon(
              LucideIcons.clock3,
              size: 14,
              color: Colors.white54,
            ),
            const SizedBox(width: 7),
            Expanded(
              child: Text(
                validUntil,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 11,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}