import 'package:favoritePlacesApp/models/place.dart';
import 'package:favoritePlacesApp/providers/user_places.dart';
import 'package:favoritePlacesApp/screens/add_place.dart';
import 'package:favoritePlacesApp/widgets/places_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesScreen extends ConsumerWidget {
  const PlacesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Place> userPlaces = ref.watch(userPlacesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Places',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddPlaceScreen()),
                );
              },
              icon: Icon(Icons.add)),
        ],
      ),
      body: SafeArea(
        child: PlacesList(places: userPlaces),
      ),
    );
  }
}
