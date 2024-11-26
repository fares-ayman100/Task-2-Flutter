import 'package:bloc/bloc.dart';
import 'package:breaking_bad/Data/Models/Character.dart';
import 'package:breaking_bad/Data/Repositry/character_repositry.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  final CharacterRepositry characterRepositry;
  List<Character> characters = [];

  CharacterCubit(this.characterRepositry) : super(CharacterInitial());

  Future<List<Character>> getAllCharacters() async {
    final charactersList = await characterRepositry.getAllCharacters();
    characters = charactersList;
    emit(CharacterLoaded(characters));
    return charactersList;
  }
}
