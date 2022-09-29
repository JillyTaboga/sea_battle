import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sea_battle/domain/entities/game.dart';
import 'package:sea_battle/domain/entities/ship.dart';
import 'package:sea_battle/interface/screens/game_screen/hit_test_controller.dart';
import 'package:sea_battle/interface/widgets/grid_widget.dart';
import 'package:uuid/uuid.dart';

final lastEnemyHitProvider = StateProvider<CellState>((ref) {
  return CellState.clear;
});

final lastEnemyClickProvider = StateProvider<Cell?>((ref) {
  return;
});

class EnemyClickBrain {
  EnemyClickBrain(this.ref);

  final Ref ref;

  Cell click() {
    final alreadyClickedsCells = ref.read(clickCellProvider(GridType.player));
    final lastHit = ref.read(lastEnemyHitProvider);
    final lastCell = ref.read(lastEnemyClickProvider);
    Cell possibleNewHit = randomCell();
    if (lastHit == CellState.hit) {
      possibleNewHit = lastCell!.randomNeighbor();
      int tries = 0;
      while (alreadyClickedsCells.contains(possibleNewHit)) {
        if (tries > 8) {
          possibleNewHit = randomCell();
        } else {
          possibleNewHit = lastCell.randomNeighbor();
        }
        tries++;
      }
    } else {
      while (alreadyClickedsCells.contains(possibleNewHit)) {
        possibleNewHit = randomCell();
      }
    }
    ref.read(lastEnemyClickProvider.notifier).state = possibleNewHit;
    return possibleNewHit;
  }
}

final enemyShipsProvider = Provider.autoDispose<List<ShipInGrid>>((ref) {
  final startShips = [
    ShipEntity(type: ShipType.airport, uid: const Uuid().v4()),
    ShipEntity(type: ShipType.tank, uid: const Uuid().v4()),
    ShipEntity(type: ShipType.tank, uid: const Uuid().v4()),
    ShipEntity(type: ShipType.torped, uid: const Uuid().v4()),
    ShipEntity(type: ShipType.torped, uid: const Uuid().v4()),
    ShipEntity(type: ShipType.torped, uid: const Uuid().v4()),
    ShipEntity(type: ShipType.submarine, uid: const Uuid().v4()),
    ShipEntity(type: ShipType.submarine, uid: const Uuid().v4()),
    ShipEntity(type: ShipType.submarine, uid: const Uuid().v4()),
    ShipEntity(type: ShipType.submarine, uid: const Uuid().v4()),
  ];

  List<Cell> occupiedCells = [];

  bool checkOccupied(ShipInGrid ship) {
    bool valid = true;
    final shipCells = ship.cells();
    for (final shipCell in shipCells) {
      if (!shipCell.valid) {
        valid = false;
      }
    }
    if (valid) {
      for (final shipCell in shipCells) {
        if (occupiedCells.contains(shipCell)) {
          valid = false;
        }
      }
    }
    return valid;
  }

  List<ShipInGrid> shipsInGrid = [];

  for (final avaibleShip in startShips) {
    var newShip = randomShipInGrid(avaibleShip);
    while (!checkOccupied(newShip)) {
      newShip = randomShipInGrid(avaibleShip);
    }
    shipsInGrid.add(newShip);
    occupiedCells.addAll(newShip.cells());
  }

  return shipsInGrid;
});
