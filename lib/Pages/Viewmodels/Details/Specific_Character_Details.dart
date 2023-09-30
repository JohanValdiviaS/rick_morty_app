// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:rick_morty/Core/Entities/Character_Entity.dart';
import 'package:rick_morty/Core/styles/Styles_Characters_Details.dart';

class SpecificCharacterView extends StatelessWidget {
  final Character character;

  const SpecificCharacterView({Key? key, required this.character})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
        flexibleSpace: Image.network(
          'https://w0.peakpx.com/wallpaper/164/767/HD-wallpaper-rick-morty-rick-and-morty-rick-y-morty.jpg', // Reemplaza con la URL de tu imagen de encabezado
          fit: BoxFit.fitWidth,
        ),
        backgroundColor: const Color.fromARGB(213, 50, 197, 45),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(character.imageUrl),
                ),
                widthCharact,
                Text(
                  character.name,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            heightCharact,
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 40,
                  decoration: CharacterBox,
                  child: Center(
                    child: Text(
                      'ID: ${character.id}',
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
                      'Estado: ${character.status}',
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
                      'Especie: ${character.species}',
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
                      'Tipo: ${character.type}',
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
                      'Género: ${character.gender}',
                      style: textChar,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
