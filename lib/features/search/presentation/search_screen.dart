import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/data/mock_business_data.dart';
import '../../../core/models/business_model.dart';
import '../../../shared/widgets/navigation/custom_bottom_nav.dart';

class SearchScreen extends StatefulWidget {
  final Function(String) onNavigate;
  final Function(BusinessModel) onOpenBusiness;

  const SearchScreen({
    super.key,
    required this.onNavigate,
    required this.onOpenBusiness,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();

  String searchQuery = '';

  final trendingSearches = [
    "Hotels",
    "Cafes",
    "Hospitals",
    "Gym",
    "Restaurants",
  ];

  final recentSearches = [
    "Coffee shops",
    "Medical stores",
    "Gyms",
    "Fast food",
  ];

  List<BusinessModel> get searchResults {
    if (searchQuery.trim().isEmpty) {
      return [];
    }

    final query = searchQuery.toLowerCase().trim();

    return mockBusinesses.where((business) {
      return business.name.toLowerCase().contains(query) ||
          business.category.toLowerCase().contains(query) ||
          business.description.toLowerCase().contains(query);
    }).toList();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  Widget _businessImage(
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

  void _setSearch(String value) {
    setState(() {
      searchQuery = value;
      searchController.text = value;
      searchController.selection = TextSelection.fromPosition(
        TextPosition(offset: searchController.text.length),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkCharcoal,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;

          final isVerySmall = width < 340;
          final isSmall = width < 400;

          final horizontalPadding = isVerySmall
              ? 14.0
              : isSmall
                  ? 18.0
                  : 24.0;

          final searchHeight = isVerySmall ? 54.0 : 60.0;

          final sectionTitleSize = isVerySmall ? 17.0 : 20.0;

          final resultImageSize = isVerySmall
              ? 66.0
              : isSmall
                  ? 72.0
                  : 80.0;

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
                left: -60,
                child: Container(
                  width: 260,
                  height: 260,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.secondary.withOpacity(0.12),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.secondary.withOpacity(0.20),
                        blurRadius: 120,
                        spreadRadius: 30,
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
                    150,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              widget.onNavigate('home');
                            },
                            child: Container(
                              width: isVerySmall ? 42 : 48,
                              height: isVerySmall ? 42 : 48,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.08),
                                ),
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.white.withOpacity(0.10),
                                    Colors.white.withOpacity(0.05),
                                  ],
                                ),
                              ),
                              child: Icon(
                                LucideIcons.arrowLeft,
                                color: Colors.white,
                                size: isVerySmall ? 19 : 22,
                              ),
                            ),
                          )
                              .animate()
                              .fadeIn(duration: 400.ms)
                              .scale(),
                          SizedBox(width: isVerySmall ? 10 : 14),
                          Expanded(
                            child: Container(
                              height: searchHeight,
                              padding: EdgeInsets.symmetric(
                                horizontal: isVerySmall ? 14 : 18,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(22),
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
                                children: [
                                  Icon(
                                    LucideIcons.search,
                                    color: Colors.white.withOpacity(0.6),
                                    size: isVerySmall ? 19 : 22,
                                  ),
                                  SizedBox(
                                    width: isVerySmall ? 8 : 12,
                                  ),
                                  Expanded(
                                    child: TextField(
                                      controller: searchController,
                                      autofocus: true,
                                      maxLines: 1,
                                      textInputAction:
                                          TextInputAction.search,
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: isVerySmall ? 13 : 15,
                                      ),
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        isDense: true,
                                        hintText:
                                            "Search places, categories...",
                                        hintStyle: GoogleFonts.poppins(
                                          color:
                                              Colors.white.withOpacity(0.5),
                                          fontSize: isVerySmall ? 12 : 14,
                                        ),
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          searchQuery = value;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            )
                                .animate()
                                .fadeIn(delay: 100.ms)
                                .slideY(
                                  begin: 0.2,
                                  end: 0,
                                ),
                          ),
                        ],
                      ),
                      if (searchQuery.trim().isEmpty) ...[
                        SizedBox(height: isVerySmall ? 28 : 40),
                        Row(
                          children: [
                            Icon(
                              LucideIcons.trendingUp,
                              color: AppColors.neonOrange,
                              size: isVerySmall ? 19 : 22,
                            ),
                            SizedBox(
                              width: isVerySmall ? 6 : 8,
                            ),
                            Expanded(
                              child: Text(
                                "Trending Searches",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: sectionTitleSize,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: isVerySmall ? 14 : 18),
                        Wrap(
                          spacing: isVerySmall ? 8 : 12,
                          runSpacing: isVerySmall ? 8 : 12,
                          children: trendingSearches.map((item) {
                            return GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {
                                _setSearch(item);
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: isVerySmall ? 13 : 18,
                                  vertical: isVerySmall ? 10 : 14,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
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
                                child: Text(
                                  item,
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: isVerySmall ? 11 : 13,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        SizedBox(height: isVerySmall ? 28 : 36),
                        Row(
                          children: [
                            Icon(
                              LucideIcons.clock3,
                              color: AppColors.neonCyan,
                              size: isVerySmall ? 19 : 22,
                            ),
                            SizedBox(
                              width: isVerySmall ? 6 : 8,
                            ),
                            Expanded(
                              child: Text(
                                "Recent Searches",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: sectionTitleSize,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: isVerySmall ? 14 : 18),
                        Column(
                          children: List.generate(
                            recentSearches.length,
                            (index) {
                              final item = recentSearches[index];

                              return Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 12,
                                ),
                                child: GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: () {
                                    _setSearch(item);
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.all(
                                      isVerySmall ? 13 : 16,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        color:
                                            Colors.white.withOpacity(0.08),
                                      ),
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.white.withOpacity(0.06),
                                          Colors.white.withOpacity(0.03),
                                        ],
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          LucideIcons.history,
                                          color:
                                              Colors.white.withOpacity(0.6),
                                          size: isVerySmall ? 16 : 18,
                                        ),
                                        SizedBox(
                                          width: isVerySmall ? 9 : 12,
                                        ),
                                        Expanded(
                                          child: Text(
                                            item,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize:
                                                  isVerySmall ? 12 : 14,
                                            ),
                                          ),
                                        ),
                                        Icon(
                                          LucideIcons.chevronRight,
                                          color:
                                              Colors.white.withOpacity(0.35),
                                          size: isVerySmall ? 16 : 18,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                                    .animate()
                                    .fadeIn(
                                      delay: (200 + index * 80).ms,
                                    )
                                    .slideX(
                                      begin: -0.2,
                                      end: 0,
                                    ),
                              );
                            },
                          ),
                        ),
                      ] else ...[
                        SizedBox(height: isVerySmall ? 22 : 30),
                        Text(
                          "${searchResults.length} results found",
                          style: GoogleFonts.poppins(
                            color: Colors.white.withOpacity(0.6),
                            fontSize: isVerySmall ? 11 : 13,
                          ),
                        ),
                        SizedBox(height: isVerySmall ? 14 : 20),
                        if (searchResults.isEmpty)
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: isVerySmall ? 45 : 60,
                              ),
                              child: Column(
                                children: [
                                  Icon(
                                    LucideIcons.searchX,
                                    size: isVerySmall ? 55 : 70,
                                    color: Colors.white.withOpacity(0.3),
                                  ),
                                  SizedBox(
                                    height: isVerySmall ? 14 : 20,
                                  ),
                                  Text(
                                    "No businesses found",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: isVerySmall ? 17 : 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal:
                                          isVerySmall ? 10 : 20,
                                    ),
                                    child: Text(
                                      "Try searching cafes, hotels, hospitals...",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                        color:
                                            Colors.white.withOpacity(0.6),
                                        fontSize: isVerySmall ? 11 : 13,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        else
                          Column(
                            children: List.generate(
                              searchResults.length,
                              (index) {
                                final business = searchResults[index];

                                return Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 14,
                                  ),
                                  child: GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () {
                                      widget.onOpenBusiness(business);
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.all(
                                        isVerySmall ? 12 : 18,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(24),
                                        border: Border.all(
                                          color: Colors.white
                                              .withOpacity(0.08),
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
                                            business,
                                            resultImageSize,
                                            isVerySmall ? 15 : 18,
                                          ),
                                          SizedBox(
                                            width: isVerySmall ? 10 : 16,
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  business.name,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style:
                                                      GoogleFonts.poppins(
                                                    color: Colors.white,
                                                    fontSize: isVerySmall
                                                        ? 14
                                                        : isSmall
                                                            ? 16
                                                            : 18,
                                                    height: 1.2,
                                                    fontWeight:
                                                        FontWeight.bold,
                                                  ),
                                                ),
                                                const SizedBox(height: 6),
                                                Text(
                                                  business.category,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style:
                                                      GoogleFonts.poppins(
                                                    color:
                                                        AppColors.neonCyan,
                                                    fontSize: isVerySmall
                                                        ? 10
                                                        : 13,
                                                    fontWeight:
                                                        FontWeight.w600,
                                                  ),
                                                ),
                                                const SizedBox(height: 8),
                                                Text(
                                                  business.description,
                                                  maxLines: isVerySmall
                                                      ? 2
                                                      : 3,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style:
                                                      GoogleFonts.poppins(
                                                    color: Colors.white
                                                        .withOpacity(0.65),
                                                    fontSize: isVerySmall
                                                        ? 10
                                                        : 13,
                                                    height: 1.4,
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
                                        delay: (index * 80).ms,
                                      )
                                      .slideY(
                                        begin: 0.2,
                                        end: 0,
                                      ),
                                );
                              },
                            ),
                          ),
                      ],
                    ],
                  ),
                ),
              ),
              CustomBottomNav(
                active: 'search',
                onNavigate: widget.onNavigate,
              ),
            ],
          );
        },
      ),
    );
  }
}