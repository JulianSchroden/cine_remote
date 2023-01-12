import 'package:flutter/material.dart';

class LiveViewPlayer extends StatelessWidget {
  final List<Widget>? children;
  const LiveViewPlayer({this.children, super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: children != null
          ? Stack(
              children: [
                const Placeholder(),
                ...children!,
              ],
            )
          : const Placeholder(),
    );
  }
}
