import 'package:fluent_ui/fluent_ui.dart';

import '../../services/icarus_character.dart';
import 'character_stats.dart';

class CharacterOverview extends StatelessWidget {
  final IcarusCharacter character;

  const CharacterOverview({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: FluentTheme.of(context).scaffoldBackgroundColor,
      child: Center(
        child: CharacterStats(character: character),
      ),
    );
  }
}
