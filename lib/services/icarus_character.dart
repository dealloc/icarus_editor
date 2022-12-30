import 'dart:convert';

import 'package:icarus_editor/services/icarus_save.dart';

class IcarusCharacter {
  final Map character;
  final IcarusSave save;

  IcarusCharacter({required this.character, required this.save});

  String get name {
    return character['CharacterName'];
  }

  set name(String value) {
    character['CharacterName'] = value;
  }

  int get xp {
    return character['XP'];
  }

  set xp(int value) {
    character['XP'] = value;
  }

  String serialize() => json.encode(character);
}
