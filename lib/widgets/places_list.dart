import 'package:favoritePlacesApp/models/place.dart';
import 'package:favoritePlacesApp/screens/place_details.dart';
import 'package:flutter/material.dart';

class PlacesList extends StatelessWidget {
  PlacesList({required this.places, super.key});

  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    if (places.isEmpty || places.length == 0) {
      return Center(
        child: Text(
          'No places added yet.',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.white),
        ),
      );
    }

    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: FileImage(places[index].image),
          ),
          title: Text(
            places[index].title,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Colors.white),
          ),
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => PlaceDetails(place: places[index])));
          },
        );
      },
    );
  }
}
