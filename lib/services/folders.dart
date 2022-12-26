import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

Future<String> _getAppDataLocal() async {
  var dir = await getApplicationSupportDirectory();

  return p.normalize(p.join(dir.path, '..', '..', '..', 'Local'));
}

Future<Directory> _getIcarusFolder() async {
  final local = await _getAppDataLocal();
  final path = p.join(local, 'Icarus', 'Saved');
  final directory = Directory(path);
  if (await directory.exists() == false) {
    throw FileSystemException(
        'Could not locate Icarus saves folder', directory.path);
  }

  return directory;
}

Future<Directory> getIcarusSaveFolder() async {
  final icarusFolder = await _getIcarusFolder();
  final savesFolder = Directory(p.join(icarusFolder.path, 'PlayerData'));

  await for (var element in savesFolder.list()) {
    if (element is Directory) {
      return element;
    }
  }

  throw FileSystemException('Failed to locate save folders', savesFolder.path);
}

File getFileInIcarusSaveFolder(Directory directory, String filename) {
  var path = p.join(directory.path, filename);

  return File(path);
}
