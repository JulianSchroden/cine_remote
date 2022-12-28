import 'package:flutter/material.dart';

class LiveViewImage extends StatelessWidget {
  const LiveViewImage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AspectRatio(aspectRatio: 16 / 9, child: Placeholder());
  }
}
