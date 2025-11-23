import 'package:flutter/services.dart';

class WordLimitFormatter extends TextInputFormatter {
  final int wordLimit;

  WordLimitFormatter(this.wordLimit);

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {

    final words = newValue.text.trim().split(RegExp(r'\s+'));
    if (words.length > wordLimit) {
      return oldValue;   //user form e last j value ta diyechilo oita show korbe
    }
    return newValue;
  }
}
