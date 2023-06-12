import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  useMaterial3: true,
  primarySwatch: Colors.amber,
  scaffoldBackgroundColor: const Color(0xff2d3436),
  dividerColor: const Color(0xffdfe6e9),
  listTileTheme: const ListTileThemeData(iconColor: Color(0xffdfe6e9)),
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Color(0xffdfe6e9)),
    backgroundColor: Color(0xff2d3436),
    titleTextStyle: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: Color(0xffdfe6e9)
    )
  ),
  textTheme: TextTheme(
    headlineMedium: const TextStyle(fontWeight: FontWeight.w600, fontSize: 28, color: Color(0xffdfe6e9)),
    bodyMedium: const TextStyle(fontWeight: FontWeight.w500, fontSize: 24, color: Color(0xffdfe6e9)),
    labelSmall: TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: const Color(0xffdfe6e9).withOpacity(0.6)),
  )
);