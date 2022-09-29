import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sea_battle/domain/entities/ship.dart';
import 'package:sea_battle/interface/screens/game_screen/game_controller.dart';
import 'package:sea_battle/interface/screens/ship_setup/ship_setup_controller.dart';
import 'package:sea_battle/interface/widgets/grid_widget.dart';
import 'package:sea_battle/interface/widgets/ship_widget.dart';

class ShipSetupGrid extends HookConsumerWidget {
  const ShipSetupGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final currentPhase = ref.watch(gamePhaseProvider);
        final double barWidth = constraints.maxWidth / 3;
        final game = ref.watch(
          gameProvider(
            Size(
              constraints.maxWidth -
                  (currentPhase == GamePhase.deploy ? barWidth : 0),
              constraints.maxHeight,
            ),
          ),
        );
        final avaibleShips = ref.watch(avaibleShipListProvider);
        final time = ref.watch(deployTimeProvider);
        return Row(
          children: [
            if (currentPhase == GamePhase.deploy)
              Container(
                height: double.maxFinite,
                width: barWidth,
                color: Colors.blue,
                child: Column(
                  children: [
                    const Text(
                      'Tempo para posicionamento',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      time.toString(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Center(
                        child: SingleChildScrollView(
                          child: avaibleShips.isEmpty
                              ? Center(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      foregroundColor: Colors.blue,
                                    ),
                                    onPressed: () {
                                      ref
                                          .read(gamePhaseProvider.notifier)
                                          .advancePhase();
                                    },
                                    child: const Text('Iniciar'),
                                  ),
                                )
                              : Wrap(
                                  alignment: WrapAlignment.center,
                                  spacing: 8,
                                  runSpacing: 25,
                                  children: avaibleShips.map((ship) {
                                    return DraggableShip(
                                      cellSize: game.grid.cellSize,
                                      ship: ship,
                                      smallChild: true,
                                    );
                                  }).toList(),
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    const Text(
                      'Clique duplo para girar o navio',
                      style: TextStyle(
                        fontSize: 9,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            Expanded(
              child: GridWidget(
                game: game,
                shipsInGrid: ref.watch(shipsInPlayProvider),
                isDeploying: ref.watch(gamePhaseProvider) == GamePhase.deploy,
                type: GridType.player,
              ),
            ),
          ],
        );
      },
    );
  }
}

class DraggableShip extends HookConsumerWidget {
  const DraggableShip({
    Key? key,
    required this.ship,
    required this.cellSize,
    this.smallChild = false,
  }) : super(key: key);

  final ShipEntity ship;
  final Size cellSize;
  final bool smallChild;

  @override
  Widget build(BuildContext context, ref) {
    return Draggable<ShipEntity>(
      feedback: ShipWidget(
        cellSize: cellSize,
        ship: ship,
      ),
      data: ship,
      dragAnchorStrategy: (draggable, context, position) {
        return Offset(
          cellSize.width / 2,
          (cellSize.height * ship.type.size) - 20,
        );
      },
      childWhenDragging: Container(),
      child: ShipWidget(
        cellSize: smallChild ? const Size.square(45) : cellSize,
        ship: ship,
      ),
    );
  }
}
