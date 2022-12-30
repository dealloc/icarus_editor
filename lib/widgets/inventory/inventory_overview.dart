import 'package:fluent_ui/fluent_ui.dart';
import 'package:icarus_editor/services/icarus_inventory.dart';

class InventoryOverview extends StatelessWidget {
  final IcarusInventory inventory;

  const InventoryOverview({super.key, required this.inventory});

  @override
  Widget build(BuildContext context) {
    var itemsWithDurability =
        inventory.items.where((element) => element.hasDurability).toList();

    return ColoredBox(
      color: FluentTheme.of(context).scaffoldBackgroundColor,
      child: Center(
        child: ListView.builder(
          itemCount: itemsWithDurability.length,
          itemBuilder: (context, index) {
            var item = itemsWithDurability[index];

            return ListTile(
              title: Text(item.name),
              subtitle: item.hasDurability
                  ? TextBox(
                      keyboardType: TextInputType.number,
                      initialValue: item.durability.toString(),
                      onChanged: (value) {
                        var number = int.tryParse(value);
                        if (number != null) {
                          item.durability = number;
                        }
                      },
                    )
                  : null,
            );
          },
        ),
      ),
    );
  }
}
