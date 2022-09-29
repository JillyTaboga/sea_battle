import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sea_battle/domain/entities/game.dart';
import 'package:sea_battle/domain/entities/ship.dart';
import 'package:sea_battle/interface/screens/game_screen/game_controller.dart';
import 'package:uuid/uuid.dart';

final deployTimeProvider =
    StateNotifierProvider.autoDispose<DeployTimeNotifier, int>((ref) {
  return DeployTimeNotifier(ref);
});

class DeployTimeNotifier extends StateNotifier<int> {
  DeployTimeNotifier(this.ref) : super(60) {
    start();
  }
  final Ref ref;

  Timer timer = Timer.periodic(const Duration(seconds: 1), (timer) {});

  start() {
    timer = Timer.periodic(const Duration(seconds: 1), (ticker) {
      if (state > 0) {
        state--;
      } else {
        ticker.cancel();
        ref.read(avaibleShipsProvider.notifier).ramdomPlace();
        ref.read(gamePhaseProvider.notifier).advancePhase();
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}

final shipsInPlayProvider =
    StateNotifierProvider.autoDispose<ShipsInPlayNotifier, List<ShipInGrid>>(
        (ref) {
  return ShipsInPlayNotifier(ref);
});

class ShipsInPlayNotifier extends StateNotifier<List<ShipInGrid>> {
  ShipsInPlayNotifier(this.ref) : super([]);

  final Ref ref;

  addShip(ShipInGrid ship) {
    if (_checkPossibility(ship)) {
      var ships = [...state];
      ships.removeWhere((element) => element.ship.uid == ship.ship.uid);
      ships.add(ship);
      state = ships;
      ref.read(avaibleShipsProvider.notifier).removeShip(ship.ship);
    }
  }

  removeShip(ShipInGrid ship) {
    var ships = [...state];
    ships.removeWhere((element) => element.ship.uid == ship.ship.uid);
    ref.read(avaibleShipsProvider.notifier).addShip(ship.ship);
    state = ships;
  }

  rotateShip(ShipInGrid ship) {
    final newShip = ship.changeAxis();
    if (_checkPossibility(newShip)) {
      var ships = [...state];
      ships.removeWhere((element) => element.ship.uid == newShip.ship.uid);
      ships.add(newShip);
      state = ships;
    }
  }

  List<Cell> occupiedCells() {
    List<Cell> cells = [];
    for (final ship in state) {
      cells.addAll(ship.cells());
    }
    return cells;
  }

  bool _checkPossibility(ShipInGrid ship) {
    final cells = ship.cells();
    var valid = true;
    for (final cell in cells) {
      if (!cell.valid) {
        valid = false;
      }
    }
    final shipsToCheck = [...state];
    shipsToCheck.removeWhere((element) => element.ship.uid == ship.ship.uid);
    if (valid) {
      for (final currentShip in shipsToCheck) {
        if (currentShip.cells().any(
              (element) => cells.contains(element),
            )) {
          valid = false;
        }
      }
    }
    return valid;
  }
}

final avaibleShipListProvider = Provider.autoDispose<List<ShipEntity>>((ref) {
  final ships = ref.watch(avaibleShipsProvider);
  ships.sort((a, b) => b.type.size.compareTo(a.type.size));
  return ships;
});

final avaibleShipsProvider =
    StateNotifierProvider.autoDispose<ShipsAvaibleNotifier, List<ShipEntity>>(
        (ref) {
  return ShipsAvaibleNotifier(ref);
});

class ShipsAvaibleNotifier extends StateNotifier<List<ShipEntity>> {
  ShipsAvaibleNotifier(this.ref)
      : super([
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
        ]);

  final Ref ref;

  removeShip(ShipEntity ship) {
    var ships = [...state];
    ships.remove(ship);
    state = ships;
  }

  addShip(ShipEntity ship) {
    final newShip = ShipEntity(type: ship.type, uid: ship.uid);
    state = [...state, newShip];
  }

  ramdomPlace() {
    for (final avaibleShip in state) {
      var possibleShip = randomShipInGrid(avaibleShip);
      while (!ref
          .read(shipsInPlayProvider.notifier)
          ._checkPossibility(possibleShip)) {
        possibleShip = randomShipInGrid(avaibleShip);
      }
      ref.read(shipsInPlayProvider.notifier).addShip(possibleShip);
    }
    state = [];
  }
}
