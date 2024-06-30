import 'package:flutter/material.dart';

class ControlPropItemStyle {
  final EdgeInsets padding;
  final OutlinedBorder shape;

  const ControlPropItemStyle({
    required this.padding,
    required this.shape,
  });

  const ControlPropItemStyle.circular()
      : padding = const EdgeInsets.symmetric(vertical: 16),
        shape = const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        );

  const ControlPropItemStyle.square()
      : padding = const EdgeInsets.all(8),
        shape = const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        );
}

class ControlPropItem extends StatelessWidget {
  final String data;
  final void Function() onPressed;
  final ControlPropItemStyle style;
  final bool isSelected;

  const ControlPropItem({
    required this.data,
    required this.onPressed,
    required this.style,
    this.isSelected = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
            isSelected ? Colors.grey[850]! : Colors.transparent),
        padding: WidgetStateProperty.all(style.padding),
        overlayColor: WidgetStateProperty.all(Colors.white10),
        shape: WidgetStateProperty.all(style.shape),
      ),
      child: Text(
        data,
        style: TextStyle(
          color: Colors.white,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w300,
        ),
      ),
    );
  }
}
