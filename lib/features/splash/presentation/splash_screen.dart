import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  final VoidCallback onComplete;

  const SplashScreen({
    super.key,
    required this.onComplete,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _entranceController;
  late final AnimationController _loaderController;

  late final Animation<double> _contentOpacity;
  late final Animation<Offset> _contentSlide;

  Timer? _completionTimer;
  Timer? _exitTimer;

  bool _isExiting = false;

  @override
  void initState() {
    super.initState();

    _entranceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _loaderController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );

    _contentOpacity = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _entranceController,
        curve: Curves.easeOut,
      ),
    );

    _contentSlide = Tween<Offset>(
      begin: const Offset(0, 0.08),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _entranceController,
        curve: Curves.easeOutCubic,
      ),
    );

    _entranceController.forward();
    _loaderController.repeat();

    _completionTimer = Timer(
      const Duration(milliseconds: 3200),
      _startExit,
    );
  }

  void _startExit() {
    if (!mounted || _isExiting) return;

    setState(() {
      _isExiting = true;
    });

    _exitTimer = Timer(
      const Duration(milliseconds: 350),
      () {
        if (!mounted) return;
        widget.onComplete();
      },
    );
  }

  @override
  void dispose() {
    _completionTimer?.cancel();
    _exitTimer?.cancel();
    _entranceController.dispose();
    _loaderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    final width = size.width;
    final height = size.height;

    final isSmallPhone = width < 360;
    final isPhone = width < 600;
    final isTablet = width >= 600 && width < 900;

    final logoSize = isSmallPhone
        ? 112.0
        : isPhone
            ? 132.0
            : isTablet
                ? 155.0
                : 175.0;

    final titleSize = isSmallPhone
        ? 34.0
        : isPhone
            ? 40.0
            : isTablet
                ? 48.0
                : 54.0;

    final taglineSize = isSmallPhone
        ? 14.0
        : isPhone
            ? 16.0
            : isTablet
                ? 18.0
                : 20.0;

    final descriptionSize = isSmallPhone
        ? 10.5
        : isPhone
            ? 12.0
            : 13.0;

    final horizontalPadding = isSmallPhone
        ? 20.0
        : isPhone
            ? 28.0
            : isTablet
                ? 55.0
                : 80.0;

    final topSpacing = height < 650
        ? 20.0
        : height < 800
            ? 45.0
            : isTablet
                ? 70.0
                : 85.0;

    final bottomSpacing = height < 650
        ? 22.0
        : isTablet
            ? 45.0
            : 35.0;

    const background = Color(0xFF070A12);
    const surface = Color(0xFF0D1422);
    const primary = Color(0xFF7B61FF);
    const secondary = Color(0xFF00D1FF);
    const accent = Color(0xFFFF4D9D);

    return Scaffold(
      backgroundColor: background,
      body: AnimatedOpacity(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOut,
        opacity: _isExiting ? 0 : 1,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    background,
                    surface,
                    background,
                  ],
                ),
              ),
            ),
            Positioned(
              top: -150,
              left: width * 0.5 - 150,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: primary.withValues(alpha: 0.045),
                ),
              ),
            ),
            Positioned(
              right: -120,
              bottom: -100,
              child: Container(
                width: 260,
                height: 260,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: secondary.withValues(alpha: 0.025),
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                ),
                child: Column(
                  children: [
                    SizedBox(height: topSpacing),
                    Expanded(
                      child: Center(
                        child: SlideTransition(
                          position: _contentSlide,
                          child: FadeTransition(
                            opacity: _contentOpacity,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: logoSize + 24,
                                  height: logoSize + 24,
                                  padding: const EdgeInsets.all(11),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      isSmallPhone ? 28 : 34,
                                    ),
                                    color: Colors.white.withValues(
                                      alpha: 0.025,
                                    ),
                                    border: Border.all(
                                      color: Colors.white.withValues(
                                        alpha: 0.08,
                                      ),
                                      width: 1,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: primary.withValues(
                                          alpha: 0.10,
                                        ),
                                        blurRadius: 30,
                                        spreadRadius: 1,
                                      ),
                                    ],
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        isSmallPhone ? 22 : 28,
                                      ),
                                      color: const Color(0xFF0A0E17),
                                      border: Border.all(
                                        color: Colors.white.withValues(
                                          alpha: 0.05,
                                        ),
                                      ),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                        isSmallPhone ? 22 : 28,
                                      ),
                                      child: Image.asset(
                                        'assets/app_logo.png',
                                        width: logoSize,
                                        height: logoSize,
                                        fit: BoxFit.contain,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return Center(
                                            child: Text(
                                              'J',
                                              style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontSize: logoSize * 0.45,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: isSmallPhone ? 24 : 30,
                                ),
                                ShaderMask(
                                  shaderCallback: (bounds) {
                                    return const LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        primary,
                                        secondary,
                                        accent,
                                      ],
                                    ).createShader(bounds);
                                  },
                                  child: Text(
                                    'Jawali Now',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                      fontSize: titleSize,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                      letterSpacing: -1,
                                      height: 1,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: isSmallPhone ? 10 : 12,
                                ),
                                Text(
                                  'Discover Jawali',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    fontSize: taglineSize,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white.withValues(
                                      alpha: 0.75,
                                    ),
                                    letterSpacing: 0.3,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                ConstrainedBox(
                                  constraints: BoxConstraints(
                                    maxWidth: isPhone ? 340 : 460,
                                  ),
                                  child: Text(
                                    'Explore places, businesses and experiences around you.',
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                      fontSize: descriptionSize,
                                      height: 1.5,
                                      color: Colors.white.withValues(
                                        alpha: 0.42,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    FadeTransition(
                      opacity: _contentOpacity,
                      child: Column(
                        children: [
                          AnimatedBuilder(
                            animation: _loaderController,
                            builder: (context, child) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.center,
                                children: List.generate(
                                  3,
                                  (index) {
                                    final phase =
                                        (_loaderController.value +
                                                index * 0.22) %
                                            1.0;

                                    final pulse =
                                        phase < 0.5
                                            ? phase * 2
                                            : (1 - phase) * 2;

                                    final scale =
                                        0.75 + (pulse * 0.25);

                                    final opacity =
                                        0.35 + (pulse * 0.65);

                                    return Padding(
                                      padding:
                                          const EdgeInsets.symmetric(
                                        horizontal: 4,
                                      ),
                                      child: Opacity(
                                        opacity: opacity,
                                        child: Transform.scale(
                                          scale: scale,
                                          child: Container(
                                            width:
                                                isSmallPhone ? 6 : 7,
                                            height:
                                                isSmallPhone ? 6 : 7,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: index == 1
                                                  ? secondary
                                                  : primary,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: (index == 1
                                                          ? secondary
                                                          : primary)
                                                      .withValues(
                                                    alpha: 0.35,
                                                  ),
                                                  blurRadius: 8,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 14),
                          Container(
                            width: isSmallPhone ? 135 : 165,
                            height: 3,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(999),
                              color: Colors.white.withValues(
                                alpha: 0.06,
                              ),
                            ),
                            child: AnimatedBuilder(
                              animation: _loaderController,
                              builder: (context, child) {
                                final progress =
                                    0.25 +
                                    (_loaderController.value * 0.75);

                                return Align(
                                  alignment: Alignment.centerLeft,
                                  child: FractionallySizedBox(
                                    widthFactor: progress,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(999),
                                        gradient:
                                            const LinearGradient(
                                          colors: [
                                            primary,
                                            secondary,
                                            accent,
                                          ],
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: secondary
                                                .withValues(
                                              alpha: 0.30,
                                            ),
                                            blurRadius: 8,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'Loading Jawali',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontSize: isSmallPhone ? 10 : 11,
                              fontWeight: FontWeight.w400,
                              color: Colors.white.withValues(
                                alpha: 0.38,
                              ),
                              letterSpacing: 0.7,
                            ),
                          ),
                          SizedBox(height: bottomSpacing),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}