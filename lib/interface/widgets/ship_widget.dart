import 'package:flutter/material.dart';
import 'package:sea_battle/domain/entities/game.dart';
import 'package:sea_battle/domain/entities/ship.dart';

class ShipWidget extends StatelessWidget {
  const ShipWidget({
    Key? key,
    required this.ship,
    required this.cellSize,
    this.cells = const [],
  }) : super(key: key);

  final ShipEntity ship;
  final Size cellSize;
  final List<Cell> cells;

  @override
  Widget build(BuildContext context) {
    final rotate = ship.axis == ShipAxis.horizontal;
    return Container(
      width: rotate ? cellSize.width * ship.type.size : cellSize.width,
      height: rotate ? cellSize.height : cellSize.height * ship.type.size,
      decoration: BoxDecoration(
        color: Colors.grey.shade300.withOpacity(0.5),
        border: Border.all(
          color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      // child: rotate
      //     ? Row(
      //         children: cells
      //             .map(
      //               (e) => Expanded(
      //                 child: Center(child: Text(e.toStringPretty)),
      //               ),
      //             )
      //             .toList(),
      //       )
      //     : Column(
      //         children: cells
      //             .map(
      //               (e) => Expanded(
      //                 child: Center(child: Text(e.toStringPretty)),
      //               ),
      //             )
      //             .toList(),
      //       ),
    );
  }
}
