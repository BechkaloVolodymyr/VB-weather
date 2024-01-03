import 'package:freezed_annotation/freezed_annotation.dart';
part 'rain_entity.freezed.dart';

@freezed
class RainEntity with _$RainEntity {
  const factory RainEntity({
    double? oneH,
  }) = _RainEntity;
}
