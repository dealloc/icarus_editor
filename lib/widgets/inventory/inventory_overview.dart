import 'package:fluent_ui/fluent_ui.dart';
import 'package:icarus_editor/services/icarus_inventory.dart';

class InventoryOverview extends StatelessWidget {
  final IcarusInventory inventory;

  const InventoryOverview({super.key, required this.inventory});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: FluentTheme.of(context).scaffoldBackgroundColor,
      child: Center(
        child: ListView.builder(
          itemCount: inventory.items.length,
          itemBuilder: (context, index) {
            var item = inventory.items[index];

            return ListTile(
              title: Text(item.name),
              subtitle: item.hasDurability ? Text('${item.durability}') : null,
            );
          },
        ),
      ),
    );
  }
}
