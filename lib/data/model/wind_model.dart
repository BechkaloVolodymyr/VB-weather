import 'package:json_annotation/json_annotation.dart';

part 'wind_model.g.dart';

@JsonSerializable(createToJson: false)
class WindModel {
  final double? speed;
  final int? deg;
  final double? gust;

  WindModel({
    this.speed,
    this.deg,
    this.gust,
  });

  factory WindModel.fromJson(Map<String, dynamic> json) =>
      _$WindModelFromJson(json);
}
