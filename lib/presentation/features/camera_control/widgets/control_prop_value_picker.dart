import 'package:flutter/material.dart';

import '../../../../domain/models/control_prop.dart';
import '../../../../domain/models/control_prop_type.dart';

class ControlPropValuePicker extends StatelessWidget {
  final ControlProp controlProp;
  final void Function(ControlPropType type, String value) onValuePicked;

  const ControlPropValuePicker({
    required this.controlProp,
    required this.onValuePicked,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView(
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
              final isUpdatePending = controlProp.isPending;

              return TextButton(
                onPressed: isUpdatePending
                    ? null
                    : () {
                        onValuePicked(controlProp.type, value);
                      },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    const CircleBorder(),
                  ),
                  side: MaterialStateProperty.all(
                    isCurrentValue
                        ? BorderSide(
                            width: 4,
                            color: isUpdatePending ? Colors.grey : Colors.green)
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
      ),
    );
  }
}
