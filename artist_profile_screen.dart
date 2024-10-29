import 'package:artgallery/screens/artwork_detail_screen.dart';
import 'package:flutter/material.dart';

class ArtistProfileScreen extends StatelessWidget {
  final String artistName;
  final String biography;
  final List<Map<String, String>> artworks;

  ArtistProfileScreen({required this.artistName, required this.biography, required this.artworks});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(artistName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              artistName,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              biography,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Artworks by $artistName',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            // Example of displaying artworks (static for now)
            Expanded(
              child: ListView.builder(
                itemCount: artworks.length,
                itemBuilder: (ctx, i) => ListTile(
                  leading: Image.network(artworks[i]['image']!),
                  title: Text(artworks[i]['title']!),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ArtworkDetailScreen(
                        title: artworks[i]['title']!,
                        artist: artistName,
                        imageUrl: artworks[i]['image']!,
                      ),
                    ));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
