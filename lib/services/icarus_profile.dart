import 'dart:io';

import 'package:icarus_editor/services/icarus_save.dart';

class IcarusProfile {
  final Map profile;
  final IcarusSave save;

  IcarusProfile({required this.profile, required this.save});
}
