// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ship.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ShipInGrid {
  ShipEntity get ship => throw _privateConstructorUsedError;
  Cell get cell => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShipInGridCopyWith<ShipInGrid> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShipInGridCopyWith<$Res> {
  factory $ShipInGridCopyWith(
          ShipInGrid value, $Res Function(ShipInGrid) then) =
      _$ShipInGridCopyWithImpl<$Res>;
  $Res call({ShipEntity ship, Cell cell});

  $ShipEntityCopyWith<$Res> get ship;
  $CellCopyWith<$Res> get cell;
}

/// @nodoc
class _$ShipInGridCopyWithImpl<$Res> implements $ShipInGridCopyWith<$Res> {
  _$ShipInGridCopyWithImpl(this._value, this._then);

  final ShipInGrid _value;
  // ignore: unused_field
  final $Res Function(ShipInGrid) _then;

  @override
  $Res call({
    Object? ship = freezed,
    Object? cell = freezed,
  }) {
    return _then(_value.copyWith(
      ship: ship == freezed
          ? _value.ship
          : ship // ignore: cast_nullable_to_non_nullable
              as ShipEntity,
      cell: cell == freezed
          ? _value.cell
          : cell // ignore: cast_nullable_to_non_nullable
              as Cell,
    ));
  }

  @override
  $ShipEntityCopyWith<$Res> get ship {
    return $ShipEntityCopyWith<$Res>(_value.ship, (value) {
      return _then(_value.copyWith(ship: value));
    });
  }

  @override
  $CellCopyWith<$Res> get cell {
    return $CellCopyWith<$Res>(_value.cell, (value) {
      return _then(_value.copyWith(cell: value));
    });
  }
}

/// @nodoc
abstract class _$$_ShipInGridCopyWith<$Res>
    implements $ShipInGridCopyWith<$Res> {
  factory _$$_ShipInGridCopyWith(
          _$_ShipInGrid value, $Res Function(_$_ShipInGrid) then) =
      __$$_ShipInGridCopyWithImpl<$Res>;
  @override
  $Res call({ShipEntity ship, Cell cell});

  @override
  $ShipEntityCopyWith<$Res> get ship;
  @override
  $CellCopyWith<$Res> get cell;
}

/// @nodoc
class __$$_ShipInGridCopyWithImpl<$Res> extends _$ShipInGridCopyWithImpl<$Res>
    implements _$$_ShipInGridCopyWith<$Res> {
  __$$_ShipInGridCopyWithImpl(
      _$_ShipInGrid _value, $Res Function(_$_ShipInGrid) _then)
      : super(_value, (v) => _then(v as _$_ShipInGrid));

  @override
  _$_ShipInGrid get _value => super._value as _$_ShipInGrid;

  @override
  $Res call({
    Object? ship = freezed,
    Object? cell = freezed,
  }) {
    return _then(_$_ShipInGrid(
      ship: ship == freezed
          ? _value.ship
          : ship // ignore: cast_nullable_to_non_nullable
              as ShipEntity,
      cell: cell == freezed
          ? _value.cell
          : cell // ignore: cast_nullable_to_non_nullable
              as Cell,
    ));
  }
}

/// @nodoc

class _$_ShipInGrid extends _ShipInGrid {
  const _$_ShipInGrid({required this.ship, required this.cell}) : super._();

  @override
  final ShipEntity ship;
  @override
  final Cell cell;

  @override
  String toString() {
    return 'ShipInGrid(ship: $ship, cell: $cell)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShipInGrid &&
            const DeepCollectionEquality().equals(other.ship, ship) &&
            const DeepCollectionEquality().equals(other.cell, cell));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(ship),
      const DeepCollectionEquality().hash(cell));

  @JsonKey(ignore: true)
  @override
  _$$_ShipInGridCopyWith<_$_ShipInGrid> get copyWith =>
      __$$_ShipInGridCopyWithImpl<_$_ShipInGrid>(this, _$identity);
}

abstract class _ShipInGrid extends ShipInGrid {
  const factory _ShipInGrid(
      {required final ShipEntity ship,
      required final Cell cell}) = _$_ShipInGrid;
  const _ShipInGrid._() : super._();

  @override
  ShipEntity get ship;
  @override
  Cell get cell;
  @override
  @JsonKey(ignore: true)
  _$$_ShipInGridCopyWith<_$_ShipInGrid> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ShipEntity {
  ShipType get type => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  ShipAxis get axis => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShipEntityCopyWith<ShipEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShipEntityCopyWith<$Res> {
  factory $ShipEntityCopyWith(
          ShipEntity value, $Res Function(ShipEntity) then) =
      _$ShipEntityCopyWithImpl<$Res>;
  $Res call({ShipType type, String uid, ShipAxis axis});
}

/// @nodoc
class _$ShipEntityCopyWithImpl<$Res> implements $ShipEntityCopyWith<$Res> {
  _$ShipEntityCopyWithImpl(this._value, this._then);

  final ShipEntity _value;
  // ignore: unused_field
  final $Res Function(ShipEntity) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? uid = freezed,
    Object? axis = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ShipType,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      axis: axis == freezed
          ? _value.axis
          : axis // ignore: cast_nullable_to_non_nullable
              as ShipAxis,
    ));
  }
}

/// @nodoc
abstract class _$$_ShipEntityCopyWith<$Res>
    implements $ShipEntityCopyWith<$Res> {
  factory _$$_ShipEntityCopyWith(
          _$_ShipEntity value, $Res Function(_$_ShipEntity) then) =
      __$$_ShipEntityCopyWithImpl<$Res>;
  @override
  $Res call({ShipType type, String uid, ShipAxis axis});
}

/// @nodoc
class __$$_ShipEntityCopyWithImpl<$Res> extends _$ShipEntityCopyWithImpl<$Res>
    implements _$$_ShipEntityCopyWith<$Res> {
  __$$_ShipEntityCopyWithImpl(
      _$_ShipEntity _value, $Res Function(_$_ShipEntity) _then)
      : super(_value, (v) => _then(v as _$_ShipEntity));

  @override
  _$_ShipEntity get _value => super._value as _$_ShipEntity;

  @override
  $Res call({
    Object? type = freezed,
    Object? uid = freezed,
    Object? axis = freezed,
  }) {
    return _then(_$_ShipEntity(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ShipType,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      axis: axis == freezed
          ? _value.axis
          : axis // ignore: cast_nullable_to_non_nullable
              as ShipAxis,
    ));
  }
}

/// @nodoc

class _$_ShipEntity implements _ShipEntity {
  const _$_ShipEntity(
      {required this.type, required this.uid, this.axis = ShipAxis.vertical});

  @override
  final ShipType type;
  @override
  final String uid;
  @override
  @JsonKey()
  final ShipAxis axis;

  @override
  String toString() {
    return 'ShipEntity(type: $type, uid: $uid, axis: $axis)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShipEntity &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality().equals(other.axis, axis));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(axis));

  @JsonKey(ignore: true)
  @override
  _$$_ShipEntityCopyWith<_$_ShipEntity> get copyWith =>
      __$$_ShipEntityCopyWithImpl<_$_ShipEntity>(this, _$identity);
}

abstract class _ShipEntity implements ShipEntity {
  const factory _ShipEntity(
      {required final ShipType type,
      required final String uid,
      final ShipAxis axis}) = _$_ShipEntity;

  @override
  ShipType get type;
  @override
  String get uid;
  @override
  ShipAxis get axis;
  @override
  @JsonKey(ignore: true)
  _$$_ShipEntityCopyWith<_$_ShipEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
