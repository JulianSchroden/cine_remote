import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class LiveViewGridGuidelinesOverlay extends StatelessWidget {
  final int horizontalGridCellCount;
  final int verticalGridCellCount;
  final LiveViewGridGuideLinesStyle style;

  const LiveViewGridGuidelinesOverlay({
    this.horizontalGridCellCount = 3,
    this.verticalGridCellCount = 3,
    this.style = const LiveViewGridGuideLinesStyle(),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (state, constraints) {
      return CustomPaint(
        painter: LiveViewGridGuideLinesOverlayPainter(
          horizontalGridCellCount,
          verticalGridCellCount,
          style,
        ),
        size: constraints.biggest,
      );
    });
  }
}

class LiveViewGridGuideLinesStyle extends Equatable {
  final Color color;
  final double strokeWidth;

  const LiveViewGridGuideLinesStyle({
    this.color = Colors.black,
    this.strokeWidth = 1,
  });

  @override
  List<Object?> get props => [color, strokeWidth];
}

class LiveViewGridGuideLinesOverlayPainter extends CustomPainter {
  final int horizontalGridCellCount;
  final int verticalGridCellCount;
  final LiveViewGridGuideLinesStyle style;

  LiveViewGridGuideLinesOverlayPainter(
    this.horizontalGridCellCount,
    this.verticalGridCellCount,
    this.style,
  );

  @override
  void paint(Canvas canvas, Size size) {
    final linePaint = Paint()
      ..color = style.color
      ..strokeWidth = style.strokeWidth;

    final horizontalCellWidth = size.width / horizontalGridCellCount;
    for (var i = 1; i < horizontalGridCellCount; i++) {
      canvas.drawLine(
        Offset(horizontalCellWidth * i, 0),
        Offset(horizontalCellWidth * i, size.height),
        linePaint,
      );
    }

    final verticalCellHeight = size.height / verticalGridCellCount;
    for (var i = 1; i < verticalGridCellCount; i++) {
      canvas.drawLine(
        Offset(0, verticalCellHeight * i),
        Offset(size.width, verticalCellHeight * i),
        linePaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    if (oldDelegate is! LiveViewGridGuideLinesOverlayPainter) return true;

    return horizontalGridCellCount != oldDelegate.horizontalGridCellCount ||
        verticalGridCellCount != oldDelegate.verticalGridCellCount ||
        style != oldDelegate.style;
  }
}
