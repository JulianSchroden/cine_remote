import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../camera_control/interface/models/properties/autofocus_position.dart';
import '../../../../camera_control/interface/models/touch_autofocus_state.dart';
import '../bloc/live_view_cubit.dart';

class LiveViewAutofocusOverlay extends StatelessWidget {
  final TouchAutofocusState? autofocusState;
  final Size autofocusAreaSize;

  const LiveViewAutofocusOverlay({
    required this.autofocusState,
    this.autofocusAreaSize = const Size(50, 50),
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

        var focusRectPosition = autofocusState != null
            ? _calculateFocusRectPosition(
                autofocusState!.position,
                autofocusAreaSize,
                widgetSize,
              )
            : null;

        return Stack(
          children: [
            InkWell(
              onTapDown: (details) => handleTapToAutofocus(
                context,
                widgetSize,
                details.localPosition,
              ),
            ),
            if (focusRectPosition != null)
              Positioned(
                top: focusRectPosition.dy,
                left: focusRectPosition.dx,
                child: Container(
                  width: autofocusAreaSize.width,
                  height: autofocusAreaSize.height,
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

  Offset _calculateFocusRectPosition(
    AutofocusPosition autofocusPosition,
    Size autofocusAreaSize,
    Size widgetSize,
  ) {
    return Offset(
      autofocusPosition.x * widgetSize.width - (autofocusAreaSize.width / 2),
      autofocusPosition.y * widgetSize.height - (autofocusAreaSize.height / 2),
    );
  }
}
