import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/weather_api/model/WeatherResponse.dart';

class ApiManager {
  static const String Base_Url = 'api.openweathermap.org';
  static const String Api_Id = '22bfb3717e47c1f1b611d99cc777c9f8';

  static Future<WeatherResponse> getCurrentWeather(String country) async {
    //  ?q=cairo&appid=22bfb3717e47c1f1b611d99cc777c9f8
    var uri = Uri.https(
        Base_Url, '/data/2.5/forecast', {'appid': Api_Id, 'q': country});

    var response = await http.get(uri);
    var responseBody = response.body;
    var json = jsonDecode(responseBody);
    print(json);
    var weatherResponse = WeatherResponse.fromJson(json);
    print(weatherResponse);
    return weatherResponse;
  }
}
