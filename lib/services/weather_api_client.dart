import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather.dart';

class WeatherApiClient {
  static const baseUrl = 'https://api.open-meteo.com/v1/forecast';
  final http.Client httpClient;

  WeatherApiClient({required this.httpClient});

  Future<Weather> fetchWeather(String cityName) async {
    final weatherUrl = '$baseUrl?city=$cityName&hourly=temperature';
    final response = await httpClient.get(Uri.parse(weatherUrl));

    if (response.statusCode != 200) {
      throw Exception('Failed to fetch weather data');
    }

    final weatherJson = jsonDecode(response.body);
    return Weather.fromJson(weatherJson);
  }
}
