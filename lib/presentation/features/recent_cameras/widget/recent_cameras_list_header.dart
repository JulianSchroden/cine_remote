import 'package:flutter/material.dart';

class RecentCamerasListHeader extends StatelessWidget {
  final String title;
  final Widget action;

  const RecentCamerasListHeader({
    required this.title,
    required this.action,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ]),
          action,
        ],
      ),
    );
  }
}
