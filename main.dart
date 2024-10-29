import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/favorites_screen.dart';
import 'screens/artwork_detail_screen.dart';
import 'screens/artist_profile_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/artworks_screen.dart'; // Include ArtworksScreen

void main() {
  runApp(ArtGalleryApp());
}

class ArtGalleryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Art Gallery',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
        '/home': (context) => HomeScreen(),
        '/artworks': (context) => ArtworksScreen(),
        '/favorites': (context) => FavoritesScreen(),
        '/artwork-detail': (context) => ArtworkDetailScreen(
          title: '',
          artist: '',
          imageUrl: '',
        ),
        '/artist-profile': (context) => ArtistProfileScreen(
          artistName: '',
          biography: '',
          artworks: [],
        ),
      },
    );
  }
}
