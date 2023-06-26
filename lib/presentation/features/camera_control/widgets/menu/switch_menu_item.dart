import 'package:flutter/material.dart';

class SwitchMenuItem extends StatelessWidget {
  final bool value;
  final Function(bool) onChanged;
  final String title;

  const SwitchMenuItem({
    required this.value,
    required this.onChanged,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!value),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            const SizedBox(width: 8),
            Switch(
              value: value,
              onChanged: (_) => onChanged(!value),
            )
          ],
        ),
      ),
    );
  }
}
