import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../camera_connection/bloc/camera_connection_cubit.dart';
import '../../routes.dart';
import '../widgets/camera_selection_item.dart';

class CameraSelectionPage extends StatelessWidget {
  const CameraSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CameraConnectionCubit, CameraConnectionState>(
      listener: (context, state) {
        state.maybeWhen(
          connectSuccess: ((_) => Navigator.of(context).pushNamed(Routes.cameraControl)),
          orElse: (){});
      },
      child: Scaffold(
        backgroundColor: Colors.grey[200],
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
                TextButton(
                    onPressed: () async {
                      await context.read<CameraConnectionCubit>().connect();
                    },
                    child: Text('Connect'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
