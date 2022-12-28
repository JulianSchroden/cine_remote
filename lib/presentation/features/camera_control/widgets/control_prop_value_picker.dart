import 'package:flutter/material.dart';

import '../../../../domain/models/control_prop.dart';

class ControlPropValuePicker extends StatelessWidget {
  final ScrollController controller;
  final ControlProp controlProp;

  const ControlPropValuePicker({
    required this.controller,
    required this.controlProp,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: kToolbarHeight),
          child: GridView(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 100,
            ),
            controller: controller,
            clipBehavior: Clip.none,
            children: [
              ...controlProp.allowedValues.map(
                (value) {
                  final isCurrentValue = value == controlProp.currentValue;
                  return Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(value);
                      },
                      child: Text(
                        value,
                        style: TextStyle(
                          color:
                              isCurrentValue ? Colors.white : Colors.grey[300],
                          decoration: isCurrentValue
                              ? TextDecoration.underline
                              : TextDecoration.none,
                          fontWeight: isCurrentValue
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
        SizedBox(
          height: kToolbarHeight,
          child: AppBar(
            elevation: 1,
            leading: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => Navigator.of(context).pop(),
            ),
            backgroundColor: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}
