import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:weather/domain/entities/main_wether_entity.dart';

part 'add_weather_location_page_controller_state.freezed.dart';

@freezed
class AddWeatherLocationPageControllerState
    with _$AddWeatherLocationPageControllerState {
  const factory AddWeatherLocationPageControllerState({
    @Default(false) bool loading,
    @Default(false) bool loadingError,
    // @Default(null) MainWetherEntity? weather,
  }) = _AddWeatherLocationPageControllerState;
}
