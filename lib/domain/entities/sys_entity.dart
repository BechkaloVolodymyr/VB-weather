import 'package:freezed_annotation/freezed_annotation.dart';
part 'sys_entity.freezed.dart';

@freezed
class SysEntity with _$SysEntity {
  const factory SysEntity({
    int? type,
    int? id,
    String? country,
    int? sunrise,
    int? sunset,
  }) = _SysEntity;
}
