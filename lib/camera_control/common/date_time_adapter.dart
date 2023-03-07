abstract class DateTimeAdapter {
  DateTime now();
}

class DateTimeAdapterImpl extends DateTimeAdapter {
  @override
  DateTime now() => DateTime.now();
}
