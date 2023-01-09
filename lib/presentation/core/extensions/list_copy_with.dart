extension ListCopyWithExtension<Type> on List<Type> {
  List<Type> copyWith({
    required bool Function(Type item) predecate,
    required Type Function(Type item) transform,
  }) {
    final updatedList = List<Type>.from(this);

    final itemIndex = updatedList.indexWhere(predecate);
    if (itemIndex == -1) {
      throw StateError('No item matched provided predecate');
    }

    updatedList[itemIndex] = transform(updatedList[itemIndex]);

    return updatedList;
  }
}
