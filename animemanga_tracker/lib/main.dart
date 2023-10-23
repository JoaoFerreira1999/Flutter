import 'package:animemanga_tracker/initial_screen.dart';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 73, 73, 73),
);

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 51, 51, 51),
        //fontFamily: GoogleFonts.roboto().fontFamily,
      ),
      home: const InitialScreen(),
    ),
  );
}
