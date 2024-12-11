import '../Models/Character.dart';
import '../WebSercices/Character_Web_Services.dart';

class CharacterRepositry {
  final CharacterWebServices characterWebServices;

  CharacterRepositry({required this.characterWebServices});

  Future<List<Character>> getAllCharacters() async {
    final characters = await characterWebServices.getAllCharacters();
    return characters.map((character) => Character.fromJson(character)).toList();
  }
}
