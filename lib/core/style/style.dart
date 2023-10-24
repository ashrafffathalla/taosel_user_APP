import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme() {
  return ThemeData(
    backgroundColor: const Color(0xFFF6F5F8),
    scaffoldBackgroundColor: const Color(0xFFF0EFEF),
    colorScheme: const ColorScheme(
      primary: Color(0xfffbc112),
      primaryContainer: Colors.white,
      secondary: Color(0xFF6f5da8),
      secondaryContainer: Color(0xFF6f5da8),
      surface: Color(0xffFFFFFF),
      background: Color(0xffFFFFFF),
      error: Color(0xffB00020),
      onPrimary: Color(0xff1e1e29),
      onSecondary: Color(0xFFF6F5F8),
      onSurface: Color(0xff000000),
      onBackground: Color(0xff000000),
      onError: Color(0xffB00020),
      brightness: Brightness.light,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0.0,
      // toolbarHeight: 35,
      backgroundColor: const Color(0xFFF0EFEF),
      titleTextStyle: GoogleFonts.elMessiri(
        color: const Color(0xff1B1C1C),
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
        letterSpacing: 0.15,
      ),
      iconTheme: const IconThemeData(color: Color((0xfffbc112))),
    ),
    toggleableActiveColor: const Color(0xfffbc112).withOpacity(0.8),
    // radioTheme: RadioThemeData(),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 0.0,
      backgroundColor: Color(0xffFFFFFF),
      enableFeedback: true,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedLabelStyle: TextStyle(fontSize: 12.0),
      selectedIconTheme: IconThemeData(color: Color(0xff6e9ed3),),
    ),

    timePickerTheme: TimePickerThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      dialBackgroundColor: const Color(0xFF6f5da8).withOpacity(0.9),
      dialHandColor: const Color(0xfffbc112),
      dialTextColor: Colors.white,
      hourMinuteColor: const Color(0xfffbc112).withOpacity(0.05),
      hourMinuteShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      hourMinuteTextColor: const Color(0xfffbc112),
    ),
    dialogTheme: const DialogTheme(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),),),

    textTheme: TextTheme(
      button: GoogleFonts.elMessiri(
        color: const Color(0xff1b1c1c),
      ),
      overline: GoogleFonts.elMessiri(
        color: const Color(0xff1b1c1c),
      ),
      bodyText1: GoogleFonts.elMessiri(
          color: const Color(0xff1b1c1c), fontWeight: FontWeight.bold),
      bodyText2: GoogleFonts.elMessiri(
        color: Colors.grey[700],
      ),
      headline1: GoogleFonts.elMessiri(
        color: const Color(0xff1b1c1c),
      ),
      headline2: GoogleFonts.elMessiri(
        color: const Color(0xff1b1c1c),
      ),
      headline3: GoogleFonts.elMessiri(
        color: const Color(0xff1b1c1c),
      ),
      headline4: GoogleFonts.elMessiri(
        color: const Color(0xff1b1c1c),
      ),
      headline5: GoogleFonts.elMessiri(
        color: const Color(0xff1b1c1c),
      ),
      headline6: GoogleFonts.elMessiri(
        color: const Color(0xff1b1c1c),
        fontWeight: FontWeight.bold,
      ),
      subtitle1: GoogleFonts.elMessiri(
        color: const Color(0xff1b1c1c),
      ),
    ),
    iconTheme: const IconThemeData(color: Color(0xFF071D34)),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: const Color(0xfffbc112),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        textStyle: GoogleFonts.elMessiri(
            color: const Color(0xff1b1c1c), fontWeight: FontWeight.bold),
        padding: const EdgeInsets.all(10.0),
        primary: const Color(0xfffbc112).withOpacity(0.8),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        textStyle: GoogleFonts.elMessiri(
            color: const Color(0xff1b1c1c), fontWeight: FontWeight.bold),
        padding: const EdgeInsets.all(0.0),
        primary: const Color(0xfffbc112).withOpacity(0.8),
      ),
    ),
  );
}
