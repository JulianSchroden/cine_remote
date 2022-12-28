import 'package:flutter/material.dart';

import '../../../../domain/models/control_prop.dart';
import 'control_prop_value_picker.dart';

class ControlPropItem extends StatelessWidget {
  final ControlProp controlProp;
  final String Function(String value) formatValue;
  final void Function(String value) onValueChanged;

  const ControlPropItem({
    required this.controlProp,
    required this.formatValue,
    required this.onValueChanged,
    super.key,
  });

  void showValuePickerModal(BuildContext context) async {
    final updatedValue = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      backgroundColor: Colors.grey[800],
      builder: (context) => DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.5,
        minChildSize: 0.3,
        maxChildSize: 0.75,
        builder: (context, scrollController) => ControlPropValuePicker(
          controlProp: controlProp,
          controller: scrollController,
        ),
      ),
    );
    if (updatedValue != null) {
      onValueChanged(updatedValue);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showValuePickerModal(context);
      },
      child: Text(
        formatValue(controlProp.currentValue),
      ),
    );
  }
}
