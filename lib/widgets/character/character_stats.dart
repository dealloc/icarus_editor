import 'package:fluent_ui/fluent_ui.dart';
import 'package:icarus_editor/services/icarus_character.dart';

class CharacterStats extends StatelessWidget {
  final IcarusCharacter character;

  const CharacterStats({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    final keys = character.character.keys.toList();
    final values = character.character.values.toList();

    return ListView.builder(
      itemCount: character.character.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(keys[index]),
          subtitle: TextBox(
            initialValue: values[index].toString(),
            readOnly: true,
          ),
        );
      },
    );
  }
}
