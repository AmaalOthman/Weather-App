import 'package:flutter/material.dart';
import 'package:weather/theme/weather_color.dart';
import 'package:weather/theme/weather_text_style.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
      primaryColor: WeatherColor.black,
      scaffoldBackgroundColor: WeatherColor.white,
      appBarTheme: AppBarTheme(color: Colors.transparent),
      textTheme: TextTheme(
        displayLarge: WeatherTextStyle.boldStyle,
        displayMedium: WeatherTextStyle.mediamStyle,
        displaySmall: WeatherTextStyle.regularStyle,
      ));

  static final ThemeData darkTheme = ThemeData(
      primaryColor: WeatherColor.white,
      scaffoldBackgroundColor: WeatherColor.black,
      appBarTheme: AppBarTheme(color: Colors.transparent),
      textTheme: TextTheme(
        displayLarge: WeatherTextStyle.derkbBoldStyle,
        displayMedium: WeatherTextStyle.darkMediamStyle,
        displaySmall: WeatherTextStyle.darkRegularStyle,
      ));
}
