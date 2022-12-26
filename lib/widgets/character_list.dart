import 'package:fluent_ui/fluent_ui.dart';
import 'package:icarus_editor/services/icarus_character.dart';

import '../pages/character_page.dart';

class CharacterList extends StatefulWidget {
  final List<IcarusCharacter> characters;

  const CharacterList({super.key, required this.characters});

  @override
  State<CharacterList> createState() => _CharacterListState();
}

class _CharacterListState extends State<CharacterList> {
  int _activeCharacter = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      // appBar: const NavigationAppBar(
      //   title: Text('Icarus Character editor'),
      //   automaticallyImplyLeading: false,
      // ),
      pane: NavigationPane(
        selected: _activeCharacter,
        onChanged: (value) => setState(() => _activeCharacter = value),
        displayMode: PaneDisplayMode.auto,
        items: [
          for (var character in widget.characters)
            PaneItem(
              icon: const Icon(FluentIcons.accounts),
              title: Text('${character.name} (${character.xp} XP)'),
              body: CharacterPage(character: character),
            )
        ],
      ),
    );
  }
}
