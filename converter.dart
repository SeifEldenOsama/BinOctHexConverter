String convertBase(String number, int fromBase, int toBase) {
  try {
    final decimal = int.parse(number, radix: fromBase);
    return decimal.toRadixString(toBase).toUpperCase();
  } catch (_) {
    return '';
  }
}
