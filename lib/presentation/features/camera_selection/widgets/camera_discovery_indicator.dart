import 'package:flutter/material.dart';

class CameraDiscoveryIndicator extends StatefulWidget {
  final double diameter;
  final bool isDiscovering;
  final EdgeInsets padding;

  const CameraDiscoveryIndicator({
    required this.diameter,
    required this.isDiscovering,
    this.padding = const EdgeInsets.all(0),
    super.key,
  });

  @override
  State<CameraDiscoveryIndicator> createState() =>
      _CameraDiscoveryIndicatorState();
}

class _CameraDiscoveryIndicatorState extends State<CameraDiscoveryIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Color?> animation;

  @override
  void initState() {
    animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    final curvedAnimation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation = ColorTween(
      begin: const Color.fromARGB(26, 147, 147, 147),
      end: Colors.white,
    ).animate(curvedAnimation)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          animationController.forward();
        }
      })
      ..addListener(() {
        setState(() {});
      });

    animationController.forward();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CameraDiscoveryIndicator oldWidget) {
    if (widget.isDiscovering) {
      animationController.forward();
    } else {
      animationController.reset();
      animationController.stop();
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: Container(
        width: widget.diameter,
        height: widget.diameter,
        decoration: BoxDecoration(
          color: animation.value,
          borderRadius: BorderRadius.all(Radius.circular(widget.diameter / 2)),
        ),
      ),
    );
  }
}
