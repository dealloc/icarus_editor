import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icarus_editor/bloc/icarus_bloc.dart';
import 'package:icarus_editor/widgets/editor_navigation.dart';

Future main() async {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      theme: FluentThemeData.light(),
      darkTheme: FluentThemeData.dark(),
      themeMode: ThemeMode.system,
      home: BlocProvider<IcarusBloc>(
        create: (context) => IcarusBloc(),
        child: const _Application(),
      ),
    );
  }
}

class _Application extends StatelessWidget {
  const _Application();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IcarusBloc, IcarusState>(
      builder: (context, state) {
        if (state is IcarusLoadingState) {
          return _buildLoading(context);
        } else if (state is IcarusFailedToLoadState) {
          return _buildFailed(context, state);
        } else if (state is IcarusLoadedState) {
          return EditorNavigation(save: state.save);
        }

        return const Center(child: Text('unknown state...'));
      },
    );
  }

  Widget _buildLoading(BuildContext context) {
    return ColoredBox(
      color: FluentTheme.of(context).scaffoldBackgroundColor,
      child: const Center(
        child: ProgressRing(),
      ),
    );
  }

  Widget _buildFailed(BuildContext context, IcarusFailedToLoadState state) {
    return ColoredBox(
      color: FluentTheme.of(context).scaffoldBackgroundColor,
      child: Center(
        child: InfoBar(
          title: const Text('Icarus failed to load'),
          severity: InfoBarSeverity.error,
          content: Text(state.exception?.cause ??
              'Failed to load Icarus character files'),
        ),
      ),
    );
  }
}
