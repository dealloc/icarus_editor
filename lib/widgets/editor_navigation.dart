import 'package:fluent_ui/fluent_ui.dart';
import 'package:icarus_editor/widgets/profile/profile_overview.dart';

import '../services/icarus_character.dart';
import 'character/character_overview.dart';

class EditorNavigation extends StatefulWidget {
  final List<IcarusCharacter> characters;

  const EditorNavigation({super.key, required this.characters});

  @override
  State<EditorNavigation> createState() => _EditorNavigationState();
}

class _EditorNavigationState extends State<EditorNavigation> {
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
              body: CharacterOverview(character: character),
            )
        ],
        footerItems: [
          PaneItem(
            icon: const Icon(FluentIcons.process),
            title: const Text('Profile'),
            body: const ProfileOverview(),
          ),
        ],
      ),
    );
  }
}
