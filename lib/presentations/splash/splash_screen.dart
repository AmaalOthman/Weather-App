import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/presentations/home/home_screen.dart';
import 'package:weather/theme/weather_color.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = ' splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: Lottie.asset('assets/animate.json'),
            ),
            Text('Weather App',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                  color: WeatherColor.basicColor,
                  fontFamily: GoogleFonts.roboto().fontFamily,
                )),
          ],
        ),
      ),
    );
  }
}
