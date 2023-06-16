import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../camera_control/interface/models/properties/autofocus_position.dart';
import '../../../../camera_control/interface/models/touch_autofocus_state.dart';
import '../bloc/live_view_cubit.dart';

class LiveViewAutofocusOverlay extends StatelessWidget {
  final TouchAutofocusState? autofocusState;

  const LiveViewAutofocusOverlay({
    required this.autofocusState,
    super.key,
  });

  void handleTapToAutofocus(
    BuildContext context,
    Size widgetSize,
    Offset touchPosition,
  ) {
    final normalizedPosition = AutofocusPosition(
      x: touchPosition.dx / widgetSize.width,
      y: touchPosition.dy / widgetSize.height,
    );

    context.read<LiveViewCubit>().setTouchAutofocus(normalizedPosition);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final widgetSize = Size(
          constraints.maxWidth,
          constraints.maxHeight,
        );

        final focusRect = autofocusState?.toOverlayRect(widgetSize);

        return Stack(
          children: [
            InkWell(
              onTapDown: (details) => handleTapToAutofocus(
                context,
                widgetSize,
                details.localPosition,
              ),
            ),
            if (focusRect != null)
              Positioned(
                top: focusRect.position.dy,
                left: focusRect.position.dx,
                child: Container(
                  width: focusRect.size.width,
                  height: focusRect.size.height,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 3,
                    ),
                  ),
                ),
              )
          ],
        );
      },
    );
  }
}

class AutofocusOverlayRect {
  final Offset position;
  final Size size;

  AutofocusOverlayRect(this.position, this.size);

  @override
  String toString() {
    return "AutofocusOverlayRect(position: $position, size: $size)";
  }
}

extension TouchAutofocusStateToOverlayRect on TouchAutofocusState {
  AutofocusOverlayRect toOverlayRect(Size widgetSize) {
    return AutofocusOverlayRect(
      Offset(
        position.x * widgetSize.width,
        position.y * widgetSize.height,
      ),
      Size(
        width * widgetSize.width,
        height * widgetSize.height,
      ),
    );
  }
}
