import 'package:flutter/material.dart';

class CameraSelectionItem extends StatelessWidget {
  final String modelName;
  final String modelImageSource;

  const CameraSelectionItem(
      {required this.modelName, required this.modelImageSource, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          padding: const EdgeInsets.all(8),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(100.0)),
            child: Image.network(
              modelImageSource,
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          modelName,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
