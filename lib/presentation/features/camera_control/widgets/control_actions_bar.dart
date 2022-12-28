import 'package:flutter/material.dart';

class ControlActionsBar extends StatelessWidget {
  const ControlActionsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: const CircleBorder(),
      color: Colors.green,
      onPressed: () {},
      child: const SizedBox(
        width: 72,
        height: 72,
      ),
    );
  }
}
