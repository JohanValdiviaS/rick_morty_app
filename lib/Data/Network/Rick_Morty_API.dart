// ignore_for_file: file_names

import 'package:dio/dio.dart';
import 'package:rick_morty/Core/Entities/Character_Entity.dart';
import 'package:rick_morty/Core/Entities/Episode_Entity.dart';

class RickAndMortyApiProvider {
  final Dio _dio = Dio();

  Future<List<Character>> fetchCharacter() async {
    try {
      final response =
          await _dio.get('https://rickandmortyapi.com/api/character');

      if (response.statusCode == 200) {
        final data = response.data['results'] as List<dynamic>;
        final character = data.map((json) => Character.fromJson(json)).toList();
        return character;
      } else {
        throw Exception('Failed to load character');
      }
    } catch (e) {
      throw Exception('Failed to load character: $e');
    }
  }

  Future<List<Episode>> fetchEpisode() async {
    try {
      final response =
          await _dio.get('https://rickandmortyapi.com/api/episode');

      if (response.statusCode == 200) {
        final data = response.data['results'] as List<dynamic>;
        final episodes = data.map((json) => Episode.fromJson(json)).toList();

        return episodes;
      } else {
        throw Exception('Failed to load episodes: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load episodes: $e');
    }
  }

  Future<List<Character>> searchCharacters(String query) async {
    try {
      final response = await _dio.get(
          'https://rickandmortyapi.com/api/character',
          queryParameters: {'name': query});

      if (response.statusCode == 200) {
        final data = response.data['results'] as List<dynamic>;
        final character = data.map((json) => Character.fromJson(json)).toList();
        return character;
      } else {
        throw Exception('Failed to search characters');
      }
    } catch (e) {
      throw Exception('Failed to search characters: $e');
    }
  }
}
