// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'game.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GameConfig {
  GameGrid get grid => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GameConfigCopyWith<GameConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameConfigCopyWith<$Res> {
  factory $GameConfigCopyWith(
          GameConfig value, $Res Function(GameConfig) then) =
      _$GameConfigCopyWithImpl<$Res>;
  $Res call({GameGrid grid});

  $GameGridCopyWith<$Res> get grid;
}

/// @nodoc
class _$GameConfigCopyWithImpl<$Res> implements $GameConfigCopyWith<$Res> {
  _$GameConfigCopyWithImpl(this._value, this._then);

  final GameConfig _value;
  // ignore: unused_field
  final $Res Function(GameConfig) _then;

  @override
  $Res call({
    Object? grid = freezed,
  }) {
    return _then(_value.copyWith(
      grid: grid == freezed
          ? _value.grid
          : grid // ignore: cast_nullable_to_non_nullable
              as GameGrid,
    ));
  }

  @override
  $GameGridCopyWith<$Res> get grid {
    return $GameGridCopyWith<$Res>(_value.grid, (value) {
      return _then(_value.copyWith(grid: value));
    });
  }
}

/// @nodoc
abstract class _$$_GameConfigCopyWith<$Res>
    implements $GameConfigCopyWith<$Res> {
  factory _$$_GameConfigCopyWith(
          _$_GameConfig value, $Res Function(_$_GameConfig) then) =
      __$$_GameConfigCopyWithImpl<$Res>;
  @override
  $Res call({GameGrid grid});

  @override
  $GameGridCopyWith<$Res> get grid;
}

/// @nodoc
class __$$_GameConfigCopyWithImpl<$Res> extends _$GameConfigCopyWithImpl<$Res>
    implements _$$_GameConfigCopyWith<$Res> {
  __$$_GameConfigCopyWithImpl(
      _$_GameConfig _value, $Res Function(_$_GameConfig) _then)
      : super(_value, (v) => _then(v as _$_GameConfig));

  @override
  _$_GameConfig get _value => super._value as _$_GameConfig;

  @override
  $Res call({
    Object? grid = freezed,
  }) {
    return _then(_$_GameConfig(
      grid: grid == freezed
          ? _value.grid
          : grid // ignore: cast_nullable_to_non_nullable
              as GameGrid,
    ));
  }
}

/// @nodoc

class _$_GameConfig extends _GameConfig {
  const _$_GameConfig({required this.grid}) : super._();

  @override
  final GameGrid grid;

  @override
  String toString() {
    return 'GameConfig(grid: $grid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GameConfig &&
            const DeepCollectionEquality().equals(other.grid, grid));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(grid));

  @JsonKey(ignore: true)
  @override
  _$$_GameConfigCopyWith<_$_GameConfig> get copyWith =>
      __$$_GameConfigCopyWithImpl<_$_GameConfig>(this, _$identity);
}

abstract class _GameConfig extends GameConfig {
  const factory _GameConfig({required final GameGrid grid}) = _$_GameConfig;
  const _GameConfig._() : super._();

