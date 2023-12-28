import 'package:freezed_annotation/freezed_annotation.dart';
part 'wind_entity.freezed.dart';

@freezed
class WindEntity with _$WindEntity {
  const factory WindEntity({
    double? speed,
    int? deg,
    double? gust,
  }) = _WindEntity;
}
