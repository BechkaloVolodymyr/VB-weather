import 'package:json_annotation/json_annotation.dart';

part 'snow_model.g.dart';

@JsonSerializable(createToJson: false)
class SnowModel {
  @JsonKey(name: "1h")
  final double? oneH;
  @JsonKey(name: "3h")
  final double? threeH;
  SnowModel({
    this.oneH,
    this.threeH,
  });

  factory SnowModel.fromJson(Map<String, dynamic> json) =>
      _$SnowModelFromJson(json);
}
