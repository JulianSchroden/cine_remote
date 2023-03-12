import 'package:flutter/foundation.dart';

import '../../../common/date_time_adapter.dart';
import '../../constants/api_endpoint_path.dart';
import '../get_acion.dart';

class GetLiveViewImageAction extends GetAction<Uint8List> {
  final DateTimeAdapter dateTimeAdapter;

  const GetLiveViewImageAction(
    super.httpAdapter, [
    this.dateTimeAdapter = const DateTimeAdapterImpl(),
  ]);

  @override
  Future<Uint8List> call() async {
    final timeStamp = DateTime.now().toIso8601String();

    final response = await httpAdapter.getRaw(
      ApiEndpointPath.liveViewGetImage,
      {'d': timeStamp},
    );
    return await consolidateHttpClientResponseBytes(response);
  }
}
