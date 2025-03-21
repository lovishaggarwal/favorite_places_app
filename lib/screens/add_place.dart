import 'dart:io';

import 'package:favoritePlacesApp/models/place.dart';
import 'package:favoritePlacesApp/providers/user_places.dart';
import 'package:favoritePlacesApp/widgets/image_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlaceScreen extends ConsumerWidget {
  const AddPlaceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _formKey = GlobalKey<FormState>();
    String? placeName;
    File? imageFile;

    void savePlace() async {
      if (_formKey.currentState!.validate() && imageFile != null) {
        _formKey.currentState!.save();
        print(placeName);
        ref
            .read(userPlacesProvider.notifier)
            .addPlace(Place(title: placeName!, image: imageFile!));
        Navigator.pop(context);
      }
      if (imageFile == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please select an image'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add New Place',
          maxLines: 1,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                  maxLength: 50,
                  decoration: InputDecoration(
                    hintText: 'Title',
                  ),
                  validator: (value) => (value == null ||
                          value.isEmpty ||
                          value.trim().length <= 1)
                      ? 'Please enter a valid place name'
                      : null,
                  onSaved: (newValue) => placeName = newValue,
                ),
                SizedBox(height: 10),
                ImageInput(
                  onImageSelected: (image) {
                    imageFile = image;
                  },
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _formKey.currentState!.reset();
                      },
                      child: const Text('Reset'),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: savePlace,
                      child: const Text('Add Place'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
