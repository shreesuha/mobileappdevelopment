import 'package:flutter/material.dart';
import 'artwork_detail_screen.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Retrieve the favorite artworks passed as arguments
    final List<Map<String, String>> favoriteArtworks =
        ModalRoute.of(context)?.settings.arguments as List<Map<String, String>>? ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: favoriteArtworks.isEmpty
          ? Center(child: Text('No favorites yet!'))
          : ListView.builder(
              itemCount: favoriteArtworks.length,
              itemBuilder: (context, index) {
                final artwork = favoriteArtworks[index];
                return ListTile(
                  leading: Image.asset(
                    artwork['imageUrl']!,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(artwork['title']!),
                  subtitle: Text(artwork['artist']!),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ArtworkDetailScreen(
                          title: artwork['title']!,
                          artist: artwork['artist']!,
                          imageUrl: artwork['imageUrl']!,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
