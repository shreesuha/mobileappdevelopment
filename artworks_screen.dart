import 'package:flutter/material.dart';
import 'artwork_detail_screen.dart';



class ArtworksScreen extends StatefulWidget {
  @override
  _ArtworksScreenState createState() => _ArtworksScreenState();
}

class _ArtworksScreenState extends State<ArtworksScreen> {
  final List<Map<String, String>> artworks = [
    {
      'title': 'Lord Of God',
      'artist': 'Ganesh',
      'imageUrl': 'assets/art11.jpg',
    },
    {
      'title': 'Floweral',
      'artist': 'Vaishu',
      'imageUrl': 'assets/art2.jpg',
    },
    {
      'title': 'Buddha',
      'artist': 'Miruthula',
      'imageUrl': 'assets/art13.jpg',
    },
    {
      'title': 'Girl',
      'artist': 'Shree',
      'imageUrl': 'assets/art4.jpg',
    },
    {
      'title': 'Nature',
      'artist': 'Kavya',
      'imageUrl': 'assets/art5.jpg',
    },
    {
      'title': 'Floweral Painting',
      'artist': 'Malavika',
      'imageUrl': 'assets/art6.jpg',
    },
    {
      'title': 'Forest',
      'artist': 'Rishi',
      'imageUrl': 'assets/art17.jpg',
    },
    {
      'title': 'Flower Vase',
      'artist': 'Pooja',
      'imageUrl': 'assets/art8.jpg',
    },
  ];

  // List to store favorite artworks
  List<Map<String, String>> favoriteArtworks = [];

  void _toggleFavorite(Map<String, String> artwork) {
    setState(() {
      if (favoriteArtworks.contains(artwork)) {
        favoriteArtworks.remove(artwork);
      } else {
        favoriteArtworks.add(artwork);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Artworks'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/favorites',
                arguments: favoriteArtworks,
              );
            },
          ),
        ],
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: artworks.length,
        itemBuilder: (context, index) {
          final artwork = artworks[index];
          return GestureDetector(
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
            child: Card(
              child: Column(
                children: [
                  Expanded(
                    child: Image.asset(
                      artwork['imageUrl']!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      artwork['title']!,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      favoriteArtworks.contains(artwork)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: favoriteArtworks.contains(artwork)
                          ? Colors.red
                          : null,
                    ),
                    onPressed: () => _toggleFavorite(artwork),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
