import 'package:flutter/material.dart';
import 'colors.dart';

/// Builds [ThemeData]
abstract final class AppTheme {
  // Light theme
  static ThemeData light() {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.seedColor,
      brightness: Brightness.light,
    );
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.lightBackground,

      //App Bar
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.lightSurface,
        foregroundColor: AppColors.lightOnSurface,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: AppColors.lightOnSurface,
          fontSize: 20,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.5,
        ),
      ),
    
    //Cards
    cardTheme: CardThemeData(
      elevation: 0,
      color: AppColors.lightSurface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: AppColors.lightDivider, width: 1),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
    ),

    // Input fields
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.lightSurface,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: AppColors.lightDivider),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: AppColors.lightDivider),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: AppColors.primary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: AppColors.error, width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: AppColors.error, width: 2),
      ),
    ),

    //Buttons
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        minimumSize: const Size.fromHeight(56),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primary,
        textStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),

    // Typography
    textTheme: _buildTextTheme(baseColor: AppColors.lightOnSurface),
    
    // Custom extensions
    // ThemeExtension is how M3 lets you carry custom design tokens
    // alongside standard ones. Retrieve with:
    //   Theme.of(context).extension<LiquidGlassTheme>()!

    extensions: const [
      LiquidGlassTheme.light(),
    ],
  );
}

// Dark theme
static ThemeData dark() {
  final colorScheme = ColorScheme.fromSeed(
    seedColor: AppColors.seedColor,
    brightness: Brightness.dark,
  );

  return ThemeData(
    useMaterial3: true,
    colorScheme: colorScheme,
    scaffoldBackgroundColor: AppColors.darkBackground,

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkSurface,
      foregroundColor: AppColors.darkOnSurface,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: const TextStyle(
        color: AppColors.darkOnSurface,
        fontSize: 20,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.5,
      ),
    ),

    cardTheme: CardThemeData(
      elevation: 0,
      color: AppColors.darkCard,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: AppColors.glassBorder, width: 1),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.darkSurface,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.glassBorder),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.glassBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.primaryVariant, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.error, width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.error, width: 2),
      ),
    ),

    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.primaryVariant,
        foregroundColor: Colors.white,
        minimumSize: const Size.fromHeight(56),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primaryVariant,
        textStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),

    textTheme: _buildTextTheme(baseColor: AppColors.darkOnSurface),

    extensions: const [
      LiquidGlassTheme.dark(),
    ],
  );
}

// Shared helpers
static TextTheme _buildTextTheme({required Color baseColor}) {
  return TextTheme(
    displayLarge: TextStyle(
      fontSize: 57, fontWeight: FontWeight.w700,
      color: baseColor, letterSpacing: -1.5,
    ),
    headlineLarge: TextStyle(
      fontSize: 32, fontWeight: FontWeight.w700,
      color: baseColor, letterSpacing: -0.5,
    ),
    headlineMedium: TextStyle(
      fontSize: 24, fontWeight: FontWeight.w600,
      color: baseColor,
    ),
    titleLarge: TextStyle(
      fontSize: 20, fontWeight: FontWeight.w600,
      color: baseColor,
    ),
    titleMedium: TextStyle(
      fontSize: 16, fontWeight: FontWeight.w600,
      color: baseColor, letterSpacing: 0.15,
    ),
    bodyLarge: TextStyle(
      fontSize: 16, fontWeight: FontWeight.w400,
      color: baseColor, height: 1.6,
    ),
    bodyMedium: TextStyle(
      fontSize: 14, fontWeight: FontWeight.w400,
      color: baseColor, height: 1.5,
    ),
    labelLarge: TextStyle(
      fontSize: 14, fontWeight: FontWeight.w600,
      color: baseColor, letterSpacing: 0.1,
    ),
  );
  }
}

// ThemeExtension: Liquid Glass
@immutable
class LiquidGlassTheme extends ThemeExtension<LiquidGlassTheme> {
  final Color glassColor;
  final Color glassBorderColor;
  final double blurSigma;
  final double borderWidth;
  final BorderRadius borderRadius;

  const LiquidGlassTheme({
    required this.glassColor,
    required this.glassBorderColor,
    required this.blurSigma,
    required this.borderWidth,
    required this.borderRadius,
  });

  // Named constructors
  const LiquidGlassTheme.light()
      : glassColor = AppColors.glassLight,
        glassBorderColor = AppColors.glassBorder,
        blurSigma = 20.0,
        borderWidth = 1.0,
        borderRadius = const BorderRadius.all(Radius.circular(24));

  const LiquidGlassTheme.dark()
      : glassColor = AppColors.glassDark,
        glassBorderColor = AppColors.glassBorder,
        blurSigma = 20.0,
        borderWidth = 1.0,
        borderRadius = const BorderRadius.all(Radius.circular(24));

  @override
  LiquidGlassTheme lerp(ThemeExtension<LiquidGlassTheme>? other, double t) {
    if (other is! LiquidGlassTheme) return this;
    return LiquidGlassTheme(
      glassColor: Color.lerp(glassColor, other.glassColor, t)!,
      glassBorderColor: Color.lerp(glassBorderColor, other.glassBorderColor, t)!,
      blurSigma: lerpDouble(blurSigma, other.blurSigma, t)!,
      borderWidth: lerpDouble(borderWidth, other.borderWidth, t)!,
      borderRadius: BorderRadius.lerp(borderRadius, other.borderRadius, t)!,
    );
  }

  @override
  LiquidGlassTheme copyWith({
    Color? glassColor,
    Color? glassBorderColor,
    double? blurSigma,
    double? borderWidth,
    BorderRadius? borderRadius,
  }) {
    return LiquidGlassTheme(
      glassColor: glassColor ?? this.glassColor,
      glassBorderColor: glassBorderColor ?? this.glassBorderColor,
      blurSigma: blurSigma ?? this.blurSigma,
      borderWidth: borderWidth ?? this.borderWidth,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }
}

double? lerpDouble(double a, double b, double t) => a + (b - a) * t;