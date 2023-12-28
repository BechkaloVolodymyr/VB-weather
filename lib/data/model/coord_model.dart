import 'package:json_annotation/json_annotation.dart';

part 'coord_model.g.dart';

@JsonSerializable(createToJson: false)
class CoordModel {
  final double? lon;
  final double? lat;

  CoordModel({
    this.lon,
    this.lat,
  });

  factory CoordModel.fromJson(Map<String, dynamic> json) =>
      _$CoordModelFromJson(json);
}
