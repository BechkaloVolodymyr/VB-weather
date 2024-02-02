import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_weather_location_configuration.freezed.dart';

@freezed
class AddWeatherLocationConfiguration with _$AddWeatherLocationConfiguration {
  const factory AddWeatherLocationConfiguration({
    String? businessAddressLatitude,
    String? businessAddressLongitude,
    bool? isVerify,
  }) = _AddWeatherLocationConfiguration;
}
