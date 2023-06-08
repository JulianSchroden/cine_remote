import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/live_view_cubit.dart';

class LiveViewControlOverlay extends StatelessWidget {
  final bool isLiveViewActive;
  final bool isLoading;

  const LiveViewControlOverlay({
    required this.isLiveViewActive,
    required this.isLoading,
    super.key,
  });

  static const double buttonSize = 96;

  @override
  Widget build(BuildContext context) {
    final isVisible = !isLiveViewActive;
    final ignoreStartButtonPress = isLiveViewActive;

    return AnimatedOpacity(
      opacity: isVisible ? 1.0 : 0,
      duration: const Duration(milliseconds: 200),
      child: Center(
        child: IgnorePointer(
          ignoring: ignoreStartButtonPress,
          child: MaterialButton(
            onPressed: () => context.read<LiveViewCubit>().toggleLiveView(),
            color: Colors.white.withOpacity(0.5),
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
                SizedBox(
                  width: buttonSize,
                  height: buttonSize,
                  child: Icon(
                    isLiveViewActive ? Icons.pause : Icons.play_arrow_outlined,
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
