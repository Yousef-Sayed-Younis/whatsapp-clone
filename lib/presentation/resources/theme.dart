import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  AppTheme._();
  //
  static ThemeData getTheme() {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.darkBg,

      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.darkBg,
      ),

      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          padding: WidgetStatePropertyAll(EdgeInsets.zero),
          fixedSize: WidgetStatePropertyAll(Size.square(28)),
          minimumSize: WidgetStatePropertyAll(Size.square(28)),
        ),
      ),

      // dividerTheme: DividerThemeData(color: Color(0xffefefef)),
      // //
      // cardTheme: CardTheme(color: Colors.white),
      // //
      // inputDecorationTheme: InputDecorationTheme(
      //   hintStyle: const TextStyle(color: Colors.grey),
      //   floatingLabelBehavior: FloatingLabelBehavior.always,
      //   errorBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
      //   enabledBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
      //   focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: AppColors.buttonsColor, width: 2)),
      // ),

      fontFamily: "Inter",

      textTheme: TextTheme(
        titleMedium: TextStyle(fontSize: 16, height: 20 / 16, fontWeight: FontWeight.w600), // Contact's Name
        titleSmall: TextStyle(fontSize: 14, height: 20 / 14, fontWeight: FontWeight.w600), // Contact's Name in Replied Message
        bodyMedium: TextStyle(fontSize: 16, height: 22 / 16, fontWeight: FontWeight.w400), // Sender & Receiver Messages
        bodySmall: TextStyle(fontSize: 12, height: 18 / 12, fontWeight: FontWeight.w400), // Replied Message
        labelSmall: TextStyle(height: 1, fontSize: 12, letterSpacing: 0.24, fontWeight: FontWeight.w400), // Timestamp
      ),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.navBarBg,
        unselectedItemColor: AppColors.navBarItem,
        selectedItemColor: AppColors.navBarActiveItem,
        unselectedLabelStyle: TextStyle(fontSize: 10, letterSpacing: .05, fontWeight: FontWeight.w500, color: AppColors.navBarItem),
        selectedLabelStyle: TextStyle(fontSize: 10, letterSpacing: .05, fontWeight: FontWeight.w500, color: AppColors.navBarActiveItem),
      ),
    );
  }
}