  @override
  GameGrid get grid;
  @override
  @JsonKey(ignore: true)
  _$$_GameConfigCopyWith<_$_GameConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GameGrid {
  int get width => throw _privateConstructorUsedError;
  int get height => throw _privateConstructorUsedError;
  Size get size => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GameGridCopyWith<GameGrid> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameGridCopyWith<$Res> {
  factory $GameGridCopyWith(GameGrid value, $Res Function(GameGrid) then) =
      _$GameGridCopyWithImpl<$Res>;
  $Res call({int width, int height, Size size});
}

/// @nodoc
class _$GameGridCopyWithImpl<$Res> implements $GameGridCopyWith<$Res> {
  _$GameGridCopyWithImpl(this._value, this._then);

  final GameGrid _value;
  // ignore: unused_field
  final $Res Function(GameGrid) _then;

  @override
  $Res call({
    Object? width = freezed,
    Object? height = freezed,
    Object? size = freezed,
  }) {
    return _then(_value.copyWith(
      width: width == freezed
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as Size,
    ));
  }
}

/// @nodoc
abstract class _$$_GameGridCopyWith<$Res> implements $GameGridCopyWith<$Res> {
  factory _$$_GameGridCopyWith(
          _$_GameGrid value, $Res Function(_$_GameGrid) then) =
      __$$_GameGridCopyWithImpl<$Res>;
  @override
  $Res call({int width, int height, Size size});
}

/// @nodoc
class __$$_GameGridCopyWithImpl<$Res> extends _$GameGridCopyWithImpl<$Res>
    implements _$$_GameGridCopyWith<$Res> {
  __$$_GameGridCopyWithImpl(
      _$_GameGrid _value, $Res Function(_$_GameGrid) _then)
      : super(_value, (v) => _then(v as _$_GameGrid));

  @override
  _$_GameGrid get _value => super._value as _$_GameGrid;

  @override
  $Res call({
    Object? width = freezed,
    Object? height = freezed,
    Object? size = freezed,
  }) {
    return _then(_$_GameGrid(
      width: width == freezed
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as Size,
    ));
  }
}

/// @nodoc

class _$_GameGrid extends _GameGrid {
  const _$_GameGrid(
      {required this.width, required this.height, required this.size})
      : super._();

  @override
  final int width;
  @override
  final int height;
  @override
  final Size size;

  @override
  String toString() {
    return 'GameGrid(width: $width, height: $height, size: $size)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GameGrid &&
            const DeepCollectionEquality().equals(other.width, width) &&
            const DeepCollectionEquality().equals(other.height, height) &&
            const DeepCollectionEquality().equals(other.size, size));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(width),
      const DeepCollectionEquality().hash(height),
      const DeepCollectionEquality().hash(size));

  @JsonKey(ignore: true)
  @override
  _$$_GameGridCopyWith<_$_GameGrid> get copyWith =>
      __$$_GameGridCopyWithImpl<_$_GameGrid>(this, _$identity);
}

abstract class _GameGrid extends GameGrid {
  const factory _GameGrid(
      {required final int width,
      required final int height,
      required final Size size}) = _$_GameGrid;
  const _GameGrid._() : super._();

  @override
  int get width;
  @override
  int get height;
  @override
  Size get size;
  @override
  @JsonKey(ignore: true)
  _$$_GameGridCopyWith<_$_GameGrid> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GameCell {
  Cell get cell => throw _privateConstructorUsedError;
  Size get size => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GameCellCopyWith<GameCell> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameCellCopyWith<$Res> {
  factory $GameCellCopyWith(GameCell value, $Res Function(GameCell) then) =
      _$GameCellCopyWithImpl<$Res>;
  $Res call({Cell cell, Size size});

  $CellCopyWith<$Res> get cell;
}

/// @nodoc
class _$GameCellCopyWithImpl<$Res> implements $GameCellCopyWith<$Res> {
  _$GameCellCopyWithImpl(this._value, this._then);

  final GameCell _value;
  // ignore: unused_field
  final $Res Function(GameCell) _then;

  @override
  $Res call({
    Object? cell = freezed,
    Object? size = freezed,
  }) {
    return _then(_value.copyWith(
      cell: cell == freezed
          ? _value.cell
          : cell // ignore: cast_nullable_to_non_nullable
              as Cell,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as Size,
    ));
  }

  @override
  $CellCopyWith<$Res> get cell {
    return $CellCopyWith<$Res>(_value.cell, (value) {
      return _then(_value.copyWith(cell: value));
    });
  }
}

/// @nodoc
abstract class _$$_GameCellCopyWith<$Res> implements $GameCellCopyWith<$Res> {
  factory _$$_GameCellCopyWith(
          _$_GameCell value, $Res Function(_$_GameCell) then) =
      __$$_GameCellCopyWithImpl<$Res>;
  @override
  $Res call({Cell cell, Size size});

  @override
  $CellCopyWith<$Res> get cell;
}

/// @nodoc
class __$$_GameCellCopyWithImpl<$Res> extends _$GameCellCopyWithImpl<$Res>
    implements _$$_GameCellCopyWith<$Res> {
  __$$_GameCellCopyWithImpl(
      _$_GameCell _value, $Res Function(_$_GameCell) _then)
      : super(_value, (v) => _then(v as _$_GameCell));

  @override
  _$_GameCell get _value => super._value as _$_GameCell;

  @override
  $Res call({
    Object? cell = freezed,
    Object? size = freezed,
  }) {
    return _then(_$_GameCell(
      cell: cell == freezed
          ? _value.cell
          : cell // ignore: cast_nullable_to_non_nullable
              as Cell,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as Size,
    ));
  }
}

/// @nodoc

class _$_GameCell extends _GameCell {
  const _$_GameCell({required this.cell, required this.size}) : super._();

  @override
  final Cell cell;
  @override
  final Size size;

  @override
  String toString() {
    return 'GameCell(cell: $cell, size: $size)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GameCell &&
            const DeepCollectionEquality().equals(other.cell, cell) &&
            const DeepCollectionEquality().equals(other.size, size));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(cell),
      const DeepCollectionEquality().hash(size));

  @JsonKey(ignore: true)
  @override
  _$$_GameCellCopyWith<_$_GameCell> get copyWith =>
      __$$_GameCellCopyWithImpl<_$_GameCell>(this, _$identity);
}

abstract class _GameCell extends GameCell {
  const factory _GameCell(
      {required final Cell cell, required final Size size}) = _$_GameCell;
  const _GameCell._() : super._();

