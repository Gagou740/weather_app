import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final String cityName;
  final double temperature;
  final double windSpeed;
  final double humidity;
  final double feelsLike;
  final List<HourlyForecast> hourlyForecast;
  final List<DailyForecast> dailyForecast;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.windSpeed,
    required this.humidity,
    required this.feelsLike,
    required this.hourlyForecast,
    required this.dailyForecast,
  });

  @override
  List<Object> get props => [cityName, temperature, windSpeed, humidity, feelsLike, hourlyForecast, dailyForecast];

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['cityName'],
      temperature: json['temperature'],
      windSpeed: json['windSpeed'],
      humidity: json['humidity'],
      feelsLike: json['feelsLike'],
      hourlyForecast: (json['hourlyForecast'] as List)
          .map((i) => HourlyForecast.fromJson(i))
          .toList(),
      dailyForecast: (json['dailyForecast'] as List)
          .map((i) => DailyForecast.fromJson(i))
          .toList(),
    );
  }
}

class HourlyForecast extends Equatable {
  final DateTime time;
  final double temperature;

  HourlyForecast({required this.time, required this.temperature});

  @override
  List<Object> get props => [time, temperature];

  factory HourlyForecast.fromJson(Map<String, dynamic> json) {
    return HourlyForecast(
      time: DateTime.parse(json['time']),
      temperature: json['temperature'].toDouble(),
    );
  }
}

class DailyForecast extends Equatable {
  final DateTime date;
  final double temperature;
  final double chanceOfRain;

  DailyForecast({required this.date, required this.temperature, required this.chanceOfRain});

  @override
  List<Object> get props => [date, temperature, chanceOfRain];

  factory DailyForecast.fromJson(Map<String, dynamic> json) {
    return DailyForecast(
      date: DateTime.parse(json['date']),
      temperature: json['temperature'].toDouble(),
      chanceOfRain: json['chanceOfRain'].toDouble(),
    );
  }
}
