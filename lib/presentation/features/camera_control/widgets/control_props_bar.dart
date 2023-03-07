import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../camera_control/interface/models/control_prop_type.dart';
import '../../../core/extensions/control_prop_extension.dart';
import '../bloc/props_control_cubit.dart';
import 'control_prop_item.dart';

class ControlPropsBar extends StatelessWidget {
  final Orientation orientation;
  final ControlPropType? selectedType;
  final void Function(ControlPropType propType) onPropSelected;
  final EdgeInsets padding;
  final ControlPropItemStyle itemStyle;

  const ControlPropsBar({
    required this.orientation,
    required this.selectedType,
    required this.onPropSelected,
    required this.padding,
    required this.itemStyle,
    super.key,
  });

  const ControlPropsBar.portrait({
    required this.selectedType,
    required this.onPropSelected,
    super.key,
  })  : orientation = Orientation.portrait,
        padding = const EdgeInsets.symmetric(horizontal: 16),
        itemStyle = const ControlPropItemStyle.circular();

  const ControlPropsBar.landscape({
    required this.selectedType,
    required this.onPropSelected,
    super.key,
  })  : orientation = Orientation.landscape,
        padding = const EdgeInsets.all(0),
        itemStyle = const ControlPropItemStyle.square();

  Widget _buildContainer(
      {required BuildContext context, required List<Widget> children}) {
    if (orientation == Orientation.portrait) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: children,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PropsControlCubit, PropsControlState>(
      builder: (context, state) => Padding(
        padding: padding,
        child: _buildContainer(
          context: context,
          children: [
            ...state.controlProps.map(
              (controlProp) => Expanded(
                child: ControlPropItem(
                  data: controlProp.format(),
                  onPressed: () {
                    onPropSelected(controlProp.type);
                  },
                  style: itemStyle,
                  isSelected: selectedType == controlProp.type,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
