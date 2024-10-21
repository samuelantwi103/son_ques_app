import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff8a3600),
      surfaceTint: Color(0xffa14000),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffc55000),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff8d4d2d),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffffb593),
      onSecondaryContainer: Color(0xff5b2609),
      tertiary: Color(0xff676000),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffb8ae3a),
      onTertiaryContainer: Color(0xff242100),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      background: Color(0xfffff8f6),
      onBackground: Color(0xff251913),
      surface: Color(0xfffff8f6),
      onSurface: Color(0xff251913),
      surfaceVariant: Color(0xfffddccd),
      onSurfaceVariant: Color(0xff584238),
      outline: Color(0xff8c7166),
      outlineVariant: Color(0xffe0c0b2),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff3b2d27),
      inverseOnSurface: Color(0xffffede6),
      inversePrimary: Color(0xffffb694),
      primaryFixed: Color(0xffffdbcc),
      onPrimaryFixed: Color(0xff351000),
      primaryFixedDim: Color(0xffffb694),
      onPrimaryFixedVariant: Color(0xff7b2f00),
      secondaryFixed: Color(0xffffdbcc),
      onSecondaryFixed: Color(0xff351000),
      secondaryFixedDim: Color(0xffffb694),
      onSecondaryFixedVariant: Color(0xff703718),
      tertiaryFixed: Color(0xfff1e66c),
      onTertiaryFixed: Color(0xff1f1c00),
      tertiaryFixedDim: Color(0xffd4ca53),
      onTertiaryFixedVariant: Color(0xff4d4800),
      surfaceDim: Color(0xffedd5cc),
      surfaceBright: Color(0xfffff8f6),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff1eb),
      surfaceContainer: Color(0xffffeae1),
      surfaceContainerHigh: Color(0xfffbe3da),
      surfaceContainerHighest: Color(0xfff5ded4),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme lightMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff742c00),
      surfaceTint: Color(0xffa14000),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffc55000),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff6b3315),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffa86341),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff494400),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff7f7700),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      background: Color(0xfffff8f6),
      onBackground: Color(0xff251913),
      surface: Color(0xfffff8f6),
      onSurface: Color(0xff251913),
      surfaceVariant: Color(0xfffddccd),
      onSurfaceVariant: Color(0xff543e34),
      outline: Color(0xff725a4f),
      outlineVariant: Color(0xff907569),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff3b2d27),
      inverseOnSurface: Color(0xffffede6),
      inversePrimary: Color(0xffffb694),
      primaryFixed: Color(0xffc55000),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff9d3f00),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xffa86341),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff8a4b2b),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff7f7700),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff645e00),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffedd5cc),
      surfaceBright: Color(0xfffff8f6),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff1eb),
      surfaceContainer: Color(0xffffeae1),
      surfaceContainerHigh: Color(0xfffbe3da),
      surfaceContainerHighest: Color(0xfff5ded4),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme lightHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff401500),
      surfaceTint: Color(0xffa14000),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff742c00),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff401500),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff6b3315),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff262300),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff494400),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      background: Color(0xfffff8f6),
      onBackground: Color(0xff251913),
      surface: Color(0xfffff8f6),
      onSurface: Color(0xff000000),
      surfaceVariant: Color(0xfffddccd),
      onSurfaceVariant: Color(0xff322017),
      outline: Color(0xff543e34),
      outlineVariant: Color(0xff543e34),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff3b2d27),
      inverseOnSurface: Color(0xffffffff),
      inversePrimary: Color(0xffffe7de),
      primaryFixed: Color(0xff742c00),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff511c00),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff6b3315),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff4f1e02),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff494400),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff312e00),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffedd5cc),
      surfaceBright: Color(0xfffff8f6),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff1eb),
      surfaceContainer: Color(0xffffeae1),
      surfaceContainerHigh: Color(0xfffbe3da),
      surfaceContainerHighest: Color(0xfff5ded4),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffb694),
      surfaceTint: Color(0xffffb694),
      onPrimary: Color(0xff561f00),
      primaryContainer: Color(0xffc14f00),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xffffb694),
      onSecondary: Color(0xff542104),
      secondaryContainer: Color(0xff683012),
      onSecondaryContainer: Color(0xffffc9b2),
      tertiary: Color(0xffe3d85f),
      onTertiary: Color(0xff353100),
      tertiaryContainer: Color(0xffb8ae3a),
      onTertiaryContainer: Color(0xff242100),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      background: Color(0xff1c110b),
      onBackground: Color(0xfff5ded4),
      surface: Color(0xff1c110b),
      onSurface: Color(0xfff5ded4),
      surfaceVariant: Color(0xff584238),
      onSurfaceVariant: Color(0xffe0c0b2),
      outline: Color(0xffa78b7e),
      outlineVariant: Color(0xff584238),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff5ded4),
      inverseOnSurface: Color(0xff3b2d27),
      inversePrimary: Color(0xffa14000),
      primaryFixed: Color(0xffffdbcc),
      onPrimaryFixed: Color(0xff351000),
      primaryFixedDim: Color(0xffffb694),
      onPrimaryFixedVariant: Color(0xff7b2f00),
      secondaryFixed: Color(0xffffdbcc),
      onSecondaryFixed: Color(0xff351000),
      secondaryFixedDim: Color(0xffffb694),
      onSecondaryFixedVariant: Color(0xff703718),
      tertiaryFixed: Color(0xfff1e66c),
      onTertiaryFixed: Color(0xff1f1c00),
      tertiaryFixedDim: Color(0xffd4ca53),
      onTertiaryFixedVariant: Color(0xff4d4800),
      surfaceDim: Color(0xff1c110b),
      surfaceBright: Color(0xff453630),
      surfaceContainerLowest: Color(0xff160c07),
      surfaceContainerLow: Color(0xff251913),
      surfaceContainer: Color(0xff291d17),
      surfaceContainerHigh: Color(0xff352721),
      surfaceContainerHighest: Color(0xff40322b),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  static MaterialScheme darkMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffbb9d),
      surfaceTint: Color(0xffffb694),
      onPrimary: Color(0xff2c0c00),
      primaryContainer: Color(0xffec6a1d),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffffbb9d),
      onSecondary: Color(0xff2c0c00),
      secondaryContainer: Color(0xffc97e5a),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffe3d85f),
      onTertiary: Color(0xff232000),
      tertiaryContainer: Color(0xffb8ae3a),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      background: Color(0xff1c110b),
      onBackground: Color(0xfff5ded4),
      surface: Color(0xff1c110b),
      onSurface: Color(0xfffff9f8),
      surfaceVariant: Color(0xff584238),
      onSurfaceVariant: Color(0xffe4c4b6),
      outline: Color(0xffba9d90),
      outlineVariant: Color(0xff997d71),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff5ded4),
      inverseOnSurface: Color(0xff352721),
      inversePrimary: Color(0xff7c3000),
      primaryFixed: Color(0xffffdbcc),
      onPrimaryFixed: Color(0xff240900),
      primaryFixedDim: Color(0xffffb694),
      onPrimaryFixedVariant: Color(0xff602300),
      secondaryFixed: Color(0xffffdbcc),
      onSecondaryFixed: Color(0xff240900),
      secondaryFixedDim: Color(0xffffb694),
      onSecondaryFixedVariant: Color(0xff5b2709),
      tertiaryFixed: Color(0xfff1e66c),
      onTertiaryFixed: Color(0xff141200),
      tertiaryFixedDim: Color(0xffd4ca53),
      onTertiaryFixedVariant: Color(0xff3c3700),
      surfaceDim: Color(0xff1c110b),
      surfaceBright: Color(0xff453630),
      surfaceContainerLowest: Color(0xff160c07),
      surfaceContainerLow: Color(0xff251913),
      surfaceContainer: Color(0xff291d17),
      surfaceContainerHigh: Color(0xff352721),
      surfaceContainerHighest: Color(0xff40322b),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme darkHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffff9f8),
      surfaceTint: Color(0xffffb694),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffffbb9d),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffff9f8),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffffbb9d),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfffffaf1),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffd9ce57),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      background: Color(0xff1c110b),
      onBackground: Color(0xfff5ded4),
      surface: Color(0xff1c110b),
      onSurface: Color(0xffffffff),
      surfaceVariant: Color(0xff584238),
      onSurfaceVariant: Color(0xfffff9f8),
      outline: Color(0xffe4c4b6),
      outlineVariant: Color(0xffe4c4b6),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff5ded4),
      inverseOnSurface: Color(0xff000000),
      inversePrimary: Color(0xff4c1b00),
      primaryFixed: Color(0xffffe1d4),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffffbb9d),
      onPrimaryFixedVariant: Color(0xff2c0c00),
      secondaryFixed: Color(0xffffe1d4),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffffbb9d),
      onSecondaryFixedVariant: Color(0xff2c0c00),
      tertiaryFixed: Color(0xfff6ea6f),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffd9ce57),
      onTertiaryFixedVariant: Color(0xff191700),
      surfaceDim: Color(0xff1c110b),
      surfaceBright: Color(0xff453630),
      surfaceContainerLowest: Color(0xff160c07),
      surfaceContainerLow: Color(0xff251913),
      surfaceContainer: Color(0xff291d17),
      surfaceContainerHigh: Color(0xff352721),
      surfaceContainerHighest: Color(0xff40322b),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme().toColorScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.surface,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class MaterialScheme {
  const MaterialScheme({
    required this.brightness,
    required this.primary, 
    required this.surfaceTint, 
    required this.onPrimary, 
    required this.primaryContainer, 
    required this.onPrimaryContainer, 
    required this.secondary, 
    required this.onSecondary, 
    required this.secondaryContainer, 
    required this.onSecondaryContainer, 
    required this.tertiary, 
    required this.onTertiary, 
    required this.tertiaryContainer, 
    required this.onTertiaryContainer, 
    required this.error, 
    required this.onError, 
    required this.errorContainer, 
    required this.onErrorContainer, 
    required this.background, 
    required this.onBackground, 
    required this.surface, 
    required this.onSurface, 
    required this.surfaceVariant, 
    required this.onSurfaceVariant, 
    required this.outline, 
    required this.outlineVariant, 
    required this.shadow, 
    required this.scrim, 
    required this.inverseSurface, 
    required this.inverseOnSurface, 
    required this.inversePrimary, 
    required this.primaryFixed, 
    required this.onPrimaryFixed, 
    required this.primaryFixedDim, 
    required this.onPrimaryFixedVariant, 
    required this.secondaryFixed, 
    required this.onSecondaryFixed, 
    required this.secondaryFixedDim, 
    required this.onSecondaryFixedVariant, 
    required this.tertiaryFixed, 
    required this.onTertiaryFixed, 
    required this.tertiaryFixedDim, 
    required this.onTertiaryFixedVariant, 
    required this.surfaceDim, 
    required this.surfaceBright, 
    required this.surfaceContainerLowest, 
    required this.surfaceContainerLow, 
    required this.surfaceContainer, 
    required this.surfaceContainerHigh, 
    required this.surfaceContainerHighest, 
  });

  final Brightness brightness;
  final Color primary;
  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
}

extension MaterialSchemeUtils on MaterialScheme {
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      surface: surface,
      onSurface: onSurface,
      surfaceContainerHighest: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
    );
  }
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
