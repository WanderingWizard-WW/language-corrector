import 'dart:math';

class Generator {
  static String generateSecureCode({int length = 6}) {
    const lowercaseLetters = 'abcdefghijklmnopqrstuvwxyz';
    final uppercaseLetters = lowercaseLetters.toUpperCase();
    const numbers = '0123456789';

    var chars = '';
    chars += lowercaseLetters;
    chars += uppercaseLetters;
    chars += numbers;

    return List.generate(length, (index) {
      final indexRandom = Random.secure().nextInt(chars.length);
      return chars[indexRandom];
    }).join();
  }
}
