import 'package:fluent_ui/fluent_ui.dart';
import 'package:icarus_editor/services/icarus_character.dart';

class CharacterPage extends StatelessWidget {
  final IcarusCharacter character;

  const CharacterPage({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    final keys = character.character.keys.toList();
    final values = character.character.values.toList();

    return ColoredBox(
      color: const Color(0xFFFFFFFF),
      child: Center(
        child: ListView.builder(
          itemCount: character.character.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(keys[index]),
              subtitle: TextBox(initialValue: values[index].toString()),
            );
          },
        ),
      ),
    );
  }
}
