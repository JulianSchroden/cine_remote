import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class LiveViewCenterMarkerOverlay extends StatelessWidget {
  final Size size;
  final LiveViewCenterMarkerStyle style;

  const LiveViewCenterMarkerOverlay({
    this.size = const Size.square(30),
    this.style = const LiveViewCenterMarkerStyle(),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      return CustomPaint(
        size: constrains.biggest,
        painter: LiveViewCenterMarkerOverlayPainter(size, style),
      );
    });
  }
}

class LiveViewCenterMarkerStyle extends Equatable {
  final Color color;
  final double strokeWidth;

  const LiveViewCenterMarkerStyle({
    this.color = Colors.white,
    this.strokeWidth = 2,
  });

  @override
  List<Object?> get props => [color, strokeWidth];
}

class LiveViewCenterMarkerOverlayPainter extends CustomPainter {
  final Size markerSize;
  final LiveViewCenterMarkerStyle style;

  LiveViewCenterMarkerOverlayPainter(
    this.markerSize,
    this.style,
  );

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final xOffset = markerSize.width / 2;
    final yOffset = markerSize.height / 2;

    canvas.drawLine(
        center.translate(0, -xOffset),
        center.translate(0, xOffset),
        Paint()
          ..color = style.color
          ..strokeWidth = style.strokeWidth);
    canvas.drawLine(
        center.translate(-yOffset, 0),
        center.translate(yOffset, 0),
        Paint()
          ..color = style.color
          ..strokeWidth = style.strokeWidth);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    if (oldDelegate is! LiveViewCenterMarkerOverlayPainter) return true;

    return markerSize != oldDelegate.markerSize || style != oldDelegate.style;
  }
}
