// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:rick_morty/Core/Entities/Character_Entity.dart';
import 'package:rick_morty/Data/Network/Rick_Morty_API.dart';
import 'package:rick_morty/Pages/Viewmodels/Details/Character_Details.dart';

class CharactersView extends StatefulWidget {
  const CharactersView({Key? key}) : super(key: key);

  @override
  _CharactersViewState createState() => _CharactersViewState();
}

class _CharactersViewState extends State<CharactersView> {
  final apiProvider = RickAndMortyApiProvider();
  late Future<List<Character>> characters;

  @override
  void initState() {
    super.initState();
    characters = apiProvider.fetchCharacter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Image.network(
          'https://www.nme.com/wp-content/uploads/2022/10/Rick_And_Morty_Portal_Gun_JuRicksic_Mort.jpg',
          fit: BoxFit.cover,
        ),
        title: const Text(
          'Characters',
        ),
        backgroundColor: const Color.fromARGB(213, 50, 197, 45),
      ),
      body: SlideInRight(
        duration: const Duration(seconds: 2),
        child: FutureBuilder<List<Character>>(
          future: characters,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Color.fromARGB(213, 50, 197, 45),
                ),
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Text('No characters found.');
            } else {
              final charactersList = snapshot.data!;
              return ListView.builder(
                itemCount: charactersList.length,
                itemBuilder: (context, index) {
                  final character = charactersList[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CharacterDetail(character: character),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width - 25,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(212, 123, 136, 123),
                              border: Border.all(
                                color: Colors.black,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: ListTile(
                              title: Text(
                                character.name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                character.status,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              leading: CircleAvatar(
                                radius: 40,
                                backgroundImage:
                                    NetworkImage(character.imageUrl),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
