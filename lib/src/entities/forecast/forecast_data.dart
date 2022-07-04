import 'package:open_weather_example_flutter/src/entities/forecast/forecast.dart';
import 'package:open_weather_example_flutter/src/entities/weather/weather_data.dart';
//прогноз данные

/// Derived model class used in the UI
class ForecastData { //создается класс ForecastData
  const ForecastData(this.list); //константа с параметрами list из класса Forecast
  factory ForecastData.from(Forecast forecast) { //фабричный конструктор с параметрами класса Forecast
    return ForecastData(
      forecast.list.map((item) => WeatherData.from(item)).toList(), //??
    );
  }
  final List<WeatherData> list;

}