  @override
  Cell get cell;
  @override
  Size get size;
  @override
  @JsonKey(ignore: true)
  _$$_GameCellCopyWith<_$_GameCell> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Cell {
  int get row => throw _privateConstructorUsedError;
  int get column => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CellCopyWith<Cell> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CellCopyWith<$Res> {
  factory $CellCopyWith(Cell value, $Res Function(Cell) then) =
      _$CellCopyWithImpl<$Res>;
  $Res call({int row, int column});
}

/// @nodoc
class _$CellCopyWithImpl<$Res> implements $CellCopyWith<$Res> {
  _$CellCopyWithImpl(this._value, this._then);

  final Cell _value;
  // ignore: unused_field
  final $Res Function(Cell) _then;

  @override
  $Res call({
    Object? row = freezed,
    Object? column = freezed,
  }) {
    return _then(_value.copyWith(
      row: row == freezed
          ? _value.row
          : row // ignore: cast_nullable_to_non_nullable
              as int,
      column: column == freezed
          ? _value.column
          : column // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_CellCopyWith<$Res> implements $CellCopyWith<$Res> {
  factory _$$_CellCopyWith(_$_Cell value, $Res Function(_$_Cell) then) =
      __$$_CellCopyWithImpl<$Res>;
  @override
  $Res call({int row, int column});
}

/// @nodoc
class __$$_CellCopyWithImpl<$Res> extends _$CellCopyWithImpl<$Res>
    implements _$$_CellCopyWith<$Res> {
  __$$_CellCopyWithImpl(_$_Cell _value, $Res Function(_$_Cell) _then)
      : super(_value, (v) => _then(v as _$_Cell));

  @override
  _$_Cell get _value => super._value as _$_Cell;

  @override
  $Res call({
    Object? row = freezed,
    Object? column = freezed,
  }) {
    return _then(_$_Cell(
      row: row == freezed
          ? _value.row
          : row // ignore: cast_nullable_to_non_nullable
              as int,
      column: column == freezed
          ? _value.column
          : column // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Cell extends _Cell {
  const _$_Cell({required this.row, required this.column}) : super._();

  @override
  final int row;
  @override
  final int column;

  @override
  String toString() {
    return 'Cell(row: $row, column: $column)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Cell &&
            const DeepCollectionEquality().equals(other.row, row) &&
            const DeepCollectionEquality().equals(other.column, column));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(row),
      const DeepCollectionEquality().hash(column));

  @JsonKey(ignore: true)
  @override
  _$$_CellCopyWith<_$_Cell> get copyWith =>
      __$$_CellCopyWithImpl<_$_Cell>(this, _$identity);
}

abstract class _Cell extends Cell {
  const factory _Cell({required final int row, required final int column}) =
      _$_Cell;
  const _Cell._() : super._();

  @override
  int get row;
  @override
  int get column;
  @override
  @JsonKey(ignore: true)
  _$$_CellCopyWith<_$_Cell> get copyWith => throw _privateConstructorUsedError;
}
