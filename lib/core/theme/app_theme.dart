import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const tartOrange = Color(0xFFFE4A49);
  static const skobeloffColor = Color(0xFF297373);
  static const orangeYellowCrayolaColor = Color(0xFFFED766);
  static const snowColor = Color(0xFFFEFEFF);
  static const ghostWhiteColor = Color.fromARGB(255, 248, 249, 252);

  static const robotoRegular16 = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16,
    color: Colors.black,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    height: 1.25,
  );

  static final robotoRegular10 = robotoRegular16.copyWith(
    fontSize: 10,
    letterSpacing: 0.15,
  );
  static final robotoRegular12 = robotoRegular16.copyWith(
    fontSize: 12,
    letterSpacing: 0.15,
  );
  static final robotoRegular14 = robotoRegular16.copyWith(
    fontSize: 14,
    letterSpacing: 0.15,
  );
  static final robotoSemiBolt10 = robotoRegular16.copyWith(
    fontSize: 10,
    letterSpacing: 0.15,
    fontWeight: FontWeight.w600,
  );

  static final robotoBolt16 = robotoRegular16.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.15,
  );

  static final robotoSemiBold14 = robotoRegular16.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.15,
  );
  static final robotoSemiBold12 = robotoRegular16.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.15,
  );

  static ThemeData get() {

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.white),
    );
    final base = ThemeData.light();
    return base.copyWith(
      indicatorColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      hintColor: Colors.white,
      colorScheme: base.colorScheme.copyWith(
        primary: Colors.black,
        secondary: skobeloffColor,
      ),
      textTheme: GoogleFonts.robotoTextTheme(),
      appBarTheme: AppBarTheme(
        color: Colors.black,
        centerTitle: false,
        titleTextStyle: robotoBolt16.copyWith(color: Colors.white),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        labelStyle: robotoRegular16,
        helperStyle: robotoRegular16,
        floatingLabelStyle: robotoRegular16,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: skobeloffColor),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
        ),
        foregroundColor: Colors.black,
        backgroundColor: skobeloffColor,
      ),
      textSelectionTheme: const TextSelectionThemeData(
        selectionHandleColor: skobeloffColor,
        cursorColor: skobeloffColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          primary: skobeloffColor,
          onPrimary: Colors.black,
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 16,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: robotoRegular16.copyWith(
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
