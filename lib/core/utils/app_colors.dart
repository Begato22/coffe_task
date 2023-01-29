import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AppColors {
  static Color primaryColor = HexColor('#815142');
  static Color secondryColor = const Color(0xFF2E3F68);



  static const secondaryContainerLight = Color.fromARGB(255, 63, 85, 134);
  static const MaterialColor primarySwatch = MaterialColor(
    0xFF815142,
    <int, Color>{
      50: Color(0xFFfff3de),
      100: Color(0xFFFFA38C),
      200: Color(0xFFF79D87),
      300: Color(0xFFEC9681),
      400: Color(0xFFDD8C78),
      500: Color(0xFFCE8370),
      600: Color(0xFFBD7766),
      700: Color(0xFFA76A5A),
      800: Color(0xFF915C4D),
      900: Color(0xFF815142),
    },
  );

  static Color lightPrimaryColor = AppColors.primarySwatch.withOpacity(0.07);

  static ColorScheme colorSchemeLight = ColorScheme.light(
    primary: primarySwatch,
    primaryContainer: primarySwatch.shade300,
    secondary: const Color(0xFF2D376F),
    secondaryContainer: const Color(0xFF006CFA),
  );

  static ColorScheme colorSchemeDark = ColorScheme.dark(
    primary: primarySwatch,
    primaryContainer: primarySwatch.shade300,
    secondary: const Color(0xFF2D376F),
    secondaryContainer: const Color(0xFF006CFA),
  );
}
