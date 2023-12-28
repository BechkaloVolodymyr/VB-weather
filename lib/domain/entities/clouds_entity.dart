import 'package:freezed_annotation/freezed_annotation.dart';
part 'clouds_entity.freezed.dart';

@freezed
class CloudsEntity with _$CloudsEntity {
  const factory CloudsEntity({
    int? all,
  }) = _CloudsEntity;
}
