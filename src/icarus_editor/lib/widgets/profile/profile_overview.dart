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
              subtitle: TextBox(
                initialValue: profile.credits.toString(),
                onChanged: (value) {
                  var number = int.tryParse(value);
                  if (number != null) {
                    profile.credits = number;
                  }
                },
              ),
            ),
            ListTile(
              title: const Text('Exotics'),
              subtitle: TextBox(
                initialValue: profile.exotics.toString(),
                onChanged: (value) {
                  var number = int.tryParse(value);
                  if (number != null) {
                    profile.exotics = number;
                  }
                },
              ),
            ),
            ListTile(
              title: const Text('Refund tokens'),
              subtitle: TextBox(
                initialValue: profile.refundTokens.toString(),
                onChanged: (value) {
                  var number = int.tryParse(value);
                  if (number != null) {
                    profile.refundTokens = number;
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
