import 'dart:io';
import 'dart:math';

import 'package:collection/collection.dart';

void day_1_1() async {
  final content = await File('assets/day_1_1.txt').readAsString();

  final foundNumbers = <int>[];

  for (final line in content.split('\n')) {
    final numbers = <int>[];
    for (final c in line.split('')) {
      final parsed = int.tryParse(c);
      if (parsed != null) numbers.add(parsed);
    }
    if (numbers.isNotEmpty) {
      final foundNumber =
          numbers.first * 10 + (numbers.lastOrNull ?? numbers.first);
      foundNumbers.add(foundNumber);
    }
  }

  print(foundNumbers.reduce((value, element) => value + element));
}

void day_1_2() async {
  final content = await File('assets/day_1_2.txt').readAsString();

  final foundNumbers = <int>[];

  for (var line in content.split('\n')) {
    final numbers = <int>[];
    final updatedLine = _replaceLiteralNumbers(line);

    for (final c in updatedLine.split('')) {
      final parsed = int.tryParse(c);
      if (parsed != null) numbers.add(parsed);
    }
    if (numbers.isNotEmpty) {
      final foundNumber =
          numbers.first * 10 + (numbers.lastOrNull ?? numbers.first);
      foundNumbers.add(foundNumber);
    }
  }

  print(foundNumbers.reduce((value, element) => value + element));
}

String _replaceLiteralNumbers(String line) {
  final numberMap = {
    "one": 1,
    "two": 2,
    "three": 3,
    "four": 4,
    "five": 5,
    "six": 6,
    "seven": 7,
    "eight": 8,
    "nine": 9,
  };

  String result = "";

  for (int i = 0; i < line.length; i++) {
    final digit = line[i];
    if (digit.contains(RegExp('1|2|3|4|5|6|7|8|9'))) {
      result += digit;
      continue;
    }

    if (!digit.contains(RegExp('o|t|f|s|e|n'))) continue;

    for (final MapEntry(:key, :value) in numberMap.entries) {
      final endSection = min(i + key.length, line.length);

      final section = line.substring(i, endSection);

      if (section != key) continue;

      result += value.toString();
    }
  }

  return result;
}
