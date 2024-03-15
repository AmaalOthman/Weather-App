import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/presentations/home/home_side_menue.dart';
import 'package:weather/theme/weather_color.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Weather App',
          textAlign: TextAlign.center,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ImageIcon(AssetImage('assets/images/add.png')),
          ),
        ],
      ),
      drawer: Drawer(
        child: HomeSideMenu(),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '6 October',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              Text(
                'Today',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              Text('2 C',
                  style: TextStyle(
                    fontSize: 100,
                    fontWeight: FontWeight.normal,
                    color: WeatherColor.mainColor,
                    fontFamily: GoogleFonts.roboto().fontFamily,
                  )),
              Divider(
                color: WeatherColor.grey,
                indent: 90,
                endIndent: 90,
              ),
              Text(
                'Sunny',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('-5 c',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: WeatherColor.basicColor,
                        fontFamily: GoogleFonts.roboto().fontFamily,
                      )),
                  Text('/',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: WeatherColor.grey,
                        fontFamily: GoogleFonts.roboto().fontFamily,
                      )),
                  Text('2 c',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: WeatherColor.mainColor,
                        fontFamily: GoogleFonts.roboto().fontFamily,
                      )),
                ],
              ),
              Card(
                margin: EdgeInsets.all(18),
                shadowColor: WeatherColor.grey,
                color: Colors.white,
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: [
                      Text(
                        'Forecast for today',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      Text(
                        'Forecast for today',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      Text(
                        'Forecast for today',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      Text(
                        'Forecast for today',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      Text(
                        'Forecast for today',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(8),
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '7-day forecast',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    Divider(
                      color: WeatherColor.grey,
                      indent: 10,
                      endIndent: 10,
                    ),
                    Text('Today',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: WeatherColor.black,
                            fontFamily: GoogleFonts.roboto().fontFamily)),
                    Divider(
                      color: WeatherColor.grey,
                      indent: 10,
                      endIndent: 10,
                    ),
                    Text('Wed',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: WeatherColor.black,
                            fontFamily: GoogleFonts.roboto().fontFamily)),
                    Divider(
                      color: WeatherColor.grey,
                      indent: 10,
                      endIndent: 10,
                    ),
                    Text('Thu',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: WeatherColor.black,
                            fontFamily: GoogleFonts.roboto().fontFamily)),
                    Divider(
                      color: WeatherColor.grey,
                      indent: 10,
                      endIndent: 10,
                    ),
                    Text('Fri',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: WeatherColor.black,
                            fontFamily: GoogleFonts.roboto().fontFamily)),
                    Divider(
                      color: WeatherColor.grey,
                      indent: 10,
                      endIndent: 10,
                    ),
                    Text('San',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: WeatherColor.black,
                            fontFamily: GoogleFonts.roboto().fontFamily)),
                    Divider(
                      color: WeatherColor.grey,
                      indent: 10,
                      endIndent: 10,
                    ),
                    Text('Sun',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: WeatherColor.black,
                            fontFamily: GoogleFonts.roboto().fontFamily)),
                    Divider(
                      color: WeatherColor.grey,
                      indent: 10,
                      endIndent: 10,
                    ),
                    Text('Mon',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: WeatherColor.black,
                            fontFamily: GoogleFonts.roboto().fontFamily)),
                    Divider(
                      color: WeatherColor.grey,
                      indent: 10,
                      endIndent: 10,
                    ),
                    Text('Teus',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: WeatherColor.black,
                            fontFamily: GoogleFonts.roboto().fontFamily)),
                    Divider(
                      color: WeatherColor.grey,
                      indent: 10,
                      endIndent: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
