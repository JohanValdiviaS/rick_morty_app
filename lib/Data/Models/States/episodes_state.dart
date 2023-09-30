import 'package:equatable/equatable.dart';
import 'package:rick_morty/Core/Entities/Episode_Entity.dart';

abstract class EpisodeState extends Equatable {
  const EpisodeState();

  @override
  List<Object?> get props => [];
}

class EpisodeInitial extends EpisodeState {}

class EpisodeLoading extends EpisodeState {}

class EpisodeLoaded extends EpisodeState {
  final List<Episode> episodes;

  const EpisodeLoaded(this.episodes);

  @override
  List<Object?> get props => [episodes];
}

class EpisodeError extends EpisodeState {
  final String errorMessage;

  const EpisodeError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
