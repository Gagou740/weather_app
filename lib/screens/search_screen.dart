import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/weather_bloc.dart';
import 'detail_screen.dart';

class SearchScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rechercher une ville')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Ville'),
              onSubmitted: (value) {
                BlocProvider.of<WeatherBloc>(context).add(FetchWeather(value));
              },
            ),
            Expanded(child: _buildWeather(context))
          ],
        ),
      ),
    );
  }

  Widget _buildWeather(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherInitial) {
          return Center(child: Text('Entrez le nom d\'une ville'));
        } else if (state is WeatherLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is WeatherLoaded) {
          return ListTile(
            title: Text(state.weather.cityName),
            subtitle: Text('Température: ${state.weather.temperature}°C'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(weather: state.weather),
                ),
              );
            },
          );
        } else {
          return Center(child: Text('Impossible de récupérer les données météo'));
        }
      },
    );
  }
}
