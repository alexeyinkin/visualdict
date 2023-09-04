import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'my_theme_extension.dart';

final themeData = ThemeData(
  colorScheme: const ColorScheme.light(
    primary: MyColors.primaryColor,
    secondary: MyColors.primaryColor,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    border: InputBorder.none,
    contentPadding: EdgeInsets.zero,
    fillColor: MyColors.nestingColor,
    filled: true,
    isDense: true,
    labelStyle: TextStyle(
      color: MyColors.minorLabel,
      fontSize: 12,
    ),
  ),
  textTheme: GoogleFonts.firaSansExtraCondensedTextTheme(
    TextTheme(
      // Just text, TextField text
      bodyLarge: TextStyle(
        fontSize: FontSizeEnum.s.size,
      ),
      bodyMedium: TextStyle(
        fontSize: FontSizeEnum.s.size,
      ),
      bodySmall: TextStyle(
        fontSize: FontSizeEnum.s.size,
      ),

      // TODO: Find out what it affects.
      displayLarge: TextStyle(
        fontSize: 40,
      ),
      displayMedium: TextStyle(
        fontSize: 40,
      ),
      displaySmall: TextStyle(
        fontSize: 40,
      ),

      // TODO: Find out what it affects.
      headlineLarge: TextStyle(
        fontSize: 40,
      ),
      headlineMedium: TextStyle(
        fontSize: 40,
      ),
      headlineSmall: TextStyle(
        fontSize: 40,
      ),

      // Buttons
      labelLarge: TextStyle(
        fontSize: FontSizeEnum.s.size,
      ),
      labelMedium: TextStyle(
        fontSize: FontSizeEnum.s.size,
      ),
      labelSmall: TextStyle(
        fontSize: FontSizeEnum.s.size,
      ),

      titleLarge: TextStyle(
        fontSize: FontSizeEnum.s.size,
      ),
      titleMedium: TextStyle(
        fontSize: FontSizeEnum.s.size,
      ),
      titleSmall: TextStyle(
        fontSize: FontSizeEnum.s.size,
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: MyColors.colorBlack,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    unselectedItemColor: MyColors.colorBlack,
    selectedItemColor: MyColors.primaryColor,
  ),
  extensions: <ThemeExtension<dynamic>>[
    MyThemeExtension.myThemeExtension,
  ],
  useMaterial3: true,
);

abstract class MyColors {
  static const activeTagColor = Color(0x40000000);
  static const colorBlack = Color(0xFF000000);
  static const colorWhite = Color(0xFFFFFFFF);
  static const error = Color(0xFFC62828);
  static const minorLabel = Color(0x30000000);
  static const nestingColor = Color(0x10000000);
  static const notificationColor = Color(0xFFFFFFFF);
  static const paleColor = Color(0x40000000);
  static const primaryColor = Color(0xFFDF0000);
}

abstract class AppStyle {
  static const padding = 10.0;
  static const edgeInsets = EdgeInsets.all(padding);
}

class DotSeparator extends StatelessWidget {
  const DotSeparator({
    this.style,
  });

  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text('  •  ', style: style);
  }
}

class MySpacing extends StatelessWidget {
  const MySpacing();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(width: 10, height: 10);
  }
}

class HorizontalBlackLine extends StatelessWidget {
  const HorizontalBlackLine();

  @override
  Widget build(BuildContext context) {
    return Container(height: 1, color: MyColors.colorBlack);
  }
}

class HorizontalLineSeparator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      color: MyColors.paleColor,
    );
  }
}

class MyPadding extends StatelessWidget {
  final Widget child;

  const MyPadding({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppStyle.edgeInsets,
      child: child,
    );
  }
}
