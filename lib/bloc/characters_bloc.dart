import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:icarus_editor/services/folders.dart';
import 'package:icarus_editor/services/icarus_character.dart';
import 'package:icarus_editor/services/icarus_save.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  CharactersBloc() : super(CharactersLoadingState()) {
    _init().onError<Exception>(
      (error, stacktrace) => add(CharactersFailedToLoadEvent(error)),
    );

    on<CharactersFailedToLoadEvent>((event, emit) {
      emit(CharactersFailedToLoadState(event.exception));
    });

    on<CharactersLoadedEvent>((event, emit) {
      emit(CharactersLoadedState(event.characters));
    });
  }

  Future _init() async {
    var directory = await getIcarusSaveFolder();
    var icarus = IcarusSave(directory: directory);
    await icarus.initialize();

    add(CharactersLoadedEvent(icarus.characters));
  }
}
