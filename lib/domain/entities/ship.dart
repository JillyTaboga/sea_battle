import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sea_battle/domain/entities/game.dart';

part 'ship.freezed.dart';

@freezed
class ShipInGrid with _$ShipInGrid {
  const ShipInGrid._();
  const factory ShipInGrid({
    required ShipEntity ship,
    required Cell cell,
  }) = _ShipInGrid;

  ShipInGrid changeAxis() {
    final newAxis = ship.axis == ShipAxis.horizontal
        ? ShipAxis.vertical
        : ShipAxis.horizontal;
    final newShip = ShipInGrid(
      ship: ship.copyWith(axis: newAxis),
      cell: cell,
    );
    return newShip;
  }

  List<Cell> cells() {
    List<Cell> cells = [];
    for (int n = 0; n < ship.type.size; n++) {
      switch (ship.axis) {
        case ShipAxis.vertical:
          cells.add(
            Cell(
              row: cell.row - n,
              column: cell.column,
            ),
          );
          break;
        case ShipAxis.horizontal:
          cells.add(
            Cell(
              row: cell.row,
              column: cell.column + n,
            ),
          );
          break;
      }
    }
    cells.sort((a, b) => a.row.compareTo(b.row));
    cells.sort((a, b) => a.column.compareTo(b.column));
    return cells;
  }
}

ShipInGrid randomShipInGrid(ShipEntity ship) {
  final random = Random();
  final axis = ShipAxis.values[random.nextInt(2)];
  final newShip = ship.copyWith(axis: axis);
  return ShipInGrid(ship: newShip, cell: randomCell());
}

@freezed
class ShipEntity with _$ShipEntity {
  const factory ShipEntity({
    required ShipType type,
    required String uid,
    @Default(ShipAxis.vertical) ShipAxis axis,
  }) = _ShipEntity;
}

enum ShipType {
  airport(5),
  tank(4),
  torped(3),
  submarine(2);

  final int size;
  const ShipType(this.size);
}

enum ShipAxis {
  vertical,
  horizontal,
}
