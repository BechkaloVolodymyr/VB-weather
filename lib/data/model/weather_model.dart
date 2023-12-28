import 'package:json_annotation/json_annotation.dart';

part 'weather_model.g.dart';

@JsonSerializable(createToJson: false)
class WeatherModel {
  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  WeatherModel({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);
}
