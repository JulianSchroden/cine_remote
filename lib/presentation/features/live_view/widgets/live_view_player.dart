import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/live_view_cubit.dart';
import 'live_view_player_overlay.dart';

class LiveViewPlayer extends StatelessWidget {
  final List<Widget> children;
  const LiveViewPlayer({required this.children, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LiveViewCubit, LiveViewState>(
      builder: (context, state) => AspectRatio(
        aspectRatio: 16 / 9,
        child: Stack(
          children: [
            if (state.imageBytes != null)
              Image.memory(
                state.imageBytes!,
                gaplessPlayback: true,
              ),
            LiveViewPlayerOverlay(isLiveViewActive: state.isLiveViewActive),
            ...children,
          ],
        ),
      ),
    );
  }
}
