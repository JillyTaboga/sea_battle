import 'dart:math';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'game.freezed.dart';

@freezed
class GameConfig with _$GameConfig {
  const GameConfig._();
  const factory GameConfig({
    required GameGrid grid,
  }) = _GameConfig;
}

@freezed
class GameGrid with _$GameGrid {
  const GameGrid._();
  const factory GameGrid({
    required int width,
    required int height,
    required Size size,
  }) = _GameGrid;

  List<GameCell> cells() {
    List<GameCell> cells = [];
    for (int row = 0; row < height; row++) {
      for (int column = 0; column < width; column++) {
        cells.add(
          GameCell(
            cell: Cell(
              row: row,
              column: column,
            ),
            size: cellSize,
          ),
        );
      }
    }
    return cells;
  }

  Size get cellSize {
    final widthSize = size.width / width;
    final heightSize = size.height / height;
    final realSize = widthSize > heightSize ? heightSize : widthSize;
    return Size(realSize, realSize);
  }
}

@freezed
class GameCell with _$GameCell {
  const GameCell._();
  const factory GameCell({
    required Cell cell,
    required Size size,
  }) = _GameCell;
}

@freezed
class Cell with _$Cell {
  const Cell._();
  const factory Cell({
    required int row,
    required int column,
  }) = _Cell;

  bool get valid {
    return row >= 0 && row <= 9 && column >= 0 && column <= 9;
  }

  String get toStringPretty {
    return '${numberToLetter[row]}:${column + 1}';
  }

  Cell randomNeighbor() {
    final random = Random();
    final possibility = {0: -1, 1: 0, 2: 1};
    var possibleCell = Cell(
      row: row + (possibility[random.nextInt(3)] ?? 0),
      column: column + (possibility[random.nextInt(3)] ?? 0),
    );
    while (!possibleCell.valid || this == possibleCell) {
      possibleCell = Cell(
        row: row + (possibility[random.nextInt(3)] ?? 0),
        column: column + (possibility[random.nextInt(3)] ?? 0),
      );
    }
    return possibleCell;
  }
}

Cell randomCell() {
  final random = Random();
  return Cell(
    row: random.nextInt(10),
    column: random.nextInt(10),
  );
}

const Map<int, String> numberToLetter = {
  0: 'A',
  1: 'B',
  2: 'C',
  3: 'D',
  4: 'E',
  5: 'F',
  6: 'G',
  7: 'H',
  8: 'I',
  9: 'J',
  10: 'K',
  11: 'L',
};
