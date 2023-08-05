import 'package:fluent_ui/fluent_ui.dart';
import 'package:icarus_editor/services/icarus_character.dart';

class CharacterStats extends StatefulWidget {
  final IcarusCharacter character;

  const CharacterStats({super.key, required this.character});

  @override
  State<CharacterStats> createState() => _CharacterStatsState();
}

class _CharacterStatsState extends State<CharacterStats> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: const Text('Name'),
          subtitle: TextFormBox(
            initialValue: widget.character.name,
            onChanged: (value) {
              widget.character.name = value;
            },
          ),
        ),
        ListTile(
          title: const Text('XP'),
          subtitle: TextFormBox(
            initialValue: widget.character.xp.toString(),
            onChanged: (value) {
              var number = int.tryParse(value);
              if (number != null) {
                widget.character.xp = number;
              }
            },
          ),
        ),
        ListTile(
          title: const Text('XP Debt'),
          subtitle: TextFormBox(
            initialValue: widget.character.xpDebt.toString(),
            onChanged: (value) {
              var number = int.tryParse(value);
              if (number != null) {
                widget.character.xpDebt = number;
              }
            },
          ),
        ),
        ListTile(
          title: const Text('Dead'),
          subtitle: Checkbox(
            checked: widget.character.dead,
            onChanged: (value) {
              widget.character.dead = value ?? false;
              setState(() {});
            },
          ),
        ),
        ListTile(
          title: const Text('Abandoned'),
          subtitle: Checkbox(
            checked: widget.character.abandoned,
            onChanged: (value) {
              widget.character.abandoned = value ?? false;
              setState(() {});
            },
          ),
        ),
      ],
    );
  }
}
