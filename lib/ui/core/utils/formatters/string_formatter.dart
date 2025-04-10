extension StringFormatter on String {
  String capitalFirstLetter() => length < 2 ? toUpperCase() : this[0].toUpperCase() + substring(1);
}
