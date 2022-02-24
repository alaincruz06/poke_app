extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

double hectogramsToKilograms(int weight) {
  return weight / 10;
}

double decimetresToMetres(int height) {
  return height / 10;
}
