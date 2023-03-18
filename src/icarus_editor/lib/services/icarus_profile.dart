import 'dart:convert';

import 'package:icarus_editor/services/icarus_save.dart';

class IcarusProfile {
  final Map profile;
  final IcarusSave save;
  late int _creditsIndex;
  late int _exoticsIndex;
  late int _refundsIndex;

  IcarusProfile({required this.profile, required this.save}) {
    _creditsIndex = _getMetaResourceIndex('Credits');
    _exoticsIndex = _getMetaResourceIndex('Exotic1');
    _refundsIndex = _getMetaResourceIndex('Refund');
  }

  int get credits => profile['MetaResources'][_creditsIndex]['Count'];

  set credits(int value) {
    profile['MetaResources'][_creditsIndex]['Count'] = value;
  }

  int get exotics => profile['MetaResources'][_exoticsIndex]['Count'];

  set exotics(int value) {
    profile['MetaResources'][_exoticsIndex]['Count'] = value;
  }

  int get refundTokens => profile['MetaResources'][_refundsIndex]['Count'];

  set refundTokens(int value) {
    profile['MetaResources'][_refundsIndex]['Count'] = value;
  }

  String serialize() => json.encode(profile);

  int _getMetaResourceIndex(String key) {
    for (var i = 0; i < profile['MetaResources'].length; i++) {
      if (key.compareTo(profile['MetaResources'][i]['MetaRow']) == 0) {
        return i;
      }
    }

    var newIndex = profile['MetaResources'].length;
    profile['MetaResources'].add({'MetaRow': '', 'Count': 0});

    return newIndex;
  }
}
