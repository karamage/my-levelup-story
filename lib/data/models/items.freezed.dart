// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'items.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Items _$ItemsFromJson(Map<String, dynamic> json) {
  return _Items.fromJson(json);
}

class _$ItemsTearOff {
  const _$ItemsTearOff();

// ignore: unused_element
  _Items call({List<Item> items = const [], bool isLoading = true}) {
    return _Items(
      items: items,
      isLoading: isLoading,
    );
  }
}

// ignore: unused_element
const $Items = _$ItemsTearOff();

mixin _$Items {
  List<Item> get items;
  bool get isLoading;

  Map<String, dynamic> toJson();
  $ItemsCopyWith<Items> get copyWith;
}

abstract class $ItemsCopyWith<$Res> {
  factory $ItemsCopyWith(Items value, $Res Function(Items) then) =
      _$ItemsCopyWithImpl<$Res>;
  $Res call({List<Item> items, bool isLoading});
}

class _$ItemsCopyWithImpl<$Res> implements $ItemsCopyWith<$Res> {
  _$ItemsCopyWithImpl(this._value, this._then);

  final Items _value;
  // ignore: unused_field
  final $Res Function(Items) _then;

  @override
  $Res call({
    Object items = freezed,
    Object isLoading = freezed,
  }) {
    return _then(_value.copyWith(
      items: items == freezed ? _value.items : items as List<Item>,
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
    ));
  }
}

abstract class _$ItemsCopyWith<$Res> implements $ItemsCopyWith<$Res> {
  factory _$ItemsCopyWith(_Items value, $Res Function(_Items) then) =
      __$ItemsCopyWithImpl<$Res>;
  @override
  $Res call({List<Item> items, bool isLoading});
}

class __$ItemsCopyWithImpl<$Res> extends _$ItemsCopyWithImpl<$Res>
    implements _$ItemsCopyWith<$Res> {
  __$ItemsCopyWithImpl(_Items _value, $Res Function(_Items) _then)
      : super(_value, (v) => _then(v as _Items));

  @override
  _Items get _value => super._value as _Items;

  @override
  $Res call({
    Object items = freezed,
    Object isLoading = freezed,
  }) {
    return _then(_Items(
      items: items == freezed ? _value.items : items as List<Item>,
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
    ));
  }
}

@JsonSerializable()
class _$_Items implements _Items {
  const _$_Items({this.items = const [], this.isLoading = true})
      : assert(items != null),
        assert(isLoading != null);

  factory _$_Items.fromJson(Map<String, dynamic> json) =>
      _$_$_ItemsFromJson(json);

  @JsonKey(defaultValue: const [])
  @override
  final List<Item> items;
  @JsonKey(defaultValue: true)
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'Items(items: $items, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Items &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)) &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(items) ^
      const DeepCollectionEquality().hash(isLoading);

  @override
  _$ItemsCopyWith<_Items> get copyWith =>
      __$ItemsCopyWithImpl<_Items>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ItemsToJson(this);
  }
}

abstract class _Items implements Items {
  const factory _Items({List<Item> items, bool isLoading}) = _$_Items;

  factory _Items.fromJson(Map<String, dynamic> json) = _$_Items.fromJson;

  @override
  List<Item> get items;
  @override
  bool get isLoading;
  @override
  _$ItemsCopyWith<_Items> get copyWith;
}
