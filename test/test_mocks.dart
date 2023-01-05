import 'package:cine_remote/domain/models/camera_handle.dart';
import 'package:cine_remote/domain/services/camera_remote_service.dart';
import 'package:cine_remote/presentation/features/camera_connection/bloc/camera_connection_cubit.dart';
import 'package:mocktail/mocktail.dart';

class MockCameraConnectionCubit extends Mock implements CameraConnectionCubit {}

class MockCameraRemoteService extends Mock implements CameraRemoteService {}
