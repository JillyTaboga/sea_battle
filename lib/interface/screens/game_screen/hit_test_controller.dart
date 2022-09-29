import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sea_battle/domain/entities/game.dart';
import 'package:sea_battle/domain/entities/ship.dart';
import 'package:sea_battle/interface/screens/game_screen/enemy_controller.dart';
import 'package:sea_battle/interface/screens/game_screen/game_controller.dart';
import 'package:sea_battle/interface/screens/ship_setup/ship_setup_controller.dart';
import 'package:sea_battle/interface/widgets/grid_widget.dart';

final lastPlayerHitProvider = StateProvider<CellState>((ref) {
  return CellState.clear;
});

final cellStateProvider =
    Provider.autoDispose.family<Map<Cell, CellState>, GridType>((ref, type) {
  List<Cell> cells = [];
  for (int row = 0; row < 10; row++) {
    for (int column = 0; column < 10; column++) {
      cells.add(Cell(row: row, column: column));
    }
  }
  final ships = type == GridType.enemy
      ? ref.watch(enemyShipsProvider)
      : ref.watch(shipsInPlayProvider);

  final shipCells = ships.fold(
      [], (previousValue, element) => [...previousValue, ...element.cells()]);

  final shots = ref.watch(clickCellProvider(type));

  Map<Cell, CellState> map = {};
  for (final cell in cells) {
    if (shots.contains(cell)) {
      if (shipCells.contains(cell)) {
        map[cell] = CellState.hit;
      } else {
        map[cell] = CellState.water;
      }
    } else {
      map[cell] = CellState.clear;
    }
  }
  return map;
});

enum CellState {
  water,
  clear,
  hit,
}

final clickCellProvider = StateNotifierProvider.family
    .autoDispose<ClickedCellNotifier, List<Cell>, GridType>((ref, type) {
  final ships = type == GridType.enemy
      ? ref.watch(enemyShipsProvider)
      : ref.watch(shipsInPlayProvider);

  return ClickedCellNotifier(ref, ships, type);
});

class ClickedCellNotifier extends StateNotifier<List<Cell>> {
  ClickedCellNotifier(
    this.ref,
    this.ships,
    this.type,
  ) : super([]);

  final GridType type;
  final Ref ref;
  final List<ShipInGrid> ships;

  click(Cell cell) {
    if (!state.contains(cell)) {
      state = [...state, cell];
      final shipsCells = ships.fold([],
          (previousValue, element) => [...previousValue, ...element.cells()]);
      if (!shipsCells.contains(cell)) {
        if (type == GridType.enemy) {
          ref.read(lastPlayerHitProvider.notifier).state = CellState.water;
          ref.read(gamePhaseProvider.notifier).advancePhase();
        } else {
          ref.read(lastEnemyHitProvider.notifier).state = CellState.water;
          ref.read(gamePhaseProvider.notifier).advancePhase();
        }
      } else {
        if (type == GridType.player) {
          ref.read(lastEnemyHitProvider.notifier).state = CellState.hit;
          ref.read(gamePhaseProvider.notifier).advancePhase();
        } else {
          ref.read(lastPlayerHitProvider.notifier).state = CellState.hit;
          ref.read(gamePhaseProvider.notifier).advancePhase();
        }
      }
    }
  }
}
