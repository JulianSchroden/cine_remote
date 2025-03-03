import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/live_view_cubit.dart';

class LiveViewControlOverlay extends StatelessWidget {
  final LiveViewStatus liveViewStatus;
  final bool isLoading;

  const LiveViewControlOverlay({
    required this.liveViewStatus,
    required this.isLoading,
    super.key,
  });

  static const double buttonSize = 96;

  @override
  Widget build(BuildContext context) {
    final showStartButton = liveViewStatus == LiveViewStatus.paused ||
        liveViewStatus == LiveViewStatus.loading;
    final ignoreStartButtonPress = liveViewStatus != LiveViewStatus.paused;

    return AnimatedOpacity(
      opacity: showStartButton ? 1.0 : 0,
      duration: const Duration(milliseconds: 200),
      child: Center(
        child: IgnorePointer(
          ignoring: ignoreStartButtonPress,
          child: MaterialButton(
            onPressed: () => context.read<LiveViewCubit>().toggleLiveView(),
            color: Colors.white.withValues(alpha: 0.5),
            shape: const CircleBorder(),
            child: Stack(
              children: [
                if (isLoading)
                  const SizedBox(
                    width: buttonSize,
                    height: buttonSize,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  ),
                const SizedBox(
                  width: buttonSize,
                  height: buttonSize,
                  child: Icon(
                    Icons.play_arrow_outlined,
                    color: Colors.white,
                    size: 48,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
