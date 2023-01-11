import 'package:flutter/material.dart';

class LiveViewPlayer extends StatelessWidget {
  final Widget? overlay;
  const LiveViewPlayer({this.overlay, super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: overlay != null
          ? Stack(
              children: [
                const Placeholder(),
                overlay!,
              ],
            )
          : const Placeholder(),
    );
  }
}
