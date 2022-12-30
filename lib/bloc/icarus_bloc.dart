import 'package:bloc/bloc.dart';
import 'package:icarus_editor/services/icarus_save.dart';
import 'package:meta/meta.dart';

import '../services/folders.dart';

part 'icarus_event.dart';
part 'icarus_state.dart';

class IcarusBloc extends Bloc<IcarusEvent, IcarusState> {
  IcarusBloc() : super(IcarusLoadingState()) {
    _init().onError<Exception>(
      (error, stacktrace) => add(IcarusFailedToLoadEvent(error)),
    );

    on<IcarusFailedToLoadEvent>((event, emit) {
      emit(IcarusFailedToLoadState(event.exception));
    });

    on<IcarusLoadedEvent>((event, emit) {
      emit(IcarusLoadedState(event.save));
    });
  }

  Future _init() async {
    var directory = await getIcarusSaveFolder();
    var icarus = IcarusSave(directory: directory);
    await icarus.initialize();

    add(IcarusLoadedEvent(icarus));
  }
}
