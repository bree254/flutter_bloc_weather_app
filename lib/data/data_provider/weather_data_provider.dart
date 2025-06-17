import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../secrets.dart';

class WeatherDataProvider {
  Future<String> getCurrentWeather(String cityName) async {
    try {

      final res = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$openWeatherAPIKey',
        ),

      );
      print('weather data #### ${res.body}');
      return res.body;
    } catch (e) {
      print('weather data error #### ${e.toString()}');
      throw e.toString();

    }
  }

 /* Future<String> getCurrentWeatherByLocation(double lat, double lon) async {
    try{
    final res = await http.get(
        Uri.parse(
      'https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&units=metric&appid=$openWeatherAPIKey',
    ));

    // if (response.statusCode != 200) {
    //   throw Exception('Failed to load weather data');
    // }
    //
    // return response.body;
    print('weather data #### ${res.body}');
        return res.body;
      } catch (e) {
        print('weather data error #### ${e.toString()}');
        throw e.toString();

      }
  }*/

}