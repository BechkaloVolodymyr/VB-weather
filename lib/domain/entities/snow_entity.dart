import 'package:freezed_annotation/freezed_annotation.dart';
part 'snow_entity.freezed.dart';

@freezed
class SnowEntity with _$SnowEntity {
  const factory SnowEntity({
    double? oneH,
  }) = _SnowEntity;
}
