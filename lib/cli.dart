import 'dart:io';

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

  final stringToNumbers = {
    "eight": 8,
    "nine": 9,
    "one": 1,
    "two": 2,
    "three": 3,
    "four": 4,
    "five": 5,
    "six": 6,
    "seven": 7
  };

  for (var line in content.split('\n')) {
    for (final entry in stringToNumbers.entries) {
      line = line.replaceAll(entry.key, entry.value.toString());
    }
    print(line);

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
