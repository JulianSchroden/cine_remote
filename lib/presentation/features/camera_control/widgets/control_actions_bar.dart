import 'package:flutter/material.dart';

import 'record_button.dart';

class ControlActionsBar extends StatelessWidget {
  const ControlActionsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        //Expanded(å
        //  child: Center(
        //    child: TextButton(
        //      onPressed: () =>
        //          context.read<ActionsControlCubit>().toggleAfLock(),
        //      child: Padding(
        //        padding: const EdgeInsets.all(8.0),
        //        child: Text(
        //          'AF-Lock',
        //          style: TextStyle(
        //            color: Colors.white,
        //            decoration: state.actionsState.isAfLocked
        //                ? TextDecoration.none
        //                : TextDecoration.lineThrough,
        //          ),
        //        ),
        //      ),
        //    ),
        //  ),
        //),

        Spacer(),
        Expanded(child: RecordButton()),
        Spacer(),
      ],
    );
  }
}
