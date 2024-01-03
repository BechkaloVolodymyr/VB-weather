import 'package:freezed_annotation/freezed_annotation.dart';
part 'coord_entity.freezed.dart';

@freezed
class CoordEntity with _$CoordEntity {
  const factory CoordEntity({
    double? lon,
    double? lat,
  }) = _CoordEntity;
}
