import 'package:freezed_annotation/freezed_annotation.dart';
part 'main_entity.freezed.dart';

@freezed
class MainEntity with _$MainEntity {
  const factory MainEntity({
    double? temp,
    double? feelsLike,
    double? tempMin,
    double? tempMax,
    int? pressure,
    int? humidity,
  }) = _MainEntity;
}
