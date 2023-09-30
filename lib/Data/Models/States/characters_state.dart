import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class CharacterState extends Equatable {
  const CharacterState();

  @override
  List<Object?> get props => [];
}

class CharacterInitial extends CharacterState {}

class CharacterLoading extends CharacterState {}

class CharacterLoaded extends CharacterState {
  final List<Characters> characters;

  const CharacterLoaded(this.characters);

  @override
  List<Object?> get props => [characters];
}

class CharacterError extends CharacterState {
  final String errorMessage;

  const CharacterError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
