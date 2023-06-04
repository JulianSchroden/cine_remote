import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../camera_control/interface/models/properties/autofocus_position.dart';
import '../bloc/live_view_cubit.dart';

class LiveViewPlayerOverlay extends StatelessWidget {
  final Duration autoHideDuration;

  const LiveViewPlayerOverlay({
    this.autoHideDuration = const Duration(seconds: 2),
    super.key,
  });

  static const double buttonSize = 96;

  void handleTapToAutofocus(
    BuildContext context,
    Size widgetSize,
    Offset touchPosition,
  ) {
    final normalizedPosition = AutofocusPosition(
      x: touchPosition.dx / widgetSize.width,
      y: touchPosition.dy / widgetSize.height,
    );

    print(normalizedPosition);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LiveViewCubit, LiveViewState>(builder: (context, state) {
      final isVisible = !state.isLiveViewActive;
      final ignoreStartButtonPress = state.isLiveViewActive;

      return LayoutBuilder(
        builder: (context, constraints) => AnimatedOpacity(
          opacity: isVisible ? 1.0 : 0,
          duration: const Duration(milliseconds: 200),
          child: InkWell(
            onTapDown: (details) => handleTapToAutofocus(
              context,
              Size(
                constraints.maxWidth,
                constraints.maxHeight,
              ),
              details.localPosition,
            ),
            child: Center(
              child: IgnorePointer(
                ignoring: ignoreStartButtonPress,
                child: MaterialButton(
                  onPressed: () =>
                      context.read<LiveViewCubit>().toggleLiveView(),
                  color: Colors.white.withOpacity(0.5),
                  shape: const CircleBorder(),
                  child: Stack(
                    children: [
                      if (state.isLoading)
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
                          state.isLiveViewActive
                              ? Icons.pause
                              : Icons.play_arrow_outlined,
                          color: Colors.white,
                          size: 48,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
