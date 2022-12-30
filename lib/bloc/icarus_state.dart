part of 'icarus_bloc.dart';

@immutable
abstract class IcarusState {}

class IcarusLoadingState extends IcarusState {}

class IcarusFailedToLoadState extends IcarusState {
  final Exception? exception;

  IcarusFailedToLoadState(this.exception);
}

class IcarusLoadedState extends IcarusState {
  final IcarusSave save;

  IcarusLoadedState(this.save);
}
