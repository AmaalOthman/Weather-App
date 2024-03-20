import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/presentations/home/home_side_menue.dart';
import 'package:weather/theme/weather_color.dart';
import 'package:weather/weather_api/api_manager.dart';
import 'package:weather/weather_api/model/WeatherResponse.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController controller = TextEditingController(text: 'Cairo');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  controller.text = value;
                });
              },
              controller: controller,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          FutureBuilder<WeatherResponse>(
              future: ApiManager.getCurrentWeather(controller.text),
              builder: (buildContext, snapShot) {
                if (snapShot.hasError) {
                  return Text('${snapShot.error.toString()}');
                } else if (snapShot.connectionState ==
                    ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                var data = snapShot.data;
                return Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '${data?.city?.name ?? ""}',
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        Text(
                          'Today',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        SizedBox(
                          height: 560,
                          child: ListView.builder(
                            itemCount: 1,
                            itemBuilder: (context, index) => Column(
                              children: [
                                Text(
                                    '${(data?.list?[0]?.main?.temp?.toDouble())! - 273.57 ?? ""}°C',
                                    style: TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.normal,
                                      color: WeatherColor.mainColor,
                                      fontFamily:
                                          GoogleFonts.roboto().fontFamily,
                                    )),
                                Divider(
                                  color: WeatherColor.grey,
                                  indent: 90,
                                  endIndent: 90,
                                ),
                                Text(
                                  '${data?.list?[0].weather?[0].main ?? ""}',
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                        '${(data?.list?[0].main?.tempMin?.toDouble())! - 273.52 ?? ""}',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal,
                                          color: WeatherColor.basicColor,
                                          fontFamily:
                                              GoogleFonts.roboto().fontFamily,
                                        )),
                                    Text('/',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal,
                                          color: WeatherColor.grey,
                                          fontFamily:
                                              GoogleFonts.roboto().fontFamily,
                                        )),
                                    Text(
                                        '${(data?.list?[0].main?.tempMax?.toDouble())! - 273.57 ?? ""}',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal,
                                          color: WeatherColor.mainColor,
                                          fontFamily:
                                              GoogleFonts.roboto().fontFamily,
                                        )),
                                  ],
                                ),

                                //   Forecast for today
                                Card(
                                  margin: EdgeInsets.all(18),
                                  shadowColor: WeatherColor.grey,
                                  color: Colors.white,
                                  child: Container(
                                    alignment: Alignment.topLeft,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Forecast for today',
                                          style: Theme.of(context)
                                              .textTheme
                                              .displaySmall,
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  'Now',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .displayMedium,
                                                ),
                                                SizedBox(
                                                  width: 8,
                                                ),
                                                Text(
                                                  '1500',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .displayMedium,
                                                ),
                                                SizedBox(
                                                  width: 8,
                                                ),
                                                Text(
                                                  '18:00',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .displayMedium,
                                                ),
                                                SizedBox(
                                                  width: 8,
                                                ),
                                                Text(
                                                  '21:00',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .displayMedium,
                                                ),
                                                SizedBox(
                                                  width: 8,
                                                ),
                                                Text(
                                                  '00:00',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .displayMedium,
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  '${(data?.list?[0].main?.temp?.toDouble())! - 273.57 ?? ""}',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .displaySmall,
                                                ),
                                                SizedBox(
                                                  width: 8,
                                                ),
                                                Text(
                                                  '${(data?.list?[1].main?.temp?.toDouble())! - 273.57 ?? ""}',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .displaySmall,
                                                ),
                                                SizedBox(
                                                  width: 8,
                                                ),
                                                Text(
                                                  '${(data?.list?[2].main?.temp?.toDouble())! - 273.57 ?? ""}',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .displaySmall,
                                                ),
                                                SizedBox(
                                                  width: 8,
                                                ),
                                                Text(
                                                  '${(data?.list?[3].main?.temp?.toDouble())! - 273.57 ?? ""}',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .displaySmall,
                                                ),
                                                SizedBox(
                                                  width: 8,
                                                ),
                                                Text(
                                                  '${(data?.list?[4].main?.temp?.toDouble())! - 273.57 ?? ""}',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .displaySmall,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                //  7-day forecast
                                Container(
                                  margin: EdgeInsets.all(8),
                                  alignment: Alignment.topLeft,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '7-day forecast',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall,
                                      ),
                                      Divider(
                                        color: WeatherColor.grey,
                                        indent: 10,
                                        endIndent: 10,
                                      ),
                                      Row(
                                        children: [
                                          Text('Today',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: WeatherColor.black,
                                                  fontFamily:
                                                      GoogleFonts.roboto()
                                                          .fontFamily)),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                              '${(data?.list?[0].main?.tempMin?.toDouble())! - 273.57 ?? ""}°C',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: WeatherColor.grey,
                                                  fontFamily:
                                                      GoogleFonts.roboto()
                                                          .fontFamily)),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                              '${(data?.list?[0].main?.tempMax?.toDouble())! - 273.57 ?? ""}°C',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: WeatherColor.black,
                                                  fontFamily:
                                                      GoogleFonts.roboto()
                                                          .fontFamily)),
                                        ],
                                      ),
                                      Divider(
                                        color: WeatherColor.grey,
                                        indent: 10,
                                        endIndent: 10,
                                      ),
                                      Row(
                                        children: [
                                          Text('Wed',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: WeatherColor.black,
                                                  fontFamily:
                                                      GoogleFonts.roboto()
                                                          .fontFamily)),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                              '${(data?.list?[1].main?.tempMin?.toDouble())! - 273.57 ?? ""}°C',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: WeatherColor.grey,
                                                  fontFamily:
                                                      GoogleFonts.roboto()
                                                          .fontFamily)),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                              '${(data?.list?[1].main?.tempMax?.toDouble())! - 273.57 ?? ""}°C',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: WeatherColor.black,
                                                  fontFamily:
                                                      GoogleFonts.roboto()
                                                          .fontFamily)),
                                        ],
                                      ),
                                      Divider(
                                        color: WeatherColor.grey,
                                        indent: 10,
                                        endIndent: 10,
                                      ),
                                      Row(
                                        children: [
                                          Text('Thu',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: WeatherColor.black,
                                                  fontFamily:
                                                      GoogleFonts.roboto()
                                                          .fontFamily)),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                              '${(data?.list?[2].main?.tempMin?.toDouble())! - 273.57 ?? ""}°C',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: WeatherColor.grey,
                                                  fontFamily:
                                                      GoogleFonts.roboto()
                                                          .fontFamily)),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                              '${(data?.list?[2].main?.tempMax?.toDouble())! - 273.57 ?? ""}°C',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: WeatherColor.black,
                                                  fontFamily:
                                                      GoogleFonts.roboto()
                                                          .fontFamily)),
                                        ],
                                      ),
                                      Divider(
                                        color: WeatherColor.grey,
                                        indent: 10,
                                        endIndent: 10,
                                      ),
                                      Row(
                                        children: [
                                          Text('Fri',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: WeatherColor.black,
                                                  fontFamily:
                                                      GoogleFonts.roboto()
                                                          .fontFamily)),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                              '${(data?.list?[3].main?.tempMin?.toDouble())! - 273.57 ?? ""}°C',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: WeatherColor.grey,
                                                  fontFamily:
                                                      GoogleFonts.roboto()
                                                          .fontFamily)),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                              '${(data?.list?[3].main?.tempMax?.toDouble())! - 273.57 ?? ""}°C',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: WeatherColor.black,
                                                  fontFamily:
                                                      GoogleFonts.roboto()
                                                          .fontFamily)),
                                        ],
                                      ),
                                      Divider(
                                        color: WeatherColor.grey,
                                        indent: 10,
                                        endIndent: 10,
                                      ),
                                      Row(
                                        children: [
                                          Text('San',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: WeatherColor.black,
                                                  fontFamily:
                                                      GoogleFonts.roboto()
                                                          .fontFamily)),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                              '${(data?.list?[4].main?.tempMin?.toDouble())! - 273.57 ?? ""}°C',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: WeatherColor.grey,
                                                  fontFamily:
                                                      GoogleFonts.roboto()
                                                          .fontFamily)),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                              '${(data?.list?[4].main?.tempMax?.toDouble())! - 273.57 ?? ""}°C',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: WeatherColor.black,
                                                  fontFamily:
                                                      GoogleFonts.roboto()
                                                          .fontFamily)),
                                        ],
                                      ),
                                      Divider(
                                        color: WeatherColor.grey,
                                        indent: 10,
                                        endIndent: 10,
                                      ),
                                      Row(
                                        children: [
                                          Text('Sun',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: WeatherColor.black,
                                                  fontFamily:
                                                      GoogleFonts.roboto()
                                                          .fontFamily)),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                              '${(data?.list?[5].main?.tempMin?.toDouble())! - 273.57 ?? ""}°C',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: WeatherColor.grey,
                                                  fontFamily:
                                                      GoogleFonts.roboto()
                                                          .fontFamily)),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                              '${(data?.list?[5].main?.tempMax?.toDouble())! - 273.57 ?? ""}°C',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: WeatherColor.black,
                                                  fontFamily:
                                                      GoogleFonts.roboto()
                                                          .fontFamily)),
                                        ],
                                      ),
                                      Divider(
                                        color: WeatherColor.grey,
                                        indent: 10,
                                        endIndent: 10,
                                      ),
                                      Row(
                                        children: [
                                          Text('Mon',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: WeatherColor.black,
                                                  fontFamily:
                                                      GoogleFonts.roboto()
                                                          .fontFamily)),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                              '${(data?.list?[6].main?.tempMin?.toDouble())! - 273.57 ?? ""}°C',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: WeatherColor.grey,
                                                  fontFamily:
                                                      GoogleFonts.roboto()
                                                          .fontFamily)),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                              '${(data?.list?[6].main?.tempMax?.toDouble())! - 273.57 ?? ""}°C',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: WeatherColor.black,
                                                  fontFamily:
                                                      GoogleFonts.roboto()
                                                          .fontFamily)),
                                        ],
                                      ),
                                      Divider(
                                        color: WeatherColor.grey,
                                        indent: 10,
                                        endIndent: 10,
                                      ),
                                      Row(
                                        children: [
                                          Text('Teus',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: WeatherColor.black,
                                                  fontFamily:
                                                      GoogleFonts.roboto()
                                                          .fontFamily)),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                              '${(data?.list?[7].main?.tempMin?.toDouble())! - 273.57 ?? ""}°C',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: WeatherColor.grey,
                                                  fontFamily:
                                                      GoogleFonts.roboto()
                                                          .fontFamily)),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                              '${(data?.list?[7].main?.tempMax?.toDouble())! - 273.57 ?? ""}°C',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: WeatherColor.black,
                                                  fontFamily:
                                                      GoogleFonts.roboto()
                                                          .fontFamily)),
                                        ],
                                      ),
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
                      ],
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}
