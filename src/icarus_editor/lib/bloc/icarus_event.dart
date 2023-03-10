part of 'icarus_bloc.dart';

@immutable
abstract class IcarusEvent {}

class IcarusLoadedEvent extends IcarusEvent {
  final IcarusSave save;

  IcarusLoadedEvent(this.save);
}

class IcarusFailedToLoadEvent extends IcarusEvent {
  final IcarusException? exception;

  IcarusFailedToLoadEvent(this.exception);
}

class IcarusSaveRequestedEvent extends IcarusEvent {}

class IcarusResetRequestedEvent extends IcarusEvent {}
