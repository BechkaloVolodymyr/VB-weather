import 'package:json_annotation/json_annotation.dart';

part 'rain_model.g.dart';

@JsonSerializable(createToJson: false)
class RainModel {
  @JsonKey(name: "1h")
  final double? oneH;

  RainModel({
    this.oneH,
  });

  factory RainModel.fromJson(Map<String, dynamic> json) =>
      _$RainModelFromJson(json);
}
