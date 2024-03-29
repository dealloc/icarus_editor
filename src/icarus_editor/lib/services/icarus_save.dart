import 'dart:convert';
import 'dart:io';

import 'package:icarus_editor/services/folders.dart';
import 'package:icarus_editor/services/icarus_character.dart';
import 'package:icarus_editor/services/icarus_inventory.dart';
import 'package:icarus_editor/services/icarus_profile.dart';

const String _charactersKey = 'Characters.json';

class IcarusSave {
  final Directory directory;
  late File _charactersFile;
  late File _profileFile;
  late File _inventoryFile;
  final Encoding _encoding = const SystemEncoding();
  final List<IcarusCharacter> characters = List.empty(growable: true);
  late IcarusProfile profile;
  late IcarusInventory inventory;

  IcarusSave({required this.directory}) {
    _charactersFile = getFileInIcarusSaveFolder(directory, 'Characters.json');
    _profileFile = getFileInIcarusSaveFolder(directory, 'Profile.json');
    _inventoryFile = getFileInIcarusSaveFolder(directory, 'MetaInventory.json');
  }

  Future initialize() async {
    if (await _charactersFile.exists() == false) {
      throw FileSystemException(
          'Could not load characters', _charactersFile.path);
    }
    if (await _profileFile.exists() == false) {
      throw FileSystemException('Could not load profile', _profileFile.path);
    }
    if (await _inventoryFile.exists() == false) {
      throw FileSystemException('Could not load profile', _inventoryFile.path);
    }

    var charactersContent =
        await _charactersFile.readAsString(encoding: _encoding);
    var rawCharacters = json.decode(charactersContent)[_charactersKey];
    for (var rawCharacter in rawCharacters) {
      var decoded = json.decode(rawCharacter);

      characters.add(IcarusCharacter(character: decoded, save: this));
    }

    var profileContent = await _profileFile.readAsString(encoding: _encoding);
    var rawProfile = json.decode(profileContent);
    profile = IcarusProfile(profile: rawProfile, save: this);

    var inventoryContent =
        await _inventoryFile.readAsString(encoding: _encoding);
    var rawInventory = json.decode(inventoryContent);
    inventory = IcarusInventory(inventory: rawInventory, save: this);
  }

  Future saveChanges() async {
    await _saveCharacters();
    await _saveProfile();
    await _saveInventory();
  }

  Future _saveCharacters() async {
    var content = {
      'Characters.json': [
        for (var character in characters) character.serialize()
      ]
    };

    await _charactersFile.writeAsString(json.encode(content),
        encoding: _encoding);
  }

  Future _saveProfile() async {
    var content = profile.serialize();

    await _profileFile.writeAsString(content, encoding: _encoding);
  }

  Future _saveInventory() async {
    var content = inventory.serialize();

    await _inventoryFile.writeAsString(content, encoding: _encoding);
  }
}
