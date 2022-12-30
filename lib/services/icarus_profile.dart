import 'dart:io';

import 'package:icarus_editor/services/icarus_save.dart';

class IcarusProfile {
  final Map profile;
  final IcarusSave save;

  IcarusProfile({required this.profile, required this.save});

  int get credits {
    return _getMetaResource('Credits') ?? -1;
  }

  int get exotics {
    return _getMetaResource('Exotic1') ?? -1;
  }

  int get refundTokens {
    return _getMetaResource('Refund') ?? -1;
  }

  dynamic _getMetaResource(String key) {
    for (var resource in profile["MetaResources"]) {
      if (key.compareTo(resource['MetaRow']) == 0) {
        return resource['Count'];
      }
    }

    return null;
  }
}
