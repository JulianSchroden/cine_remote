import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cine_remote_colors.dart';
import '../../../core/widgets/rounded_text_button.dart';
import '../../../routes.dart';
import '../../camera_connection/bloc/camera_connection_cubit.dart';
import '../widgets/camera_selection_item.dart';

class CameraSelectionPage extends StatelessWidget {
  const CameraSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CameraConnectionCubit, CameraConnectionState>(
      listener: (context, state) {
        state.maybeWhen(
            connectSuccess: ((_) =>
                Navigator.of(context).pushNamed(Routes.cameraControl)),
            orElse: () {});
      },
      builder: (context, state) => Scaffold(
        backgroundColor: CineRemoteColors.background,
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CameraSelectionItem(
                  modelName: 'Canon C100 II',
                  modelImageSource:
                      'https://www.canon.de/media/EOS%20C100%20Mark%20II%20Default_tcm83-1211141.jpg',
                ),
                const SizedBox(height: 24),
                RoundedTextButton(
                  text: 'Connect',
                  minWidth: 128,
                  showLoadingIndicator: state.maybeWhen(
                      initConnection: () => true,
                      disconnecting: () => true,
                      orElse: () => false),
                  onPressed: () {
                    context.read<CameraConnectionCubit>().connect();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
