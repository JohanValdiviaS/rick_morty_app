import 'package:equatable/equatable.dart';
import 'package:rick_morty/Core/Entities/Character_Entity.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object?> get props => [];
}

class SearchInitialState extends SearchState {}

class SearchLoadingState extends SearchState {}

class SearchSuccessState extends SearchState {
  final List<Character> searchResults;

  const SearchSuccessState(this.searchResults);

  @override
  List<Object?> get props => [searchResults];
}

class SearchErrorState extends SearchState {
  final String errorMessage;

  const SearchErrorState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
