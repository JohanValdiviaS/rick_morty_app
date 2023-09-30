// ignore_for_file: file_names, implementation_imports, depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:characters/src/characters.dart';
import 'package:rick_morty/Data/Models/Events/characters_event.dart';
import 'package:rick_morty/Data/Models/States/characters_state.dart';
import 'package:rick_morty/Data/Network/Rick_Morty_API.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final RickAndMortyApiProvider apiProvider = RickAndMortyApiProvider();

  CharacterBloc() : super(CharacterInitial());

  Stream<CharacterState> mapEventToState(CharacterEvent event) async* {
    if (event is FetchCharacters) {
      yield CharacterLoading();
      try {
        final characters = await apiProvider.fetchCharacter();
        yield CharacterLoaded(characters.cast<Characters>());
      } catch (e) {
        yield CharacterError(e.toString());
      }
    } else if (event is SearchCharacters) {
      yield CharacterLoading();
      try {
        final characters = await apiProvider.searchCharacters(event.query);
        yield CharacterLoaded(characters.cast<Characters>());
      } catch (e) {
        yield CharacterError(e.toString());
      }
    }
  }
}
