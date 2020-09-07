import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth.freezed.dart';
part 'auth.g.dart';

@freezed
abstract class Auth with _$Auth{
  const factory Auth({
    bool isLogined
  }) = _Auth;
  factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);
}
