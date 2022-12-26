import 'dart:convert';
import 'dart:io';

import 'package:icarus_editor/services/folders.dart';
import 'package:icarus_editor/services/icarus_character.dart';

const String _charactersKey = 'Characters.json';

class IcarusSave {
  final Directory directory;
  late File _charactersFile;
  final List<IcarusCharacter> characters = List.empty(growable: true);

  IcarusSave({required this.directory}) {
    _charactersFile = getFileInIcarusSaveFolder(directory, 'Characters.json');
  }

  Future initialize() async {
    if (await _charactersFile.exists() == false) {
      throw FileSystemException(
          'Could not load characters', _charactersFile.path);
    }

    var content = await _charactersFile.readAsString();
    var rawCharacters = json.decode(content)[_charactersKey];
    for (var rawCharacter in rawCharacters) {
      var decoded = json.decode(rawCharacter);

      characters.add(IcarusCharacter(character: decoded, save: this));
    }
  }
}
