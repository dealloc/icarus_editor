import 'package:icarus_editor/services/icarus_save.dart';

class IcarusCharacter {
  final Map character;
  final IcarusSave save;

  IcarusCharacter({required this.character, required this.save});

  String get name {
    return character['CharacterName'];
  }

  int get xp {
    return character['XP'];
  }
}
