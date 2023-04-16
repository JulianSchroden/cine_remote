extension StreamFirstWhereTypeExtension<S> on Stream<S> {
  Future<T> firstWhereType<T>([bool Function(T)? test]) async {
    final result = await firstWhere(
        (element) => element is T && (test?.call(element) ?? true));
    return result as T;
  }
}

extension StreamWhereTypeExtension<S> on Stream<S> {
  Stream<T> whereType<T>([bool Function(T)? test]) =>
      where((event) => event is T && (test?.call(event) ?? true)).cast<T>();
}

extension StreamWhereNotNullExtension<T> on Stream<T?> {
  Stream<T> whereNotNull() => where((event) => event != null).cast<T>();
}
