import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sea_battle/interface/screens/game_screen/enemy_controller.dart';
import 'package:sea_battle/interface/screens/game_screen/game_controller.dart';
import 'package:sea_battle/interface/screens/ship_setup/ship_grid_setup.dart';
import 'package:sea_battle/interface/screens/start_menu/start_menu_screen.dart';
import 'package:sea_battle/interface/widgets/grid_widget.dart';

enum Screen {
  largeWidht,
  largeHeight,
  small,
}

class GameScreen extends HookConsumerWidget {
  const GameScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phase = ref.watch(gamePhaseProvider);
    final playerShipsLast = ref.watch(shipsCellRemainProvider(GridType.player));
    final enemyShipsLast = ref.watch(shipsCellRemainProvider(GridType.enemy));

    ref.listen(gamePhaseProvider, (previous, next) {
      if ((next == GamePhase.ready ||
              next == GamePhase.won ||
              next == GamePhase.lost) &&
          previous != next) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return PhaseDialog(
                  phase: next,
                );
              });
        });
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            if (phase != GamePhase.deploy)
              Expanded(
                child: Column(
                  children: [
                    const Text(
                      'Inimigos:',
                      style: TextStyle(fontSize: 11),
                    ),
                    Text(enemyShipsLast.toString()),
                  ],
                ),
              ),
            const Text('Batalha naval'),
            if (phase != GamePhase.deploy)
              Expanded(
                child: Column(
                  children: [
                    const Text(
                      'Jogador:',
                      style: TextStyle(fontSize: 11),
                    ),
                    Text(playerShipsLast.toString()),
                  ],
                ),
              ),
          ],
        ),
        centerTitle: true,
      ),
      body: LayoutBuilder(builder: (context, constaints) {
        final size = constaints.maxWidth >= 800
            ? Screen.largeWidht
            : constaints.maxHeight >= 800
                ? Screen.largeHeight
                : Screen.small;
        switch (size) {
          case Screen.largeWidht:
            return const LargeWidht();
          case Screen.largeHeight:
            return const LargeHeight();
          case Screen.small:
            return const SmallScreen();
        }
      }),
    );
  }
}

class LargeWidht extends HookConsumerWidget {
  const LargeWidht({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phase = ref.watch(gamePhaseProvider);
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color:
                    (phase == GamePhase.playerTurn) ? Colors.blue : Colors.grey,
                width: 10,
              ),
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final game = ref.watch(
                  gameProvider(
                    Size(
                      constraints.maxWidth,
                      constraints.maxHeight,
                    ),
                  ),
                );
                return GridWidget(
                  game: game,
                  isDeploying: false,
                  shipsInGrid: ref.watch(enemyShipsProvider),
                  type: GridType.enemy,
                );
              },
            ),
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color:
                    (phase == GamePhase.deploy || phase == GamePhase.otherTurn)
                        ? Colors.blue
                        : Colors.grey,
                width: 10,
              ),
            ),
            child: const ShipSetupGrid(),
          ),
        ),
      ],
    );
  }
}

class LargeHeight extends HookConsumerWidget {
  const LargeHeight({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phase = ref.watch(gamePhaseProvider);
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color:
                    (phase == GamePhase.playerTurn) ? Colors.blue : Colors.grey,
                width: 10,
              ),
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final game = ref.watch(
                  gameProvider(
                    Size(
                      constraints.maxWidth,
                      constraints.maxHeight,
                    ),
                  ),
                );
                return GridWidget(
                  game: game,
                  isDeploying: false,
                  shipsInGrid: ref.watch(enemyShipsProvider),
                  type: GridType.enemy,
                );
              },
            ),
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color:
                    (phase == GamePhase.deploy || phase == GamePhase.otherTurn)
                        ? Colors.blue
                        : Colors.grey,
                width: 10,
              ),
            ),
            child: const ShipSetupGrid(),
          ),
        ),
      ],
    );
  }
}

final _currentPageProvider = StateProvider<int>((ref) {
  return 1;
});

class SmallScreen extends HookConsumerWidget {
  const SmallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = usePageController(initialPage: 1);
    changePage(int page) {
      pageController.animateToPage(
        page,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeIn,
      );
    }

    ref.listen(gamePhaseProvider, (oldPhase, newPhase) {
      if (newPhase != oldPhase) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          if (newPhase == GamePhase.playerTurn) {
            changePage(0);
          }
          if (newPhase == GamePhase.otherTurn) {
            changePage(1);
          }
        });
      }
    });

    final currentPage = ref.watch(_currentPageProvider);
    return Column(
      children: [
        Expanded(
          child: PageView(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (value) {
              ref.read(_currentPageProvider.notifier).state = value;
            },
            children: [
              LayoutBuilder(
                builder: (context, constraints) {
                  final game = ref.watch(
                    gameProvider(
                      Size(
                        constraints.maxWidth,
                        constraints.maxHeight,
                      ),
                    ),
                  );
                  return GridWidget(
                    game: game,
                    isDeploying: false,
                    shipsInGrid: ref.watch(enemyShipsProvider),
                    type: GridType.enemy,
                  );
                },
              ),
              const ShipSetupGrid(),
            ],
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  changePage(0);
                },
                child: Container(
                  height: 60,
                  width: double.maxFinite,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: currentPage == 0 ? Colors.blue : Colors.white,
                    boxShadow: currentPage == 0 ? null : kElevationToShadow[3],
                  ),
                  child: Text(
                    'Inimigo',
                    style: TextStyle(
                      color: currentPage == 0 ? Colors.white : Colors.blue,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  changePage(1);
                },
                child: Container(
                  height: 60,
                  width: double.maxFinite,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: currentPage == 1 ? Colors.blue : Colors.white,
                    boxShadow: currentPage == 1 ? null : kElevationToShadow[3],
                  ),
                  child: Text(
                    'Jogador',
                    style: TextStyle(
                      color: currentPage == 1 ? Colors.white : Colors.blue,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class PhaseDialog extends HookConsumerWidget {
  const PhaseDialog({
    Key? key,
    required this.phase,
  }) : super(key: key);

  final GamePhase phase;

  @override
  Widget build(BuildContext context, ref) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              phase == GamePhase.ready
                  ? 'Tudo pronto?'
                  : phase == GamePhase.lost
                      ? 'Você perdeu'
                      : 'Você ganhou',
              style: const TextStyle(fontSize: 22, color: Colors.blue),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                if (phase == GamePhase.ready) {
                  Navigator.pop(context);
                  ref.read(gamePhaseProvider.notifier).advancePhase();
                } else {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const StartMenu(),
                      ),
                      (route) => false);
                }
              },
              child: Text(
                phase == GamePhase.ready ? 'Jogar!' : 'Voltar',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
