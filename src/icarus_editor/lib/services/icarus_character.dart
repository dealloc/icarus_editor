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

  int get xpDebt {
    return character['XP_Debt'];
  }

  set xpDebt(int value) {
    character['XP_Debt'] = value;
  }

  bool get dead {
    return character['IsDead'];
  }

  set dead(bool value) {
    character['IsDead'] = value;
  }

  bool get abandoned {
    return character['IsAbandoned'];
  }

  set abandoned(bool value) {
    character['IsAbandoned'] = value;
  }

  String serialize() => json.encode(character);
}
