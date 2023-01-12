import 'package:flutter/material.dart';

import '../../../../domain/models/control_prop.dart';
import '../../../core/extensions/control_prop_extension.dart';

class ControlPropItem extends StatelessWidget {
  final ControlProp controlProp;
  final void Function() onPressed;
  final OutlinedBorder shape;
  final EdgeInsets padding;
  final bool isSelected;

  const ControlPropItem({
    required this.controlProp,
    required this.onPressed,
    required this.shape,
    required this.padding,
    this.isSelected = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
            isSelected ? Colors.grey[850]! : Colors.transparent),
        padding: MaterialStateProperty.all(padding),
        overlayColor: MaterialStateProperty.all(Colors.white10),
        shape: MaterialStateProperty.all(shape),
      ),
      child: Text(
        controlProp.format(),
        style: TextStyle(
          color: Colors.white,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w300,
        ),
      ),
    );
  }
}
