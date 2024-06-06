import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../models/weather.dart';
import '../services/weather_api_client.dart';

// Événements
abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class FetchWeather extends WeatherEvent {
  final String cityName;

  const FetchWeather(this.cityName);

  @override
  List<Object> get props => [cityName];
}

// États
abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final Weather weather;

  const WeatherLoaded(this.weather);

  @override
  List<Object> get props => [weather];
}

class WeatherError extends WeatherState {}

// BLoC
class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherApiClient weatherApiClient;

  WeatherBloc(this.weatherApiClient) : super(WeatherInitial());

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is FetchWeather) {
      yield WeatherLoading();
      try {
        final weather = await weatherApiClient.fetchWeather(event.cityName);
        yield WeatherLoaded(weather);
      } catch (_) {
        yield WeatherError();
      }
    }
  }
}
