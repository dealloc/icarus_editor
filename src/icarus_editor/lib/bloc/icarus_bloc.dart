import 'package:bloc/bloc.dart';
import 'package:icarus_editor/exceptions/icarus_exception.dart';
import 'package:icarus_editor/services/icarus_save.dart';
import 'package:meta/meta.dart';

import '../services/folders.dart';

part 'icarus_event.dart';
part 'icarus_state.dart';

class IcarusBloc extends Bloc<IcarusEvent, IcarusState> {
  IcarusBloc() : super(IcarusLoadingState()) {
    _init().onError<Exception>(
      (error, stacktrace) =>
          add(IcarusFailedToLoadEvent(IcarusException(error.toString()))),
    );

    on<IcarusFailedToLoadEvent>((event, emit) {
      emit(IcarusFailedToLoadState(event.exception));
    });

    on<IcarusLoadedEvent>((event, emit) {
      emit(IcarusLoadedState(event.save));
    });

    on<IcarusResetRequestedEvent>((event, emit) async {
      emit(IcarusLoadingState());

      try {
        await _init();
      } on Exception catch (error) {
        emit(IcarusFailedToLoadState(IcarusException(error.toString())));
      }
    });

    on<IcarusSaveRequestedEvent>((event, emit) async {
      if (state is IcarusLoadedState) {
        IcarusSave save = (state as IcarusLoadedState).save;
        emit(IcarusLoadingState());
        await save.saveChanges();

        add(IcarusResetRequestedEvent());
        return;
      }

      emit(IcarusFailedToLoadState(const IcarusException(
          'Cannot save unless the application is ready')));
    });
  }

  Future _init() async {
    var directory = await getIcarusSaveFolder();
    var icarus = IcarusSave(directory: directory);
    await icarus.initialize();

    add(IcarusLoadedEvent(icarus));
  }
}
