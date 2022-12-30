import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icarus_editor/services/icarus_save.dart';
import 'package:icarus_editor/widgets/inventory/inventory_overview.dart';
import 'package:icarus_editor/widgets/profile/profile_overview.dart';
import 'package:icarus_editor/widgets/save_dialog.dart';

import '../bloc/icarus_bloc.dart';
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
      appBar: const NavigationAppBar(
        title: Text('Icarus Character editor'),
        automaticallyImplyLeading: false,
      ),
      pane: NavigationPane(
        selected: _activeCharacter,
        onChanged: (value) => setState(() => _activeCharacter = value),
        displayMode: PaneDisplayMode.auto,
        items: [
          for (var character in widget.save.characters)
            PaneItem(
              icon: const Icon(FluentIcons.sync_status),
              title: Text('${character.name} (${character.xp} XP)'),
              body: CharacterOverview(character: character),
            )
        ],
        footerItems: [
          PaneItemHeader(
            header: const Text('Global'),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.all_apps),
            title: const Text('Inventory'),
            body: InventoryOverview(inventory: widget.save.inventory),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.user_window),
            title: const Text('Profile'),
            body: ProfileOverview(profile: widget.save.profile),
          ),
          // Actions
          PaneItemHeader(
            header: const Text('Actions'),
          ),
          PaneItemAction(
            icon: const Icon(FluentIcons.save),
            title: const Text('Save all changes'),
            onTap: () async {
              if (await showSaveDialog(context)) {
                context.read<IcarusBloc>().add(IcarusSaveRequestedEvent());
              }
            },
          ),
          PaneItemAction(
            icon: const Icon(FluentIcons.reset),
            title: const Text('Reset all changes'),
            onTap: () {
              context.read<IcarusBloc>().add(IcarusResetRequestedEvent());
            },
          ),
        ],
      ),
    );
  }
}
