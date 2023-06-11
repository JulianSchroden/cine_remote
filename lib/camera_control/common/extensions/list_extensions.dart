extension LastIndexExtension<T> on Iterable<T> {
  int get lastIndex => length - 1;
}

extension WhereNotNullExtension<T> on Iterable<T?> {
  Iterable<T> whereNotNull() => where((element) => element != null).cast<T>();
}

extension IndexOfSequenceExtension<T> on List<T> {
  int indexOfSequence(List<T> sequence) {
    if (sequence.isEmpty) {
      return -1;
    }

    final startByte = sequence.first;
    var searchIndex = 0;
    while (true) {
      searchIndex = indexOf(startByte, searchIndex);

      if (searchIndex == -1) {
        return -1;
      }

      if (searchIndex + sequence.length > length) {
        return -1;
      }

      for (int i = 1; i < sequence.length; i++) {
        if (this[searchIndex + i] != sequence[i]) {
          searchIndex++;
          break;
        }

        if (i == sequence.lastIndex) {
          return searchIndex;
        }
      }
    }
  }
}

extension LastIndexOfSequenceExtension<T> on List<T> {
  int lastIndexOfSequence(List<T> sequence) {
    if (sequence.isEmpty) {
      return -1;
    }

    final startByte = sequence.first;
    var searchIndex = lastIndex;
    while (true) {
      if (searchIndex < 0) {
        return -1;
      }

      searchIndex = lastIndexOf(startByte, searchIndex);
      if (searchIndex == -1) {
        return -1;
      }

      if (searchIndex + sequence.length > length) {
        searchIndex--;
        continue;
      }

      for (int i = 1; i < sequence.length; i++) {
        if (this[searchIndex + i] != sequence[i]) {
          searchIndex--;
          break;
        }

        if (i == sequence.lastIndex) {
          return searchIndex;
        }
      }
    }
  }
}
