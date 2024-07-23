import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppText {
  static Widget headingText({
    required String text,
    double size = 18,
    Color color = Colors.black,
  }) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        color: color,
        fontSize: size,
      ),
    );
  }
}
