import 'package:bloc/bloc.dart';
import '../../Data/Models/Character.dart';
import '../../Data/Repositry/character_repositry.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  final CharacterRepositry characterRepositry;
  List<Character> characters = [];

  CharacterCubit(this.characterRepositry) : super(CharacterInitial());

  List<Character> getAllCharacters() {
    characterRepositry.getAllCharacters().then((characters) {
      emit(CharacterLoaded(characters));
      this.characters = characters;
    });
    return characters;
  }
}
