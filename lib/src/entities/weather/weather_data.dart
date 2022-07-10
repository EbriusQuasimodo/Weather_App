import 'package:open_weather_example_flutter/src/entities/temperature.dart';
import 'package:open_weather_example_flutter/src/entities/weather/weather.dart';
//погода данные
/// Derived model class used in the UI
/// производный класс модели используется в интерфейсе
class WeatherData {
  WeatherData({ //создается класс WeatherData
    required this.temp,
    required this.minTemp,
    required this.maxTemp,
    required this.description,
    required this.date,
    required this.icon,
  });

  factory WeatherData.from(Weather weather) { //создается фабричный конструктор который содержит
    return WeatherData( //список свойств класса WeatherData с параметрами класса Weather
      temp: Temperature.celsius(weather.weatherParams.temp),
      minTemp: Temperature.celsius(weather.weatherParams.tempMin),
      maxTemp: Temperature.celsius(weather.weatherParams.tempMax),
      description: weather.weatherInfo[0].main,
      date: DateTime.fromMillisecondsSinceEpoch(weather.dt * 1000),
      icon: weather.weatherInfo[0].icon,
    );
  }

  final Temperature temp;
  final Temperature minTemp;
  final Temperature maxTemp;
  final String description;
  final DateTime date;
  final String icon;

  String get iconUrl => "https://openweathermap.org/img/wn/$icon@2x.png"; //??
}
