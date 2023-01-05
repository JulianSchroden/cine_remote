import 'package:flutter/material.dart';

class LoadingOverlayLayout extends StatelessWidget {
  final Color backgroundColor;
  final bool showOverlay;
  final String overlayMessage;
  final Widget child;

  const LoadingOverlayLayout({
    required this.backgroundColor,
    required this.showOverlay,
    required this.overlayMessage,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (showOverlay)
          Container(
            color: backgroundColor,
            child: SafeArea(
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      overlayMessage,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(width: 16),
                    const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
