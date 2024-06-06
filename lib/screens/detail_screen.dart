import 'package:flutter/material.dart';
import '../models/weather.dart';

class DetailScreen extends StatelessWidget {
  final Weather weather;

  DetailScreen({required this.weather});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(weather.cityName)),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Température: ${weather.temperature}°C'),
            Text('Ressenti: ${weather.feelsLike}°C'),
            Text('Humidité: ${weather.humidity}%'),
            Text('Vent: ${weather.windSpeed} km/h'),
            // Ajoutez d'autres détails météo ici
          ],
        ),
      ),
    );
  }
}
