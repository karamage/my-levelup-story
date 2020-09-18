// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Item _$ItemFromJson(Map<String, dynamic> json) {
  return _Item.fromJson(json);
}

class _$ItemTearOff {
  const _$ItemTearOff();

// ignore: unused_element
  _Item call(
      {String id,
      String title,
      String body,
      int likeCount,
      int starCount,
      int commentCount,
      bool isPublic,
      CategoryType category,
      List<String> likedUserIds,
      User user,
      DateTime createdAt,
      DateTime updatedAt}) {
    return _Item(
      id: id,
      title: title,
      body: body,
      likeCount: likeCount,
      starCount: starCount,
      commentCount: commentCount,
      isPublic: isPublic,
      category: category,
      likedUserIds: likedUserIds,
      user: user,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

// ignore: unused_element
const $Item = _$ItemTearOff();

mixin _$Item {
  String get id;
  String get title;
  String get body;
  int get likeCount;
  int get starCount;
  int get commentCount;
  bool get isPublic;
  CategoryType get category;
  List<String> get likedUserIds;
  User get user;
  DateTime get createdAt;
  DateTime get updatedAt;

  Map<String, dynamic> toJson();
  $ItemCopyWith<Item> get copyWith;
}

abstract class $ItemCopyWith<$Res> {
  factory $ItemCopyWith(Item value, $Res Function(Item) then) =
      _$ItemCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String title,
      String body,
      int likeCount,
      int starCount,
      int commentCount,
      bool isPublic,
      CategoryType category,
      List<String> likedUserIds,
      User user,
      DateTime createdAt,
      DateTime updatedAt});

  $UserCopyWith<$Res> get user;
}

class _$ItemCopyWithImpl<$Res> implements $ItemCopyWith<$Res> {
  _$ItemCopyWithImpl(this._value, this._then);

  final Item _value;
  // ignore: unused_field
  final $Res Function(Item) _then;

  @override
  $Res call({
    Object id = freezed,
    Object title = freezed,
    Object body = freezed,
    Object likeCount = freezed,
    Object starCount = freezed,
    Object commentCount = freezed,
    Object isPublic = freezed,
    Object category = freezed,
    Object likedUserIds = freezed,
    Object user = freezed,
    Object createdAt = freezed,
    Object updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      title: title == freezed ? _value.title : title as String,
      body: body == freezed ? _value.body : body as String,
      likeCount: likeCount == freezed ? _value.likeCount : likeCount as int,
      starCount: starCount == freezed ? _value.starCount : starCount as int,
      commentCount:
          commentCount == freezed ? _value.commentCount : commentCount as int,
      isPublic: isPublic == freezed ? _value.isPublic : isPublic as bool,
      category:
          category == freezed ? _value.category : category as CategoryType,
      likedUserIds: likedUserIds == freezed
          ? _value.likedUserIds
          : likedUserIds as List<String>,
      user: user == freezed ? _value.user : user as User,
      createdAt:
          createdAt == freezed ? _value.createdAt : createdAt as DateTime,
      updatedAt:
          updatedAt == freezed ? _value.updatedAt : updatedAt as DateTime,
    ));
  }

  @override
  $UserCopyWith<$Res> get user {
    if (_value.user == null) {
      return null;
    }
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

abstract class _$ItemCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory _$ItemCopyWith(_Item value, $Res Function(_Item) then) =
      __$ItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String title,
      String body,
      int likeCount,
      int starCount,
      int commentCount,
      bool isPublic,
      CategoryType category,
      List<String> likedUserIds,
      User user,
      DateTime createdAt,
      DateTime updatedAt});

  @override
  $UserCopyWith<$Res> get user;
}

