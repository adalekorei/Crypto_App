import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  listTileTheme: ListTileThemeData(iconColor: Colors.white),
  dividerColor: Colors.white24,
  scaffoldBackgroundColor: const Color.fromARGB(124, 15, 15, 15),
  appBarTheme: AppBarTheme(
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.white),
    centerTitle: true,
    backgroundColor: const Color.fromARGB(207, 255, 184, 43),
    titleTextStyle: TextStyle(
      fontSize: 22,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
    labelSmall: TextStyle(
      color: Color.fromARGB(200, 255, 255, 255),
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
  ),
);
