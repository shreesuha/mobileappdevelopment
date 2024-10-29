import 'package:flutter/material.dart';

class ArtworkDetailScreen extends StatelessWidget {
  final String title;
  final String artist;
  final String imageUrl;

  ArtworkDetailScreen({required this.title, required this.artist, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(imageUrl, height: 300, fit: BoxFit.cover),
            SizedBox(height: 20),
            Text(
              title,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Text(
              artist,
              style: TextStyle(fontSize: 20, color: Colors.grey[700]),
            ),
            SizedBox(height: 20),
            Text(
              'Creativity is allowing oneself to make mistakes. Art is knowing which ones to keep..',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
