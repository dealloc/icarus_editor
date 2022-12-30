import 'package:fluent_ui/fluent_ui.dart';
import 'package:icarus_editor/services/icarus_profile.dart';

class ProfileOverview extends StatelessWidget {
  final IcarusProfile profile;

  const ProfileOverview({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: FluentTheme.of(context).scaffoldBackgroundColor,
      child: Center(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Currency'),
              subtitle: Text('${profile.credits}'),
            ),
            ListTile(
              title: const Text('Exotics'),
              subtitle: Text('${profile.exotics}'),
            ),
            ListTile(
              title: const Text('Refund tokens'),
              subtitle: Text('${profile.refundTokens}'),
            ),
          ],
        ),
      ),
    );
  }
}
