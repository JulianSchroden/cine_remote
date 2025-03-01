import 'dart:math' as math;

import 'package:camera_control_dart/camera_control_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/props_control_cubit.dart';

class ControlPropValuePickerGrid extends StatefulWidget {
  final ControlProp controlProp;
  final double maxWidth;
  final double maxHeight;

  const ControlPropValuePickerGrid({
    required this.controlProp,
    required this.maxWidth,
    required this.maxHeight,
    super.key,
  });

  @override
  State<ControlPropValuePickerGrid> createState() =>
      _ControlPropValuePickerGridState();
}

class _ControlPropValuePickerGridState
    extends State<ControlPropValuePickerGrid> {
  late final ScrollController _scrollController;
  static const maxCrossAxisExtent = 80.0;
  static const crossAxisSpacing = 16.0;
  static const mainAxisSpacing = 16.0;
  static const padding = EdgeInsets.all(16);

  double calculateInitialScrollOffset() {
    // Offset calculation based on [SliverGridDelegateWithMaxCrossAxisExtent] getLayout.

    final (:cellSize, :cellsPerRow) = layoutGridCells();

    final itemIndex = widget.controlProp.allowedValues
        .indexWhere((value) => value == widget.controlProp.currentValue);
    final itemRowIndex = (itemIndex / cellsPerRow).floor();

    final rowHeightWithSpacing = cellSize + 2 * mainAxisSpacing;
    final centerOffset = (widget.maxHeight - rowHeightWithSpacing) / 2;
    final rowCount =
        (widget.controlProp.allowedValues.length / cellsPerRow).ceil();
    final scrollableContentHeight = (rowCount * cellSize) +
        ((rowCount - 1) * mainAxisSpacing) +
        padding.vertical;
    final maxScrollOffset =
        math.max(0.0, scrollableContentHeight - widget.maxHeight);
    final scrollOffset =
        (itemRowIndex * (cellSize + mainAxisSpacing) - centerOffset)
            .clamp(0.0, maxScrollOffset);

    return scrollOffset;
  }

  ({double cellSize, int cellsPerRow}) layoutGridCells() {
    final crossAxisExtend = widget.maxWidth - padding.horizontal;
    final crossAxisCount =
        (crossAxisExtend / (maxCrossAxisExtent + crossAxisSpacing)).ceil();
    final usableCrossAxisExtent = math.max(
      0.0,
      crossAxisExtend - (crossAxisSpacing * (crossAxisCount - 1)),
    );
    final childCrossAxisExtent = usableCrossAxisExtent / crossAxisCount;
    return (cellSize: childCrossAxisExtent, cellsPerRow: crossAxisCount);
  }

  @override
  void initState() {
    _scrollController =
        ScrollController(initialScrollOffset: calculateInitialScrollOffset());
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ControlPropValuePickerGrid oldWidget) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (oldWidget.controlProp.type != widget.controlProp.type) {
        _scrollController.jumpTo(calculateInitialScrollOffset());
      }
    });

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: maxCrossAxisExtent,
        mainAxisSpacing: mainAxisSpacing,
        crossAxisSpacing: crossAxisSpacing,
      ),
      padding: padding,
      controller: _scrollController,
      children: [
        ...widget.controlProp.allowedValues.map(
          (value) {
            final isCurrentValue = value == widget.controlProp.currentValue;

            return TextButton(
              onPressed: widget.controlProp.isPending
                  ? null
                  : () {
                      context
                          .read<PropsControlCubit>()
                          .setProp(widget.controlProp.type, value);
                    },
              style: ButtonStyle(
                shape: WidgetStateProperty.all<OutlinedBorder>(
                  const CircleBorder(),
                ),
                side: WidgetStateProperty.all(
                  isCurrentValue
                      ? BorderSide(
                          width: 4,
                          color: widget.controlProp.isPending
                              ? Colors.grey
                              : Colors.green)
                      : null,
                ),
                backgroundColor:
                    WidgetStateProperty.all<Color>(Colors.grey[700]!),
              ),
              child: Text(
                value.value,
                style: TextStyle(
                  color: isCurrentValue ? Colors.white : Colors.grey[300],
                  fontWeight:
                      isCurrentValue ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
