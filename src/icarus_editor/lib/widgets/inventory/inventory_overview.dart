import 'package:fluent_ui/fluent_ui.dart';
import 'package:icarus_editor/services/icarus_inventory.dart';

class InventoryOverview extends StatefulWidget {
  final IcarusInventory inventory;

  const InventoryOverview({super.key, required this.inventory});

  @override
  State<InventoryOverview> createState() => _InventoryOverviewState();
}

class _InventoryOverviewState extends State<InventoryOverview> {
  @override
  Widget build(BuildContext context) {
    var itemsWithDurability = widget.inventory.items
        .where((element) => element.hasDurability)
        .toList();

    return ColoredBox(
      color: FluentTheme.of(context).scaffoldBackgroundColor,
      child: Center(
        child: ListView.builder(
          itemCount: itemsWithDurability.length,
          itemBuilder: (context, index) {
            var item = itemsWithDurability[index];

            return ListTile(
              trailing: FilledButton(
                child: const Text('Repair'),
                onPressed: () {
                  item.durability = item.maxDurability;
                  setState(() {});
                },
              ),
              title: Text(
                  '${item.displayName} (${item.durabilityPercentage.toStringAsFixed(2)}%)'),
            );
          },
        ),
      ),
    );
  }
}
