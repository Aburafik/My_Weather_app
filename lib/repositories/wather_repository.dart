import 'dart:convert';

import 'package:http/http.dart';

import '../models/weather_model.dart';

abstract class WeatherRepository {
  Future<Weather> getWeather(
      {required double latitude, required double longitude});
}

class WeatherRepositoryImpl implements WeatherRepository {
  final url = 'https://api.openweathermap.org/data/2.5/weather';

  String urlBuilder({required lat, required lon}) {
    const apiKey = "YOUR_API_KEY";
    return '$url?lat=$lat&lon=$lon&appid=$apiKey&units=metric';
  }

  @override
  Future<Weather> getWeather(
      {required double latitude, required double longitude}) async {
    try {
      Response res =
          await get(Uri.parse(urlBuilder(lat: latitude, lon: longitude)));
      int statusCode = res.statusCode;
      if (statusCode == 200) {
        return Weather.fromJson(json.decode(res.body));
      } else {
        throw Exception('Failed to load weather');
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to load weather');
    }
  }
}
