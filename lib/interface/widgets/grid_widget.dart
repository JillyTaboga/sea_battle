import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sea_battle/domain/entities/game.dart';
import 'package:sea_battle/domain/entities/ship.dart';
import 'package:sea_battle/interface/screens/game_screen/game_controller.dart';
import 'package:sea_battle/interface/screens/game_screen/hit_test_controller.dart';
import 'package:sea_battle/interface/screens/ship_setup/ship_setup_controller.dart';
import 'package:sea_battle/interface/widgets/basic_cell.dart';
import 'package:sea_battle/interface/widgets/ship_widget.dart';

final _cellHoverProvider = StateProvider.family<Cell?, GridType>((ref, type) {
  return;
});

enum GridType {
  player,
  enemy;
}

class GridWidget extends HookConsumerWidget {
  const GridWidget({
    Key? key,
    required this.game,
    required this.isDeploying,
    required this.shipsInGrid,
    required this.type,
  }) : super(key: key);

  final GameConfig game;
  final bool isDeploying;
  final List<ShipInGrid> shipsInGrid;
  final GridType type;

  @override
  Widget build(BuildContext context, ref) {
    final grid = game.grid;
    final cellHover = ref.watch(_cellHoverProvider(type));
    final cellHoverNotifier = ref.watch(_cellHoverProvider(type).notifier);
    final cellState = ref.watch(cellStateProvider(type));
    final phase = ref.watch(gamePhaseProvider);
    return SizedBox(
      width: double.maxFinite,
      height: double.maxFinite,
      child: Center(
        child: SizedBox(
          width: grid.cellSize.width * grid.width,
          height: grid.cellSize.height * grid.height,
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  grid.width,
                  (column) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        grid.height,
                        (row) {
                          final cell = Cell(
                            row: row,
                            column: column,
                          );
                          return InkWell(
                            onTap: (type == GridType.enemy &&
                                    phase == GamePhase.playerTurn)
                                ? () {
                                    ref
                                        .read(clickCellProvider(GridType.enemy)
                                            .notifier)
                                        .click(cell);
                                  }
                                : null,
                            child: CellStack(
                              grid: grid,
                              cell: cell,
                              cellState: cellState[cell] ?? CellState.clear,
                              isHover: cell == cellHover &&
                                  ((type == GridType.enemy &&
                                          phase == GamePhase.playerTurn) ||
                                      (isDeploying && type == GridType.player)),
                              onEnter: (cell) {
                                cellHoverNotifier.state = cell;
                              },
                              onExit: (cell) {
                                cellHoverNotifier.state = null;
                              },
                              onDragShip: type == GridType.player
                                  ? (ship) {
                                      ref
                                          .read(shipsInPlayProvider.notifier)
                                          .addShip(
                                            ShipInGrid(
                                              ship: ship,
                                              cell: cell,
                                            ),
                                          );
                                    }
                                  : null,
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
              for (final ship in shipsInGrid)
                Positioned(
                  left: (ship.cell.column) * grid.cellSize.width,
                  top: (ship.cell.row -
                          (ship.ship.axis == ShipAxis.vertical
                              ? ship.ship.type.size - 1
                              : 0)) *
                      grid.cellSize.height,
                  child: isDeploying
                      ? InkWell(
                          onDoubleTap: () {
                            ref
                                .read(shipsInPlayProvider.notifier)
                                .rotateShip(ship);
                          },
                          child: Draggable<ShipEntity>(
                            feedback: ShipWidget(
                              ship: ship.ship,
                              cellSize: grid.cellSize,
                            ),
                            data: ship.ship,
                            childWhenDragging: Container(),
                            dragAnchorStrategy: (draggable, context, position) {
                              return Offset(
                                grid.cellSize.width / 2,
                                (grid.cellSize.height *
                                        (ship.ship.axis == ShipAxis.vertical
                                            ? ship.ship.type.size
                                            : 1)) -
                                    20,
                              );
                            },
                            child: ShipWidget(
                              ship: ship.ship,
                              cellSize: grid.cellSize,
                              cells: ship.cells(),
                            ),
                          ),
                        )
                      : (type == GridType.player ||
                              phase == GamePhase.won ||
                              phase == GamePhase.lost)
                          ? IgnorePointer(
                              child: ShipWidget(
                                ship: ship.ship,
                                cellSize: grid.cellSize,
                                cells: ship.cells(),
                              ),
                            )
                          : Container(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class CellStack extends StatelessWidget {
  const CellStack({
    Key? key,
    required this.grid,
    required this.cell,
    required this.isHover,
    this.onDragShip,
    required this.onEnter,
    required this.onExit,
    required this.cellState,
  }) : super(key: key);

  final GameGrid grid;
  final Cell cell;
  final bool isHover;
  final void Function(Cell cell) onEnter;
  final void Function(Cell cell) onExit;
  final void Function(ShipEntity ship)? onDragShip;
  final CellState cellState;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BasicCell(
          cellSize: grid.cellSize,
          cell: cell,
          dragging: false,
          isHover: isHover,
        ),
        DragTarget<ShipEntity>(
          onAccept: onDragShip,
          builder: (context, candidateData, rejectedData) {
            return BasicCell(
              cellSize: grid.cellSize,
              cell: cell,
              dragging: candidateData.isNotEmpty,
              isHover: false,
              onEnter: (cell) {
                if (!isHover) {
                  onEnter(cell);
                }
              },
              onExit: (cell) {
                if (isHover) {
                  onExit(cell);
                }
              },
            );
          },
        ),
        if (cellState == CellState.water)
          Container(
            width: grid.cellSize.width,
            height: grid.cellSize.height,
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.2),
              border: Border.all(color: Colors.blue),
              shape: BoxShape.circle,
            ),
          ),
        if (cellState == CellState.hit)
          Container(
            width: grid.cellSize.width,
            height: grid.cellSize.height,
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.2),
              border: Border.all(color: Colors.blue),
              shape: BoxShape.circle,
            ),
          ),
      ],
    );
  }
}
