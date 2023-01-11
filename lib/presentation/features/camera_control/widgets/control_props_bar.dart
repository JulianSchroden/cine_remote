import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/models/control_prop_type.dart';
import '../bloc/props_control_cubit.dart';
import 'control_prop_item.dart';

class ControlPropsBar extends StatelessWidget {
  final Orientation orientation;
  final ControlPropType? selectedType;
  final void Function(ControlPropType propType) onPropSelected;

  factory ControlPropsBar.portrait({
    required ControlPropType? selectedType,
    required void Function(ControlPropType propType) onPropSelected,
  }) =>
      ControlPropsBar(
        orientation: Orientation.portrait,
        selectedType: selectedType,
        onPropSelected: onPropSelected,
      );

  factory ControlPropsBar.landscape({
    required ControlPropType? selectedType,
    required void Function(ControlPropType propType) onPropSelected,
  }) =>
      ControlPropsBar(
        orientation: Orientation.landscape,
        selectedType: selectedType,
        onPropSelected: onPropSelected,
      );

  const ControlPropsBar({
    required this.orientation,
    required this.selectedType,
    required this.onPropSelected,
    super.key,
  });

  Widget _buildContainer(
      {required BuildContext context, required List<Widget> children}) {
    if (orientation == Orientation.portrait) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      );
    }

    return Column(
      children: children,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PropsControlCubit, PropsControlState>(
        builder: (context, state) {
      final controlProps = state.controlProps;

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: _buildContainer(
          context: context,
          children: [
            ...controlProps.map(
              (controlProp) => Expanded(
                child: ControlPropItem(
                  controlProp: controlProp,
                  onPressed: () {
                    onPropSelected(controlProp.type);
                  },
                  isSelected: selectedType == controlProp.type,
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
