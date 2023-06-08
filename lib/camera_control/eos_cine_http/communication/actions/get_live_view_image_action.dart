import 'package:flutter/foundation.dart';

import '../../../common/adapter/date_time_adapter.dart';
import '../../../interface/models/live_view_data.dart';
import '../../constants/api_endpoint_path.dart';
import '../get_acion.dart';

class GetLiveViewImageAction extends GetAction<LiveViewData> {
  final DateTimeAdapter dateTimeAdapter;

  const GetLiveViewImageAction(
    super.httpAdapter, [
    this.dateTimeAdapter = const DateTimeAdapter(),
  ]);

  @override
  Future<LiveViewData> call() async {
    final timeStamp = DateTime.now().toIso8601String();

    final response = await httpAdapter.getRaw(
      ApiEndpointPath.liveViewGetImage,
      {'d': timeStamp},
    );

    final imageBytes = await consolidateHttpClientResponseBytes(response);

    return LiveViewData(imageBytes: imageBytes);
  }
}
