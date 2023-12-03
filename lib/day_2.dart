import 'dart:io';

import 'package:collection/collection.dart';

void day_2_1() async {
  final content = await File('assets/day_2_1.txt').readAsString();
  const maxRed = 12;
  const maxGreen = 13;
  const maxBlue = 14;
  int idSum = 0;

  for (final line in content.split('\n')) {
    final gameId =
        int.parse(RegExp('Game \\d+').firstMatch(line)![0]!.split(' ')[1]);

    final invalidRedExtracted = RegExp('\\d+ red')
        .allMatches(line)
        .map((e) => int.parse(e[0]!.split(' ')[0]))
        .firstWhereOrNull((e) => e > maxRed);

    if (invalidRedExtracted != null) continue;

    final invalidBlueExtracted = RegExp('\\d+ blue')
        .allMatches(line)
        .map((e) => int.parse(e[0]!.split(' ')[0]))
        .firstWhereOrNull((e) => e > maxBlue);

    if (invalidBlueExtracted != null) continue;

    final invalidGreenExtracted = RegExp('\\d+ green')
        .allMatches(line)
        .map((e) => int.parse(e[0]!.split(' ')[0]))
        .firstWhereOrNull((e) => e > maxGreen);

    if (invalidGreenExtracted != null) continue;

    idSum += gameId;
  }

  print(idSum);
}
