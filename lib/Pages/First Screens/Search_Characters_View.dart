// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:animate_do/animate_do.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rick_morty/Core/Entities/Character_Entity.dart';
import 'package:rick_morty/Data/Network/Rick_Morty_API.dart';
import 'package:rick_morty/Pages/Viewmodels/Details/Specific_Character_Details.dart';

class SearchCharacterView extends StatefulWidget {
  const SearchCharacterView({Key? key}) : super(key: key);

  @override
  _SearchCharacterViewState createState() => _SearchCharacterViewState();
}

class _SearchCharacterViewState extends State<SearchCharacterView> {
  final apiProvider = RickAndMortyApiProvider();
  final TextEditingController _searchController = TextEditingController();
  List<Character> _searchResults = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buscador de Personajes'),
        flexibleSpace: Image.network(
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmbRPJ5o9oNU17Lv2ErNoxRa7l9Mi_za3jpDXbbWEguigYAsFEkzq5styG9YefVZC1Vuo&usqp=CAU',
          fit: BoxFit.cover,
        ),
      ),
      body: Column(
        children: [
          FadeIn(
            duration: const Duration(seconds: 1),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: const Color.fromARGB(255, 78, 145, 52),
                    width: 3,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      labelText: 'Buscar Personaje',
                      labelStyle: const TextStyle(
                        color: Color.fromARGB(212, 13, 129, 9),
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.search),
                        color: const Color.fromARGB(212, 13, 129, 9),
                        onPressed: () {
                          _searchCharacters();
                        },
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(212, 13, 129, 9),
                          width: 2.0,
                        ),
                      ),
                    ),
                    style: const TextStyle(
                      color: Color.fromARGB(212, 13, 129, 9),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: _searchResults.isEmpty
                ? const Center(
                    child: Text('Ingresa un nombre para realizar la Busqueda'),
                  )
                : ListView.builder(
                    itemCount: _searchResults.length,
                    itemBuilder: (context, index) {
                      final character = _searchResults[index];
                      return ListTile(
                        title: Text(character.name),
                        subtitle: Text(character.status),
                        leading: CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(character.imageUrl),
                        ),
                        onTap: () {
                          _showCharacterDetail(character);
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  void _searchCharacters() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      apiProvider.searchCharacters(query).then((characters) {
        setState(() {
          _searchResults = characters;
        });
      }).catchError((error) {
        if (kDebugMode) {
          print('Error: $error');
        }
      });
    }
  }

  void _showCharacterDetail(Character character) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SpecificCharacterView(character: character),
      ),
    );
  }
}
