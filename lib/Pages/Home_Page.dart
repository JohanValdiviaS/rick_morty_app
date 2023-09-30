// ignore_for_file: file_names

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:rick_morty/Pages/First%20Screens/Characters_View.dart';
import 'package:rick_morty/Pages/First%20Screens/Episodes_View.dart';
import 'package:rick_morty/Pages/First%20Screens/Search_Characters_View.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeIn(
        duration: const Duration(seconds: 2),
        child: SingleChildScrollView(
          child: Container(
            color: const Color.fromARGB(255, 211, 167, 35),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Image.network(
                    width: MediaQuery.of(context).size.width - 20,
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b1/Rick_and_Morty.svg/1200px-Rick_and_Morty.svg.png",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.network(
                      width: MediaQuery.of(context).size.width - 20,
                      "https://hips.hearstapps.com/hmg-prod/images/rick-y-morty-2-4-1626109423.jpg?crop=0.9968253968253968xw:1xh;center,top&resize=1200:*",
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 20,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        backgroundColor:
                            const Color.fromARGB(255, 81, 192, 140),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CharactersView(),
                          ),
                        );
                      },
                      child: const Text(
                        'Characters',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.network(
                      width: MediaQuery.of(context).size.width - 20,
                      "https://ic.c4assets.com/brands/rick-and-morty/25061866-e35b-405b-9cb4-cb71748e9592.jpg?interpolation=progressive-bicubic&output-format=jpeg&output-quality=90{&resize}",
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 20,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        backgroundColor:
                            const Color.fromARGB(255, 81, 192, 140),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EpisodesView(),
                          ),
                        );
                      },
                      child: const Text(
                        'Episodes',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.network(
                      width: MediaQuery.of(context).size.width - 20,
                      "https://i.ytimg.com/vi/58-gZTQ36LU/maxresdefault.jpg",
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 20,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        backgroundColor:
                            const Color.fromARGB(255, 81, 192, 140),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SearchCharacterView(),
                          ),
                        );
                      },
                      child: const Text(
                        'Search Character',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
