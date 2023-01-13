import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/models/control_prop.dart';
import '../bloc/props_control_cubit.dart';

class ControlPropValuePickerGrid extends StatelessWidget {
  final ControlProp controlProp;
  final double maxWidth;

  const ControlPropValuePickerGrid({
    required this.controlProp,
    required this.maxWidth,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 80,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      padding: const EdgeInsets.all(16),
      children: [
        ...controlProp.allowedValues.map(
          (value) {
            final isCurrentValue = value == controlProp.currentValue;

            return TextButton(
              onPressed: controlProp.isPending
                  ? null
                  : () {
                      context
                          .read<PropsControlCubit>()
                          .setProp(controlProp.type, value);
                    },
              style: ButtonStyle(
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  const CircleBorder(),
                ),
                side: MaterialStateProperty.all(
                  isCurrentValue
                      ? BorderSide(
                          width: 4,
                          color: controlProp.isPending
                              ? Colors.grey
                              : Colors.green)
                      : null,
                ),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.grey[700]!),
              ),
              child: Text(
                value,
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
