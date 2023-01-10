import '../../domain/services/date_time_adapter.dart';

class DateTimeAdapterImpl extends DateTimeAdapter {
  @override
  DateTime now() => DateTime.now();
}
