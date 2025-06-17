import 'dart:convert';

import 'package:flutter_bloc_weather_app/data/data_provider/weather_data_provider.dart';
import 'package:flutter_bloc_weather_app/models/weather_model.dart';
// import 'package:geolocator/geolocator.dart';

class WeatherRepository{
  final WeatherDataProvider weatherDataProvider;

  WeatherRepository(this.weatherDataProvider);

  // Future<Position> getCurrentLocation() async {
  //   bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     throw 'Location services are disabled.';
  //   }
  //
  //   LocationPermission permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       throw 'Location permission denied';
  //     }
  //   }
  //
  //   if (permission == LocationPermission.deniedForever) {
  //     throw 'Location permission permanently denied';
  //   }
  //
  //   return await Geolocator.getCurrentPosition(
  //     desiredAccuracy: LocationAccuracy.high,
  //   );
  // }

  Future<WeatherModel> getCurrentWeather() async {
    try {
      String cityName = 'Nairobi';
     final weatherData = await weatherDataProvider.getCurrentWeather(cityName);

      // final position = await getCurrentLocation();
      // final weatherData = await weatherDataProvider.getCurrentWeatherByLocation(
      //   position.latitude,
      //   position.longitude,
      // );

      final data = jsonDecode(weatherData);

      if (data['cod'] != '200') {
        throw 'An unexpected error occurred';
      }

      return WeatherModel.fromMap(data);
    } catch (e) {
      throw e.toString();
    }
  }

}