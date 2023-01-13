import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/live_view_cubit.dart';

class LiveViewPlayerOverlay extends StatefulWidget {
  final bool isLiveViewActive;
  final Duration autoHideDuration;

  const LiveViewPlayerOverlay({
    required this.isLiveViewActive,
    this.autoHideDuration = const Duration(seconds: 2),
    super.key,
  });

  @override
  State<LiveViewPlayerOverlay> createState() => _LiveViewPlayerOverlayState();
}

class _LiveViewPlayerOverlayState extends State<LiveViewPlayerOverlay> {
  Timer? overlayTimer;
  bool isVisible = true;

  void showPlayerOverlay() => setState(() => isVisible = true);
  void hidePlayerOverlay() => setState(() => isVisible = false);

  @override
  void initState() {
    isVisible = !widget.isLiveViewActive;
    super.initState();
  }

  @override
  void dispose() {
    overlayTimer?.cancel();
    super.dispose();
  }

  void handleOverlayTap() {
    if (isVisible) {
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

  Future<void> toggleLiveView(bool isLiveViewActive) async {
    context.read<LiveViewCubit>().toggleLiveView();
    overlayTimer?.cancel();

    if (isLiveViewActive) {
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
    return AnimatedOpacity(
      opacity: isVisible ? 1.0 : 0,
      duration: const Duration(milliseconds: 200),
      child: InkWell(
        onTap: widget.isLiveViewActive ? handleOverlayTap : null,
        child: Center(
          child: IgnorePointer(
            ignoring: !isVisible,
            child: MaterialButton(
              onPressed: () => toggleLiveView(widget.isLiveViewActive),
              color: Colors.white.withOpacity(0.5),
              shape: const CircleBorder(),
              child: SizedBox(
                width: 96,
                height: 96,
                child: Icon(
                  widget.isLiveViewActive
                      ? Icons.pause
                      : Icons.play_arrow_outlined,
                  color: Colors.white,
                  size: 48,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
