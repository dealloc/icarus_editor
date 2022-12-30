import 'package:fluent_ui/fluent_ui.dart';
import 'package:icarus_editor/services/icarus_save.dart';
import 'package:icarus_editor/widgets/profile/profile_overview.dart';

import 'character/character_overview.dart';

class EditorNavigation extends StatefulWidget {
  final IcarusSave save;

  const EditorNavigation({super.key, required this.save});

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
          for (var character in widget.save.characters)
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
            body: ProfileOverview(profile: widget.save.profile),
          ),
        ],
      ),
    );
  }
}
