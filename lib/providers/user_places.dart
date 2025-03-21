import 'package:favoritePlacesApp/models/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserPlacesNotifier extends StateNotifier<List<Place>> {
  UserPlacesNotifier() : super(const []);

  void addPlace(Place place){
    state = List.from(state)..add(place);
  }
}

final userPlacesProvider = StateNotifierProvider<UserPlacesNotifier,List<Place>>((ref) => UserPlacesNotifier());
