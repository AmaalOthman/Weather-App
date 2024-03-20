import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weather/theme/weather_color.dart';
import 'package:weather/weather_provider/theme_provider.dart';

class HomeSideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 45),
          color: WeatherColor.black,
          child: Text(
            'Weather App',
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            SizedBox(
              width: 4,
            ),
            Icon(
              Icons.settings,
              size: 30,
            ),
            SizedBox(
              width: 6,
            ),
            Text(
              'Settings',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: WeatherColor.black,
                  fontFamily: GoogleFonts.roboto().fontFamily),
            ),
          ],
        ),
        SizedBox(
          height: 6,
        ),
        InkWell(
          onTap: () {
            themeProvider.changeTheme(ThemeMode.dark);
          },
          child: Row(
            children: [
              SizedBox(
                width: 4,
              ),
              Icon(
                Icons.dark_mode,
                size: 30,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                'Dark',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: WeatherColor.black,
                    fontFamily: GoogleFonts.roboto().fontFamily),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
