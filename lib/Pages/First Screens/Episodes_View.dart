// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:rick_morty/Core/Entities/Episode_Entity.dart';
import 'package:rick_morty/Data/Network/Rick_Morty_API.dart';
import 'package:rick_morty/Pages/Viewmodels/Details/Episode_Details.dart';

class EpisodesView extends StatefulWidget {
  const EpisodesView({Key? key}) : super(key: key);

  @override
  _EpisodesViewState createState() => _EpisodesViewState();
}

class _EpisodesViewState extends State<EpisodesView> {
  final apiProvider = RickAndMortyApiProvider();

  // Función para navegar a la vista de detalles del episodio
  void _navigateToEpisodeDetail(Episode episode) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EpisodeDetailView(episode: episode),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Episodios',
        ),
        flexibleSpace: Image.network(
          'https://img4.hulu.com/user/v3/artwork/d76d6361-3fbf-4842-8dd7-e05520557280?base_image_bucket_name=image_manager&base_image=fd92659b-534b-49d2-af0a-799184549e98&size=1200x630&format=jpeg&operations=%5B%7B%22gradient_vector%22%3A%22(0%2C0%2C0%2C0.5)%7C(0%2C0%2C0%2C0)%7C(0%2C600)%7C(0%2C240)%22%7D%2C%7B%22overlay%22%3A%7B%22position%22%3A%22SouthEast%7C(30%2C30)%22%2C%22operations%22%3A%5B%7B%22image%22%3A%22image_manager%7Ce98f60f9-7b4e-4306-b500-4ca22f456fde%22%7D%2C%7B%22resize%22%3A%22204x204%7Cmax%22%7D%2C%7B%22extent%22%3A%22204x204%22%7D%5D%7D%7D%2C%5D',
          fit: BoxFit.cover,
        ),
      ),
      body: SlideInRight(
        duration: const Duration(seconds: 2),
        child: FutureBuilder<List<Episode>>(
          future: apiProvider.fetchEpisode(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Color.fromARGB(211, 37, 255, 30),
                ),
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Text('No episodes found.');
            } else {
              final episodes = snapshot.data!;
              return ListView.builder(
                itemCount: episodes.length,
                itemBuilder: (context, index) {
                  final episode = episodes[index];
                  return InkWell(
                    onTap: () {
                      _navigateToEpisodeDetail(episode);
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width - 25,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 235, 203, 99),
                              border: Border.all(
                                color: const Color.fromARGB(211, 37, 255, 30),
                                width: 4.0,
                              ),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: ListTile(
                              title: Text(episode.name),
                              subtitle: Text(
                                'Episodio ${episode.episode} - Estreno ${episode.airDate}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
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
