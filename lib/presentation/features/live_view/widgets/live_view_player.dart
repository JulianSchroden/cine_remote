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
          aspectRatio: state.aspectRatio,
          child: Stack(
            children: [
              if (state.isLiveViewSupported && state.imageBytes != null)
                Image.memory(
                  state.imageBytes!,
                  gaplessPlayback: true,
                ),
              state.isLiveViewSupported
                  ? LiveViewPlayerOverlay(
                      supportsTouchAutofocus: state.supportsTouchAutofocus)
                  : const Center(
                      child: Text(
                        'LiveView not supported :(',
                        style: TextStyle(
                            color: Color.fromARGB(255, 137, 137, 137)),
                        textAlign: TextAlign.center,
                      ),
                    ),
              ...children,
            ],
          )),
    );
  }
}
