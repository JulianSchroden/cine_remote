import 'dart:math' as math;

import 'package:camera_control_dart/camera_control_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/props_control_cubit.dart';

class ControlPropValuePickerList extends StatefulWidget {
  final ControlProp controlProp;
  final double maxHeight;

  const ControlPropValuePickerList({
    required this.controlProp,
    required this.maxHeight,
    super.key,
  });

  @override
  State<ControlPropValuePickerList> createState() =>
      _ControlPropValuePickerListState();
}

class _ControlPropValuePickerListState
    extends State<ControlPropValuePickerList> {
  static const listItemExtend = 50.0;
  late final ScrollController _listScrollController;

  double calculateInitialScrollOffset() {
    final allowedValues = widget.controlProp.allowedValues;
    final itemIndex = allowedValues
        .indexWhere((value) => value == widget.controlProp.currentValue);
    final centerOffset = (widget.maxHeight - listItemExtend) / 2.0;
    final maxScollOffset =
        math.max(0.0, allowedValues.length * listItemExtend - widget.maxHeight);
    final scrollOffset = ((itemIndex * listItemExtend) - centerOffset)
        .clamp(0.0, maxScollOffset);

    return scrollOffset;
  }

  @override
  void initState() {
    _listScrollController = ScrollController(
      initialScrollOffset: calculateInitialScrollOffset(),
    );
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ControlPropValuePickerList oldWidget) {
    if (oldWidget.controlProp.type != widget.controlProp.type) {
      _listScrollController.jumpTo(calculateInitialScrollOffset());
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _listScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      itemCount: widget.controlProp.allowedValues.length,
      itemExtent: listItemExtend,
      clipBehavior: Clip.none,
      controller: _listScrollController,
      itemBuilder: (context, index) {
        final value = widget.controlProp.allowedValues[index];
        final isCurrentValue = value == widget.controlProp.currentValue;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 3),
          child: TextButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(
                isCurrentValue
                    ? Colors.green
                        .withOpacity(widget.controlProp.isPending ? 0.5 : 1)
                    : Colors.grey[700],
              ),
            ),
            onPressed: widget.controlProp.isPending
                ? null
                : () {
                    context
                        .read<PropsControlCubit>()
                        .setProp(widget.controlProp.type, value);
                  },
            child: Text(
              value.value,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }
}
