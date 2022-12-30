import 'package:fluent_ui/fluent_ui.dart';
import 'package:icarus_editor/services/icarus_character.dart';

class CharacterStats extends StatelessWidget {
  final IcarusCharacter character;

  const CharacterStats({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    final keys = character.character.keys.toList();
    final values = character.character.values.toList();

    return ListView(
      children: [
        ListTile(
          title: Text('Name'),
          subtitle: TextBox(
            initialValue: character.name,
            readOnly: true,
          ),
        ),
        ListTile(
          title: Text('XP'),
          subtitle: TextBox(
            initialValue: character.xp.toString(),
            readOnly: true,
          ),
        ),
        ListTile(
          title: Text('XP Debt'),
          subtitle: TextBox(
            initialValue: character.xpDebt.toString(),
            readOnly: true,
          ),
        ),
        ListTile(
          title: Text('Dead'),
          subtitle: Checkbox(checked: character.dead, onChanged: (value) {}),
        ),
        ListTile(
          title: Text('Abandoned'),
          subtitle:
              Checkbox(checked: character.abandoned, onChanged: (value) {}),
        ),
      ],
    );
  }
}
