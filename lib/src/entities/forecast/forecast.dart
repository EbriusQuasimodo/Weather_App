library forecast;
//прогноз
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:open_weather_example_flutter/src/entities/weather/weather.dart';

part 'forecast.g.dart';
part 'forecast.freezed.dart';

/// Forecast data parsed from the API response (not used directly in the UI)
//freezed это конструктор кода, создает файлы .freezed
@freezed
class Forecast with _$Forecast {
  factory Forecast({
    required List<Weather> list, //создается фабричный конструктор (вроде в freezed он обязательный),
  }) = _Forecast;                      //он содержит список свойств (list) класса Forecast

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json); //forecast.g.dart генерирует метод ToJson для List
}
