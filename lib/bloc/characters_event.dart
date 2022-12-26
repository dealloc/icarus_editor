part of 'characters_bloc.dart';

abstract class CharactersEvent {}

class CharactersLoadedEvent extends CharactersEvent {
  final List<IcarusCharacter> characters;

  CharactersLoadedEvent(this.characters);
}

class CharactersFailedToLoadEvent extends CharactersEvent {
  Exception? exception;

  CharactersFailedToLoadEvent(this.exception);
}
