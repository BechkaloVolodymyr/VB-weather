import 'package:freezed_annotation/freezed_annotation.dart';
part 'weather_entity.freezed.dart';

@freezed
class WeatherEntity with _$WeatherEntity {
  const factory WeatherEntity({
    int? id,
    String? main,
    String? description,
    String? icon,
  }) = _WeatherEntity;
}
