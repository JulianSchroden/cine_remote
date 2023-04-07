import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/live_view_cubit.dart';

class LiveViewPlayerOverlay extends StatefulWidget {
  final Duration autoHideDuration;

  const LiveViewPlayerOverlay({
    this.autoHideDuration = const Duration(seconds: 2),
    super.key,
  });

  @override
  State<LiveViewPlayerOverlay> createState() => _LiveViewPlayerOverlayState();
}

class _LiveViewPlayerOverlayState extends State<LiveViewPlayerOverlay> {
  static const double buttonSize = 96;

  Timer? overlayTimer;
  bool isTemporarayVisible = false;

  void showPlayerOverlay() => setState(() => isTemporarayVisible = true);
  void hidePlayerOverlay() => setState(() => isTemporarayVisible = false);

  @override
  void dispose() {
    overlayTimer?.cancel();
    super.dispose();
  }

  void handleOverlayTap() {
    if (isTemporarayVisible) {
      hidePlayerOverlay();
      return;
    }

    showPlayerOverlay();
    overlayTimer?.cancel();
    overlayTimer = Timer.periodic(widget.autoHideDuration, (timer) {
      hidePlayerOverlay();
      timer.cancel();
    });
  }

  Future<void> toggleLiveView(bool wasLiveViewActive) async {
    context.read<LiveViewCubit>().toggleLiveView();
    overlayTimer?.cancel();

    if (wasLiveViewActive) {
      showPlayerOverlay();
    } else {
      overlayTimer = Timer.periodic(widget.autoHideDuration, (timer) {
        hidePlayerOverlay();
        timer.cancel();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LiveViewCubit, LiveViewState>(builder: (context, state) {
      final isVisible = !state.isLiveViewActive || isTemporarayVisible;
      final ignorePlayButtonPresss =
          state.isLiveViewActive && !isTemporarayVisible;

      return AnimatedOpacity(
        opacity: isVisible ? 1.0 : 0,
        duration: const Duration(milliseconds: 200),
        child: InkWell(
          onTap: () {
            if (state.isLiveViewActive) {
              handleOverlayTap();
            }
          },
          child: Center(
            child: IgnorePointer(
              ignoring: ignorePlayButtonPresss,
              child: MaterialButton(
                onPressed: () => toggleLiveView(state.isLiveViewActive),
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
      );
    });
  }
}
