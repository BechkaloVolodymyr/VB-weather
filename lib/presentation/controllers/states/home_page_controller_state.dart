import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather/domain/entities/main_wether_entity.dart';

part 'home_page_controller_state.freezed.dart';

@freezed
class HomePageControllerState with _$HomePageControllerState {
  const factory HomePageControllerState({
    @Default(false) bool loading,
    @Default(false) bool loadingError,
    @Default(null) MainWetherEntity? weather,
  }) = _HomePageControllerState;
}
