extension ListUtils<T> on List<T> {
  List<T> sorted(int Function(T a, T b) compare) {
    final sortedList = [...this]..sort(compare);
    return sortedList;
  }
}
