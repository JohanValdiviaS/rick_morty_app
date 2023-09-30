// ignore_for_file: file_names

import 'package:bloc/bloc.dart';
import 'package:rick_morty/Core/Entities/Episode_Entity.dart';
import 'package:rick_morty/Data/Models/Events/episodes_event.dart';
import 'package:rick_morty/Data/Models/States/episodes_state.dart';
import 'package:rick_morty/Data/Network/Rick_Morty_API.dart';

class EpisodeBloc extends Bloc<EpisodeEvent, EpisodeState> {
  final RickAndMortyApiProvider apiProvider = RickAndMortyApiProvider();

  EpisodeBloc() : super(EpisodeInitial());

  Stream<EpisodeState> mapEventToState(EpisodeEvent event) async* {
    if (event is FetchEpisodes) {
      yield EpisodeLoading();
      try {
        final episodes = await apiProvider.fetchEpisode();
        yield EpisodeLoaded(episodes.cast<Episode>());
      } catch (e) {
        yield EpisodeError(e.toString());
      }
    }
  }
}
