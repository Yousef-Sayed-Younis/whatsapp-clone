import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData getTheme() {
    return ThemeData(
      // scaffoldBackgroundColor: Color(0xfff4f4f4),
      // //
      // appBarTheme: AppBarTheme(
      //   centerTitle: true,
      //   backgroundColor: Color(0xfff4f4f4),
      //   iconTheme: IconThemeData(color: Colors.black, size: 20),
      // ),

      // dividerTheme: DividerThemeData(color: Color(0xffefefef)),
      // //
      // cardTheme: CardTheme(color: Colors.white),
      // //
      // inputDecorationTheme: InputDecorationTheme(
      //   hintStyle: const TextStyle(color: Colors.grey),
      //   floatingLabelBehavior: FloatingLabelBehavior.always,
      //   errorBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
      //   enabledBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
      //   focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: ConstantColor.buttonsColor, width: 2)),
      // ),

      fontFamily: "Inter",

      textTheme: TextTheme(
        titleMedium: TextStyle(fontSize: 16, height: 20 / 16, fontWeight: FontWeight.w600), // Contact's Name
        titleSmall: TextStyle(fontSize: 14, height: 20 / 14, fontWeight: FontWeight.w600), // Contact's Name in Replied Message
        bodyMedium: TextStyle(fontSize: 16, height: 22 / 16, fontWeight: FontWeight.w400), // Sender & Receiver Messages
        bodySmall: TextStyle(fontSize: 12, height: 18 / 12, fontWeight: FontWeight.w400), // Replied Message
        labelSmall: TextStyle(height: 1, fontSize: 12, letterSpacing: 0.24, fontWeight: FontWeight.w400), // Timestamp
      ),
    );
  }
}