class __$ItemCopyWithImpl<$Res> extends _$ItemCopyWithImpl<$Res>
    implements _$ItemCopyWith<$Res> {
  __$ItemCopyWithImpl(_Item _value, $Res Function(_Item) _then)
      : super(_value, (v) => _then(v as _Item));

  @override
  _Item get _value => super._value as _Item;

  @override
  $Res call({
    Object id = freezed,
    Object title = freezed,
    Object body = freezed,
    Object likeCount = freezed,
    Object starCount = freezed,
    Object commentCount = freezed,
    Object isPublic = freezed,
    Object category = freezed,
    Object likedUserIds = freezed,
    Object user = freezed,
    Object createdAt = freezed,
    Object updatedAt = freezed,
  }) {
    return _then(_Item(
      id: id == freezed ? _value.id : id as String,
      title: title == freezed ? _value.title : title as String,
      body: body == freezed ? _value.body : body as String,
      likeCount: likeCount == freezed ? _value.likeCount : likeCount as int,
      starCount: starCount == freezed ? _value.starCount : starCount as int,
      commentCount:
          commentCount == freezed ? _value.commentCount : commentCount as int,
      isPublic: isPublic == freezed ? _value.isPublic : isPublic as bool,
      category:
          category == freezed ? _value.category : category as CategoryType,
      likedUserIds: likedUserIds == freezed
          ? _value.likedUserIds
          : likedUserIds as List<String>,
      user: user == freezed ? _value.user : user as User,
      createdAt:
          createdAt == freezed ? _value.createdAt : createdAt as DateTime,
      updatedAt:
          updatedAt == freezed ? _value.updatedAt : updatedAt as DateTime,
    ));
  }
}

@JsonSerializable()
class _$_Item implements _Item {
  const _$_Item(
      {this.id,
      this.title,
      this.body,
      this.likeCount,
      this.starCount,
      this.commentCount,
      this.isPublic,
      this.category,
      this.likedUserIds,
      this.user,
      this.createdAt,
      this.updatedAt});

  factory _$_Item.fromJson(Map<String, dynamic> json) =>
      _$_$_ItemFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String body;
  @override
  final int likeCount;
  @override
  final int starCount;
  @override
  final int commentCount;
  @override
  final bool isPublic;
  @override
  final CategoryType category;
  @override
  final List<String> likedUserIds;
  @override
  final User user;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Item(id: $id, title: $title, body: $body, likeCount: $likeCount, starCount: $starCount, commentCount: $commentCount, isPublic: $isPublic, category: $category, likedUserIds: $likedUserIds, user: $user, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Item &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.body, body) ||
                const DeepCollectionEquality().equals(other.body, body)) &&
            (identical(other.likeCount, likeCount) ||
                const DeepCollectionEquality()
                    .equals(other.likeCount, likeCount)) &&
            (identical(other.starCount, starCount) ||
                const DeepCollectionEquality()
                    .equals(other.starCount, starCount)) &&
            (identical(other.commentCount, commentCount) ||
                const DeepCollectionEquality()
                    .equals(other.commentCount, commentCount)) &&
            (identical(other.isPublic, isPublic) ||
                const DeepCollectionEquality()
                    .equals(other.isPublic, isPublic)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.likedUserIds, likedUserIds) ||
                const DeepCollectionEquality()
                    .equals(other.likedUserIds, likedUserIds)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality()
                    .equals(other.updatedAt, updatedAt)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(body) ^
      const DeepCollectionEquality().hash(likeCount) ^
      const DeepCollectionEquality().hash(starCount) ^
      const DeepCollectionEquality().hash(commentCount) ^
      const DeepCollectionEquality().hash(isPublic) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(likedUserIds) ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt);

  @override
  _$ItemCopyWith<_Item> get copyWith =>
      __$ItemCopyWithImpl<_Item>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ItemToJson(this);
  }
}

abstract class _Item implements Item {
  const factory _Item(
      {String id,
      String title,
      String body,
      int likeCount,
      int starCount,
      int commentCount,
      bool isPublic,
      CategoryType category,
      List<String> likedUserIds,
      User user,
      DateTime createdAt,
      DateTime updatedAt}) = _$_Item;

  factory _Item.fromJson(Map<String, dynamic> json) = _$_Item.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get body;
  @override
  int get likeCount;
  @override
  int get starCount;
  @override
  int get commentCount;
  @override
  bool get isPublic;
  @override
  CategoryType get category;
  @override
  List<String> get likedUserIds;
  @override
  User get user;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  _$ItemCopyWith<_Item> get copyWith;
}
