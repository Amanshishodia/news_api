import 'package:flutter/material.dart';
import 'package:newsapp/config/colors.dart';

var lightTheme = ThemeData(
    useMaterial3: true,
    inputDecorationTheme: const InputDecorationTheme(
        fillColor: lightBgColor,
        filled: true,
        enabledBorder: InputBorder.none,
        prefixIconColor: lightLabelColor,
        labelStyle: TextStyle(
            fontFamily: "Popins",
            fontSize: 15,
            color: lightFontColor,
            fontWeight: FontWeight.w500),
        hintStyle: TextStyle(
            fontFamily: "Popins",
            fontSize: 15,
            color: lightFontColor,
            fontWeight: FontWeight.w500)),
    colorScheme: const ColorScheme.light(
        brightness: Brightness.light,
        background: lightBgColor,
        onBackground: lightFontColor,
        primaryContainer: lightDivColor,
        onPrimaryContainer: lightFontColor,
        secondaryContainer: lightLabelColor,
        primary: lightPrimaryColor),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontFamily: "Poppins",
        fontSize: 24,
        color: lightFontColor,
        fontWeight: FontWeight.w700,
      ),
      headlineMedium: TextStyle(
        fontFamily: "Poppins",
        fontSize: 20,
        color: lightFontColor,
        fontWeight: FontWeight.w600,
      ),
      headlineSmall: TextStyle(
        fontFamily: "Poppins",
        fontSize: 15,
        color: lightFontColor,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(
        fontFamily: "Poppins",
        fontSize: 16,
        color: lightFontColor,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        fontFamily: "Poppins",
        fontSize: 16,
        color: lightFontColor,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        fontFamily: "Poppins",
        fontSize: 13,
        color: lightFontColor,
        fontWeight: FontWeight.w500,
      ),
      labelSmall: TextStyle(
        fontFamily: "Poppins",
        fontSize: 13,
        color: lightFontColor,
        fontWeight: FontWeight.w300,
      ),
    ));
var darkTheme = ThemeData(
    useMaterial3: true,
    inputDecorationTheme: const InputDecorationTheme(
        fillColor: darkBgColor,
        filled: true,
        enabledBorder: InputBorder.none,
        prefixIconColor: lightLabelColor,
        labelStyle: TextStyle(
            fontFamily: "Popins",
            fontSize: 15,
            color: darkFontColor,
            fontWeight: FontWeight.w500),
        hintStyle: TextStyle(
            fontFamily: "Popins",
            fontSize: 15,
            color: darkFontColor,
            fontWeight: FontWeight.w500)),
    colorScheme: const ColorScheme.dark( // Changed to ColorScheme.dark()
      brightness: Brightness.dark, // Ensure brightness is dark for a dark theme
      background: darkBgColor,
      onBackground: darkFontColor,
      primaryContainer: darkDivColor,
      onPrimaryContainer: darkFontColor,
      secondaryContainer: darkLabelColor,
      primary: darkPrimaryColor,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontFamily: "Poppins",
        fontSize: 24,
        color: darkFontColor,
        fontWeight: FontWeight.w700,
      ),
      headlineMedium: TextStyle(
          fontFamily: "Poppins",
          fontSize: 20,
          color: darkFontColor,
          fontWeight: FontWeight.w600),
      headlineSmall: TextStyle(
        fontFamily: "Poppins",
        fontSize: 15,
        color: darkFontColor,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(
        fontFamily: "Poppins",
        fontSize: 16,
        color: darkFontColor,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        fontFamily: "Poppins",
        fontSize: 16,
        color: darkFontColor,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        fontFamily: "Poppins",
        fontSize: 13,
        color: darkFontColor,
        fontWeight: FontWeight.w500,
      ),
      labelSmall: TextStyle(
        fontFamily: "Poppins",
        fontSize: 13,
        color: darkFontColor,
        fontWeight: FontWeight.w300,
      ),
    ));
