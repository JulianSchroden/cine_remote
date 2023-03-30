abstract class DateTimeAdapter {
  const DateTimeAdapter();

  DateTime now();
}

class DateTimeAdapterImpl extends DateTimeAdapter {
  const DateTimeAdapterImpl();

  @override
  DateTime now() => DateTime.now();
}
