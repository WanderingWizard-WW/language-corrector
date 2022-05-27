import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const accent = Color(0xFFFFC700);
  static const lightRed = Color(0xFFFFDDDD);
  static const red = Color(0xFFDB0000);
  static const blue = Color(0xFF2E5CFF);
  static const lightGreen = Color(0xFFEEFFEE);
  static const green = Color(0xFF26BF00);
  static const orange = Color(0xFFFF9900);
  static const lightGrey = Color(0xFFDBE0EB);
  static const grey = Color(0xFF8F929B);

  static const soraRegular16 = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    height: 1.25,
  );

  static final soraRegular12 = soraRegular16.copyWith(
    fontSize: 12,
    letterSpacing: 0.15,
  );

  static final soraMedium20 = soraRegular16.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
  );

  static final soraSemiBold14 = soraRegular16.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.15,
  );

  static ThemeData get() {
    final base = ThemeData.light();
    return base.copyWith(
      indicatorColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      hintColor: Colors.white,
      colorScheme: base.colorScheme.copyWith(
        primary: Colors.black,
        secondary: accent,
      ),
      textTheme: GoogleFonts.robotoTextTheme(
        TextTheme(
          headline1: soraMedium20.copyWith(
            color: Colors.black,
          ),
          caption: soraRegular12.copyWith(
            color: Colors.black,
          ),
          bodyText1: soraRegular16.copyWith(
            color: Colors.black,
          ),
          button: soraSemiBold14.copyWith(
            color: Colors.black,
          ),
        ),
      ),
      appBarTheme: AppBarTheme(
        color: Colors.black,
        centerTitle: false,
        titleTextStyle: soraMedium20.copyWith(color: Colors.white),
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: soraRegular16,
        helperStyle: soraRegular16,
        floatingLabelStyle: soraRegular16,
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: accent),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: lightGrey),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: red),
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: lightGrey),
        ),
        errorStyle: soraRegular12.copyWith(color: red),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
        ),
        foregroundColor: Colors.black,
        backgroundColor: accent,
      ),
      textSelectionTheme: const TextSelectionThemeData(
        selectionHandleColor: accent,
        cursorColor: accent,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          primary: accent,
          onPrimary: Colors.black,
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 24,
          ),
          textStyle: soraSemiBold14,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: soraRegular16.copyWith(
            fontWeight: FontWeight.w500,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
        ),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
      ),
    );
  }
}
