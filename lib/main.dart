import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icarus_editor/widgets/editor_navigation.dart';
import 'bloc/characters_bloc.dart';

Future main() async {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      home: BlocProvider<CharactersBloc>(
        create: (context) => CharactersBloc(),
        child: const _Application(),
      ),
    );
  }
}

class _Application extends StatelessWidget {
  const _Application();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharactersBloc, CharactersState>(
      builder: (context, state) {
        if (state is CharactersLoadingState) {
          return _buildLoading(context);
        } else if (state is CharactersFailedToLoadState) {
          return _buildFailed(context, state);
        } else if (state is CharactersLoadedState) {
          return EditorNavigation(characters: state.characters);
        }

        return const Center(child: Text('unknown state...'));
      },
    );
  }

  Widget _buildLoading(BuildContext context) {
    return const ColoredBox(
      color: Color(0xFFFFFFFF),
      child: Center(
        child: ProgressRing(),
      ),
    );
  }

  Widget _buildFailed(BuildContext context, CharactersFailedToLoadState state) {
    return ColoredBox(
      color: const Color(0xFFFFFFFF),
      child: Center(
        child: InfoBar(
          title: const Text('Icarus failed to load'),
          severity: InfoBarSeverity.error,
          content: Text(state.exception?.toString() ??
              'Failed to load Icarus character files'),
        ),
      ),
    );
  }
}
