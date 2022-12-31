import '../generated/generated.dart';

class ItemStaticEntry {
  final String name;
  final String? _itemKey;
  final String? _durableKey;

  const ItemStaticEntry(this.name, this._itemKey, this._durableKey);

  String? get displayName {
    if (itemables.containsKey(_itemKey)) {
      return itemables[_itemKey];
    }

    return null;
  }

  int? get durability {
    if (durables.containsKey(_durableKey)) {
      return durables[_durableKey];
    }

    return null;
  }
}
