import 'control_prop_value_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/models/control_prop.dart';
import '../../../../domain/models/control_prop_type.dart';
import '../../camera_connection/bloc/camera_connection_cubit.dart';
import '../bloc/props_control_cubit.dart';
import 'control_prop_item.dart';

class ControlPropsBar extends StatefulWidget {
  const ControlPropsBar({super.key});

  @override
  State<ControlPropsBar> createState() => _ControlPropsBarState();
}

class _ControlPropsBarState extends State<ControlPropsBar> {
  ControlPropType? _selectedType;

  Widget _buildPropItems(BuildContext context, List<ControlProp> controlProps) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...controlProps.map(
                (controlProp) => Expanded(
                  child: ControlPropItem(
                    controlProp: controlProp,
                    onPressed: () {
                      setState(() {
                        if (_selectedType == controlProp.type) {
                          _selectedType = null;
                        } else {
                          _selectedType = controlProp.type;
                        }
                      });
                    },
                    isSelected: _selectedType == controlProp.type,
                  ),
                ),
              )
            ],
          ),
        ),
        if (_selectedType != null)
          Expanded(
            child: Container(
              color: Colors.grey[850],
              child: Column(
                children: [
                  ControlPropValuePicker(
                    controlProp: controlProps
                        .firstWhere((prop) => prop.type == _selectedType),
                    onValuePicked: (type, value) =>
                        context.read<PropsControlCubit>().setProp(type, value),
                  ),
                ],
              ),
            ),
          )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PropsControlCubit(
        cameraConnectionCubit: context.read<CameraConnectionCubit>(),
      )..init(),
      child: BlocBuilder<PropsControlCubit, PropsControlState>(
        builder: (context, state) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: state.maybeWhen(
            updating: (props) => _buildPropItems(context, props),
            updateSuccess: (props) => _buildPropItems(context, props),
            updateFailed: (props) => _buildPropItems(context, props),
            orElse: () => Container(),
          ),
        ),
      ),
    );
  }
}
