import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/theme/weather_color.dart';

class WeatherTextStyle {
  static TextStyle? boldStyle = TextStyle(
    fontSize: 50,
    fontWeight: FontWeight.bold,
    color: WeatherColor.black,
    fontFamily: GoogleFonts.roboto().fontFamily,
  );
  static TextStyle mediamStyle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.normal,
    color: WeatherColor.grey,
    fontFamily: GoogleFonts.roboto().fontFamily,
  );
  static TextStyle regularStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: WeatherColor.black,
      fontFamily: GoogleFonts.roboto().fontFamily);

  static TextStyle derkbBoldStyle = TextStyle(
    fontSize: 50,
    fontWeight: FontWeight.bold,
    color: WeatherColor.white,
    fontFamily: GoogleFonts.roboto().fontFamily,
  );
  static TextStyle darkMediamStyle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.normal,
    color: WeatherColor.grey,
    fontFamily: GoogleFonts.roboto().fontFamily,
  );
  static TextStyle darkRegularStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: WeatherColor.white,
      fontFamily: GoogleFonts.roboto().fontFamily);
}
