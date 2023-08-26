import 'package:camera_control_dart/camera_control_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/props_control_cubit.dart';
import 'control_prop_value_picker_grid.dart';
import 'control_prop_value_picker_list.dart';

class ControlPropValuePicker extends StatelessWidget {
  final ControlPropType propType;
  final Widget Function(BuildContext context, BoxConstraints constraints,
      ControlProp controlProp) builder;

  const ControlPropValuePicker({
    required this.propType,
    required this.builder,
    super.key,
  });

  factory ControlPropValuePicker.grid({required ControlPropType propType}) =>
      ControlPropValuePicker(
        propType: propType,
        builder: (context, constraints, controlProp) =>
            ControlPropValuePickerGrid(
          maxWidth: constraints.maxWidth,
          controlProp: controlProp,
        ),
      );

  factory ControlPropValuePicker.list({required ControlPropType propType}) =>
      ControlPropValuePicker(
        propType: propType,
        builder: (context, constraints, controlProp) =>
            ControlPropValuePickerList(
          controlProp: controlProp,
          maxHeight: constraints.maxHeight,
        ),
      );

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<PropsControlCubit, PropsControlState>(
          builder: (context, state) => LayoutBuilder(
              builder: (context, constraints) =>
                  builder(context, constraints, state.getProp(propType))));
}
