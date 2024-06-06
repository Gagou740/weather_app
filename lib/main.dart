import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/weather_bloc.dart';
import 'services/weather_api_client.dart';
import 'screens/search_screen.dart';

void main() {
  final WeatherApiClient weatherApiClient = WeatherApiClient(httpClient: http.Client());
  runApp(MyApp(weatherApiClient: weatherApiClient));
}

class MyApp extends StatelessWidget {
  final WeatherApiClient weatherApiClient;

  MyApp({required this.weatherApiClient});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      home: BlocProvider(
        create: (context) => WeatherBloc(weatherApiClient),
        child: SearchScreen(),
      ),
    );
  }
}
