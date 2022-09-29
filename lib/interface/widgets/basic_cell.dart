import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sea_battle/domain/entities/game.dart';

class BasicCell extends HookConsumerWidget {
  const BasicCell({
    Key? key,
    required this.cellSize,
    required this.cell,
    required this.dragging,
    required this.isHover,
    this.onEnter,
    this.onExit,
  }) : super(key: key);

  final Size cellSize;
  final Cell cell;
  final bool dragging;
  final bool isHover;
  final void Function(Cell cell)? onEnter;
  final void Function(Cell cell)? onExit;

  @override
  Widget build(BuildContext context, ref) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: cellSize.width,
      height: cellSize.height,
      decoration: BoxDecoration(
        color: dragging
            ? Colors.amber.withOpacity(0.2)
            : isHover
                ? Colors.blueAccent.shade200.withOpacity(0.5)
                : Colors.blue.shade50.withOpacity(0.2),
        border: Border.all(
          color: Colors.blue.withOpacity(0.2),
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(2),
      ),
      child: MouseRegion(
        onEnter: (event) {
          onEnter?.call(cell);
        },
        onExit: (event) {
          onExit?.call(cell);
        },
        child: SizedBox.expand(
          child: Center(
            child: Text(
              cell.toStringPretty,
              style: const TextStyle(
                fontSize: 10,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
