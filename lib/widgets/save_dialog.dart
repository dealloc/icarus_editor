import 'package:fluent_ui/fluent_ui.dart';

Future<bool> showSaveDialog(BuildContext context) async {
  return await showDialog<bool>(
        context: context,
        builder: (context) {
          return ContentDialog(
            title: const Text('Are you sure?'),
            content: const Text(
                'Saving your changes will modify your Icarus files, ensure you have a backup and don\'t blame me if things break'),
            actions: [
              Button(
                child: const Text('Cancel'),
                onPressed: () => Navigator.pop(context, false),
              ),
              FilledButton(
                child: const Text('Save'),
                onPressed: () => Navigator.pop(context, true),
              ),
            ],
          );
        },
      ) ??
      false;
}
