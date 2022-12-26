part of 'characters_bloc.dart';

abstract class CharactersState {}

class CharactersLoadingState extends CharactersState {}

class CharactersFailedToLoadState extends CharactersState {
  Exception? exception;

  CharactersFailedToLoadState(this.exception);
}

class CharactersLoadedState extends CharactersState {
  final List<IcarusCharacter> characters;

  CharactersLoadedState(this.characters);
}
