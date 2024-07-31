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
      style: GoogleFonts.outfit(
        color: color,
        fontSize: size,
      ),
    );
  }

  static Widget buttonText({
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
  static Widget newsHeadingText({
    required String text,
    double size = 24,
    Color color = Colors.black,
  }) {
    return Text(
      text,
      style: GoogleFonts.montserrat(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
    );
  }
  static Widget newsDescriptionText({
    required String text,
    double size = 16,
    Color color = Colors.black87,
  }) {
    return Text(
      text,
      style: GoogleFonts.roboto(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
    );
  }
  static Widget newsTimeText({
    required String text,
    double size = 12,
    Color color = Colors.black54,
  }) {
    return Text(
      text,
      style: GoogleFonts.raleway(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
    );
  }
  static Widget newsAuthorText({
    required String text,
    double size = 14,
    Color color = Colors.black87,
  }) {
    return Text(
      text,
      style: GoogleFonts.robotoCondensed(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
