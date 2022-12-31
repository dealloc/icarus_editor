import 'dart:convert';

import 'package:icarus_editor/exceptions/icarus_exception.dart';
import 'package:icarus_editor/services/icarus_save.dart';
import 'package:icarus_editor_core/icarus_editor_core.dart';

class IcarusInventory {
  final Map inventory;
  final IcarusSave save;
  late List<IcarusInventoryItem> items;

  IcarusInventory({required this.inventory, required this.save}) {
    items = [
      for (var item in inventory['Items']) IcarusInventoryItem(item: item)
    ];
  }

  String serialize() => json.encode(inventory);
}

class IcarusInventoryItem {
  final Map item;
  late int _durabilityIndex;
  ItemStaticEntry? _entry;

  IcarusInventoryItem({required this.item}) {
    _durabilityIndex = _getDynamicDataIndex('Durability');
    if (itemsStatic.containsKey(item['ItemStaticData']['RowName'])) {
      _entry = itemsStatic[item['ItemStaticData']['RowName']];
    }
  }

  String get displayName {
    return _entry?.displayName ?? item['ItemStaticData']['RowName'];
  }

  bool get hasDurability => _durabilityIndex != -1;

  int get maxDurability {
    return _entry?.durability ?? -1;
  }

  double get durabilityPercentage {
    return (durability / maxDurability) * 100;
  }

  int get durability {
    if (hasDurability == false) {
      throw const IcarusException(
          'Cannot get durability of item without durability!');
    }

    return item['ItemDynamicData'][_durabilityIndex]['Value'];
  }

  set durability(int value) {
    if (hasDurability == false) {
      throw const IcarusException(
          'Cannot set durability of item without durability!');
    }

    item['ItemDynamicData'][_durabilityIndex]['Value'] = value;
  }

  int _getDynamicDataIndex(String key) {
    for (var i = 0; i < item['ItemDynamicData'].length; i++) {
      if (key.compareTo(item['ItemDynamicData'][i]['PropertyType']) == 0) {
        return i;
      }
    }

    return -1;
  }
}
