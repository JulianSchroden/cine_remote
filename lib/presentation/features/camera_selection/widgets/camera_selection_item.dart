import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/models/camera_model.dart';
import '../../../core/widgets/rounded_text_button.dart';
import '../../camera_connection/bloc/camera_connection_cubit.dart';

class CameraSelectionItem extends StatelessWidget {
  final CameraModel cameraModel;
  final bool isLoading;

  const CameraSelectionItem({
    required this.cameraModel,
    required this.isLoading,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Container(
          //  decoration: const BoxDecoration(
          //    shape: BoxShape.circle,
          //    color: Colors.white,
          //  ),
          //  padding: const EdgeInsets.all(8),
          //  child: ClipRRect(
          //    borderRadius: const BorderRadius.all(Radius.circular(100.0)),
          //    child: Image.network(
          //      modelImageSource,
          //      width: 200,
          //      height: 200,
          //      fit: BoxFit.cover,
          //    ),
          //  ),
          //),
          const SizedBox(height: 20),
          Text(
            cameraModel.name,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 36),
          RoundedTextButton(
            text: 'Connect',
            minWidth: 128,
            showLoadingIndicator: isLoading,
            onPressed: isLoading
                ? null
                : () {
                    context.read<CameraConnectionCubit>().connect(cameraModel);
                  },
          )
        ],
      ),
    );
  }
}
