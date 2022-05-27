extension NullableStringExtensions on String? {
  bool get isNullOrBlank => this == null || isBlank;

  bool get isNullOrEmpty => this == null || this!.isEmpty;

  bool get isBlank => this?.trim().isEmpty ?? true;

  String get orEmpty => this ?? StringExtensions.empty;

  bool get isNeitherNullNorEmpty => !isNullOrEmpty;

  bool get isNeitherNullNorBlank => !isNullOrBlank;
}

extension StringExtensions on String {
  static const String empty = '';
  static const String blank = ' ';

  int get lastIndex => length - 1;
}

extension StringFormFieldsExtension on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
    return emailRegExp.hasMatch(this);
  }
}
