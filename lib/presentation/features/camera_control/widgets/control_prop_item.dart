import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/models/control_prop.dart';
import '../../../../domain/models/control_prop_type.dart';
import '../../../core/extensions/control_prop_extension.dart';
import '../bloc/control_prop_cubit.dart';
import 'control_prop_value_picker.dart';

class ControlPropItem extends StatelessWidget {
  final ControlPropType controlPropType;

  ControlPropItem({
    required this.controlPropType,
    super.key,
  });

  void showValuePickerModal(
      BuildContext context, ControlProp controlProp) async {
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
      await context.read<ControlPropCubit>().setProp(updatedValue);
    }
  }

  Widget buildContent(BuildContext context, ControlProp controlProp) {
    return TextButton(
      onPressed: () {
        showValuePickerModal(context, controlProp);
      },
      child: Text(
        controlProp.format(),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ControlPropCubit()..init(controlPropType),
      child: BlocBuilder<ControlPropCubit, ControlPropState>(
        builder: (context, state) => state.maybeWhen(
          updating: (prop) => buildContent(context, prop),
          updateFailed: (prop) => buildContent(context, prop),
          updateSuccess: (prop) => buildContent(context, prop),
          orElse: () => Container(),
        ),
      ),
    );
  }
}
