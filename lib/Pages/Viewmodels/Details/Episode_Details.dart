// ignore_for_file: file_names

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:rick_morty/Core/Entities/Episode_Entity.dart';
import 'package:rick_morty/Core/styles/Styles_Characters_Details.dart';

class EpisodeDetailView extends StatelessWidget {
  final Episode episode;

  const EpisodeDetailView({super.key, required this.episode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Información del Episodio',
        ),
        flexibleSpace: Image.network(
          'https://cdn.jwplayer.com/v2/media/h7Ds1TGq/poster.jpg?width=720',
          fit: BoxFit.cover,
        ),
        backgroundColor: const Color.fromARGB(213, 50, 197, 45),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BounceInRight(
            duration: const Duration(seconds: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: CharacterBox,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: Text(
                        'Nombre: ${episode.name}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        height: 40,
                        decoration: CharacterBox,
                        child: Center(
                          child: Text(
                            'ID: ${episode.id}',
                            style: textChar,
                          ),
                        ),
                      ),
                      heightCharact,
                      Container(
                        height: 40,
                        decoration: CharacterBox,
                        child: Center(
                          child: Text(
                            'Fecha de Emisión: ${episode.airDate}',
                            style: textChar,
                          ),
                        ),
                      ),
                      heightCharact,
                      Container(
                        height: 40,
                        decoration: CharacterBox,
                        child: Center(
                          child: Text(
                            'Episodio: ${episode.episode}',
                            style: textChar,
                          ),
                        ),
                      ),
                      heightCharact,
                      Container(
                        decoration: CharacterBox,
                        child: Center(
                          child: Text(
                            'Personajes: ${episode.characters}',
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      heightCharact,
                      Container(
                        height: 40,
                        decoration: CharacterBox,
                        child: Center(
                          child: Text(
                            'Url: ${episode.url}',
                            style: textChar,
                          ),
                        ),
                      ),
                      heightCharact,
                      Container(
                        height: 40,
                        decoration: CharacterBox,
                        child: Center(
                          child: Text(
                            'Fecha de Creación: ${episode.created}',
                            style: textChar,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
