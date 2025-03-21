import 'package:favoritePlacesApp/models/place.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlaceDetails extends ConsumerWidget {
  const PlaceDetails({required this.place, super.key});

  final Place place;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          place.title,
          maxLines: 1,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Image.file(
              place.image,
              width: double.infinity,
            ),
          ],
        ),
      )
    );
  }
}
