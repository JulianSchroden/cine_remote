extension ListCopyWithExtension<Type> on List<Type> {
  List<Type> copyWith({
    required bool Function(Type item) predecate,
    required Type Function(Type item) transform,
  }) {
    final updatedList = List<Type>.from(this);

    updatedList.updateWhere(predecate: predecate, transform: transform);

    return updatedList;
  }
}

extension UpdateWhereExtension<Type> on List<Type> {
  void updateWhere({
    required bool Function(Type item) predecate,
    required Type Function(Type item) transform,
  }) {
    final itemIndex = indexWhere(predecate);
    if (itemIndex == -1) {
      throw StateError('No item matched provided predecate');
    }

    this[itemIndex] = transform(this[itemIndex]);
  }
}

extension FirstWhereOrNullExtension<T> on Iterable<T> {
  T? firstWhereOrNull(bool Function(T) test) {
    try {
      return firstWhere(test);
    } catch (e) {
      return null;
    }
  }
}
