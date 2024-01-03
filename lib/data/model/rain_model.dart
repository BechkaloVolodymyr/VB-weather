import 'package:json_annotation/json_annotation.dart';

part 'rain_model.g.dart';

@JsonSerializable(createToJson: false)
class RainModel {
  @JsonKey(name: "1h")
  final double? oneH;
  @JsonKey(name: "3h")
  final double? threeH;
  RainModel({
    this.oneH,
    this.threeH,
  });

  factory RainModel.fromJson(Map<String, dynamic> json) =>
      _$RainModelFromJson(json);
}
