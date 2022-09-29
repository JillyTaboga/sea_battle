import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sea_battle/domain/entities/game.dart';
import 'package:sea_battle/interface/screens/game_screen/enemy_controller.dart';
import 'package:sea_battle/interface/screens/game_screen/hit_test_controller.dart';
import 'package:sea_battle/interface/screens/ship_setup/ship_setup_controller.dart';
import 'package:sea_battle/interface/widgets/grid_widget.dart';

final gameProvider = StateProvider.family<GameConfig, Size>((ref, size) {
  return GameConfig(
    grid: GameGrid(
      width: 10,
      height: 10,
      size: size,
    ),
  );
});

final gamePhaseProvider =
    StateNotifierProvider.autoDispose<GamePhaseNotifier, GamePhase>((ref) {
  return GamePhaseNotifier(ref);
});

class GamePhaseNotifier extends StateNotifier<GamePhase> {
  GamePhaseNotifier(this.ref) : super(GamePhase.deploy);

  final Ref ref;

  advancePhase() async {
    final enemyLastHit = ref.read(lastEnemyHitProvider) == CellState.hit;
    final playerLastHit = ref.read(lastPlayerHitProvider) == CellState.hit;
    final playerShipsRemain =
        ref.read(shipsCellRemainProvider(GridType.player));
    final enemyShipsRemain = ref.read(shipsCellRemainProvider(GridType.enemy));
    switch (state) {
      case GamePhase.deploy:
        state = GamePhase.ready;
        break;
      case GamePhase.ready:
        state = GamePhase.playerTurn;
        break;
      case GamePhase.playerTurn:
        if (enemyShipsRemain <= 0) {
          state = GamePhase.won;
          break;
        }
        if (playerLastHit) {
          state = GamePhase.playerTurn;
          break;
        }
        state = GamePhase.otherTurn;
        await _enemyClick();
        break;
      case GamePhase.otherTurn:
        if (playerShipsRemain <= 0) {
          state = GamePhase.lost;
          break;
        }
        if (enemyLastHit) {
          await _enemyClick();
        } else {
          state = GamePhase.playerTurn;
        }
        break;
      default:
    }
  }

  _enemyClick() async {
    await Future.delayed(const Duration(milliseconds: 800));
    final brain = EnemyClickBrain(ref);
    ref.read(clickCellProvider(GridType.player).notifier).click(brain.click());
  }
}

final shipsCellRemainProvider =
    Provider.autoDispose.family<int, GridType>((ref, type) {
  final ships = type == GridType.enemy
      ? ref.watch(enemyShipsProvider)
      : ref.watch(shipsInPlayProvider);
  final shipCells = ships.fold(
      [], (previousValue, element) => [...previousValue, ...element.cells()]);
  final totalShipsCells = shipCells.length;
  final stateCells = ref.watch(cellStateProvider(type));
  final cellStatesList = stateCells.values.map((e) => e).toList();
  final hittedCells =
      cellStatesList.where((element) => element == CellState.hit).toList();
  return totalShipsCells - hittedCells.length;
});

enum GamePhase {
  deploy,
  ready,
  playerTurn,
  otherTurn,
  lost,
  won,
}
