import 'package:flutter_breaking/data/models/characters.dart';
import 'package:flutter_breaking/data/web_services/characters_web_services.dart';

class CharactersRepository {

  /// object from WebService class
  final CharactersWebServices charactersWebServices;

  CharactersRepository(this.charactersWebServices);

  /// A function that call the function of web_service module and implement mapping from model class
  Future<List<Character>> getAllCharacters() async {
    final characters = await charactersWebServices.getAllCharacters();
    return characters
        .map((character) => Character.fromJson(character))
        .toList();
  }
}
