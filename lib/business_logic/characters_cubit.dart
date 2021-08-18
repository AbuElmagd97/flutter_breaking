import 'package:bloc/bloc.dart';
import 'package:flutter_breaking/data/models/characters.dart';
import 'package:flutter_breaking/data/repository/characters_repository.dart';
import 'package:meta/meta.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {

  /// object from repo
  final CharactersRepository charactersRepository;

  /// initialize the list
  List<Character> characters = [];

  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

  /// function that emit the successful state (Loaded List)
  List<Character> getAllCharacters() {
    charactersRepository.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters));
      this.characters = characters;
    });
    return characters;
  }
}
