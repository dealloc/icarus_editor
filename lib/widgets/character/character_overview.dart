import 'package:fluent_ui/fluent_ui.dart';

import '../../services/icarus_character.dart';
import 'character_stats.dart';

class CharacterOverview extends StatefulWidget {
  final IcarusCharacter character;

  const CharacterOverview({super.key, required this.character});

  @override
  State<CharacterOverview> createState() => _CharacterOverviewState();
}

class _CharacterOverviewState extends State<CharacterOverview> {
  int activeTab = 0;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: const Color(0xFFFFFFFF),
      child: Center(
        child: TabView(
          currentIndex: activeTab,
          onChanged: (value) => setState(() => activeTab = value),
          closeButtonVisibility: CloseButtonVisibilityMode.never,
          tabs: [
            Tab(
              text: const Text('Stats'),
              body: CharacterStats(character: widget.character),
            ),
          ],
        ),
      ),
    );
  }
}
