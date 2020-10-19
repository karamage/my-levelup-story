// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
class _$UserTearOff {
  const _$UserTearOff();

// ignore: unused_element
  _User call(
      {String id,
      String nickname,
      String desc,
      String imageUrl,
      int totalPoint = 0,
      int profileViewedCount = 0,
      int totalLikedCount = 0,
      int profileCommentCount = 0}) {
    return _User(
      id: id,
      nickname: nickname,
      desc: desc,
      imageUrl: imageUrl,
      totalPoint: totalPoint,
      profileViewedCount: profileViewedCount,
      totalLikedCount: totalLikedCount,
      profileCommentCount: profileCommentCount,
    );
  }

// ignore: unused_element
  User fromJson(Map<String, Object> json) {
    return User.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $User = _$UserTearOff();

/// @nodoc
mixin _$User {
  String get id;
  String get nickname;
  String get desc;
  String get imageUrl;
  int get totalPoint;
  int get profileViewedCount;
  int get totalLikedCount;
  int get profileCommentCount;

  Map<String, dynamic> toJson();
  $UserCopyWith<User> get copyWith;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String nickname,
      String desc,
      String imageUrl,
      int totalPoint,
      int profileViewedCount,
      int totalLikedCount,
      int profileCommentCount});
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object id = freezed,
    Object nickname = freezed,
    Object desc = freezed,
    Object imageUrl = freezed,
    Object totalPoint = freezed,
    Object profileViewedCount = freezed,
    Object totalLikedCount = freezed,
    Object profileCommentCount = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      nickname: nickname == freezed ? _value.nickname : nickname as String,
      desc: desc == freezed ? _value.desc : desc as String,
      imageUrl: imageUrl == freezed ? _value.imageUrl : imageUrl as String,
      totalPoint: totalPoint == freezed ? _value.totalPoint : totalPoint as int,
      profileViewedCount: profileViewedCount == freezed
          ? _value.profileViewedCount
          : profileViewedCount as int,
      totalLikedCount: totalLikedCount == freezed
          ? _value.totalLikedCount
          : totalLikedCount as int,
      profileCommentCount: profileCommentCount == freezed
          ? _value.profileCommentCount
          : profileCommentCount as int,
    ));
  }
}

/// @nodoc
abstract class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String nickname,
      String desc,
      String imageUrl,
      int totalPoint,
      int profileViewedCount,
      int totalLikedCount,
      int profileCommentCount});
}

/// @nodoc
class __$UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object id = freezed,
    Object nickname = freezed,
    Object desc = freezed,
    Object imageUrl = freezed,
    Object totalPoint = freezed,
    Object profileViewedCount = freezed,
    Object totalLikedCount = freezed,
    Object profileCommentCount = freezed,
  }) {
    return _then(_User(
      id: id == freezed ? _value.id : id as String,
      nickname: nickname == freezed ? _value.nickname : nickname as String,
      desc: desc == freezed ? _value.desc : desc as String,
      imageUrl: imageUrl == freezed ? _value.imageUrl : imageUrl as String,
      totalPoint: totalPoint == freezed ? _value.totalPoint : totalPoint as int,
      profileViewedCount: profileViewedCount == freezed
          ? _value.profileViewedCount
          : profileViewedCount as int,
      totalLikedCount: totalLikedCount == freezed
          ? _value.totalLikedCount
          : totalLikedCount as int,
      profileCommentCount: profileCommentCount == freezed
          ? _value.profileCommentCount
          : profileCommentCount as int,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_User implements _User {
  const _$_User(
      {this.id,
      this.nickname,
      this.desc,
      this.imageUrl,
      this.totalPoint = 0,
      this.profileViewedCount = 0,
      this.totalLikedCount = 0,
      this.profileCommentCount = 0})
      : assert(totalPoint != null),
        assert(profileViewedCount != null),
        assert(totalLikedCount != null),
        assert(profileCommentCount != null);

  factory _$_User.fromJson(Map<String, dynamic> json) =>
      _$_$_UserFromJson(json);

  @override
  final String id;
  @override
  final String nickname;
  @override
  final String desc;
  @override
  final String imageUrl;
  @JsonKey(defaultValue: 0)
  @override
  final int totalPoint;
  @JsonKey(defaultValue: 0)
  @override
  final int profileViewedCount;
  @JsonKey(defaultValue: 0)
  @override
  final int totalLikedCount;
  @JsonKey(defaultValue: 0)
  @override
  final int profileCommentCount;

  @override
  String toString() {
    return 'User(id: $id, nickname: $nickname, desc: $desc, imageUrl: $imageUrl, totalPoint: $totalPoint, profileViewedCount: $profileViewedCount, totalLikedCount: $totalLikedCount, profileCommentCount: $profileCommentCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _User &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.nickname, nickname) ||
                const DeepCollectionEquality()
                    .equals(other.nickname, nickname)) &&
            (identical(other.desc, desc) ||
                const DeepCollectionEquality().equals(other.desc, desc)) &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)) &&
            (identical(other.totalPoint, totalPoint) ||
                const DeepCollectionEquality()
                    .equals(other.totalPoint, totalPoint)) &&
            (identical(other.profileViewedCount, profileViewedCount) ||
                const DeepCollectionEquality()
                    .equals(other.profileViewedCount, profileViewedCount)) &&
            (identical(other.totalLikedCount, totalLikedCount) ||
                const DeepCollectionEquality()
                    .equals(other.totalLikedCount, totalLikedCount)) &&
            (identical(other.profileCommentCount, profileCommentCount) ||
                const DeepCollectionEquality()
                    .equals(other.profileCommentCount, profileCommentCount)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(nickname) ^
      const DeepCollectionEquality().hash(desc) ^
      const DeepCollectionEquality().hash(imageUrl) ^
      const DeepCollectionEquality().hash(totalPoint) ^
      const DeepCollectionEquality().hash(profileViewedCount) ^
      const DeepCollectionEquality().hash(totalLikedCount) ^
      const DeepCollectionEquality().hash(profileCommentCount);

  @override
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserToJson(this);
  }
}

abstract class _User implements User {
  const factory _User(
      {String id,
      String nickname,
      String desc,
      String imageUrl,
      int totalPoint,
      int profileViewedCount,
      int totalLikedCount,
      int profileCommentCount}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  String get id;
  @override
  String get nickname;
  @override
  String get desc;
  @override
  String get imageUrl;
  @override
  int get totalPoint;
  @override
  int get profileViewedCount;
  @override
  int get totalLikedCount;
  @override
  int get profileCommentCount;
  @override
  _$UserCopyWith<_User> get copyWith;
}
