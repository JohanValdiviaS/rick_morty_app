// ignore_for_file: file_names

import 'package:bloc/bloc.dart';
import 'package:rick_morty/Data/Models/Events/search_event.dart';
import 'package:rick_morty/Data/Models/States/search_state.dart';
import 'package:rick_morty/Data/Network/Rick_Morty_API.dart';

class SearchCharacterBloc extends Bloc<SearchEvent, SearchState> {
  final RickAndMortyApiProvider apiProvider = RickAndMortyApiProvider();

  SearchCharacterBloc() : super(SearchInitialState());

  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is SearchCharactersEvent) {
      yield SearchLoadingState();
      try {
        final characters = await apiProvider.searchCharacters(event.query);
        yield SearchSuccessState(characters);
      } catch (e) {
        yield SearchErrorState(e.toString());
      }
    }
  }
}
